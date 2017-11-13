using System.Diagnostics;

using PdfSharp.Drawing;
using PdfSharp.Pdf;
using System.Net.Mail;

namespace PDFConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            PdfDocument doc = new PdfDocument();
            doc.Info.Title = "Trainingsplan - Therapiezentrum Aist";

            //Beispieldaten
            string patient = "Max Mustermann";
            string therapeut = "Herr Hermann";
            string[] uebungen = { "kniebeugen", "sprünge", "situp", "hampelmann", "liegestütz", "andere Übungen" };
            string[] sets = { "3", "3", "4", "4", "9", "10" };
            string[] wiederholungen = { "5", "6", "7", "8", "9", "11" };
            string gender = "m";

            string[,] arr = { { "kniebeuge", "idk" }, { "3", "4" }, { "6", "8" } };
            // Create an empty page
            PdfPage page = doc.AddPage();

            // Get an XGraphics object for drawing
            XGraphics gfx = XGraphics.FromPdfPage(page);


            // Zeichnet das PDF
            drawLogo(gfx);
            header(gfx, patient, therapeut);
            drawTable(gfx);
            uebungenCount(gfx, uebungen, sets, wiederholungen, arr);


            // Save the document...
            const string filename = "Trainingsplan.pdf";
            doc.Save(filename);
            // ...and start a viewer.
            Process.Start(filename);

            // wenn man es per Mail versenden möchte 
             sendMail("GetFitAgain@outlook.de", "GetFitAgain@outlook.de", "smtp-mail.outlook.com", 587, patient, therapeut,gender);

            //wenn man es drucken möchte
           // printPDF();

        }
        public static void drawLogo(XGraphics gfx)
        {

            //LOGO RONNIE
            //XImage image2 = XImage.FromFile("D:\\Logo-ronnie.png");
            //const double dx = 250, dy = 140;
            //double width = (image2.PixelWidth * 72 / image2.HorizontalResolution) / 10;
            //double height = (image2.PixelHeight * 72 / image2.HorizontalResolution) / 10;
            //gfx.DrawImage(image2, (dx - width) / 2, (dy - height) / 2, width, height);

            //LOGO GFA
            XImage image = XImage.FromFile("D:\\logo.jpg");
            gfx.DrawImage(image, 500, 0, 100, 100);

            XImage logoRonnie = XImage.FromFile("D:\\Logo-ronnie.png");
            gfx.DrawImage(logoRonnie, 220, 720, 180, 100);
        }
        public static void header(XGraphics gfx, string patient, string therapeut)
        {
            XPen pen = new XPen(XColors.Black, 4);

            //XPdfFontOptions options = new XPdfFontOptions(PdfFontEncoding.Unicode, PdfFontEmbedding.Always);
            // Create a font
            XFont font = new XFont("Verdana", 20, XFontStyle.BoldItalic);
            // Headline, Trainingsplan
            gfx.DrawString("Trainingsplan", font, XBrushes.Black, 50, 50);
            // underline Headline
            gfx.DrawLine(pen, 50, 75, 520, 75);

            // Patient/Therapeut adden
            XFont fontname = new XFont("Verdana", 17, XFontStyle.BoldItalic);
            gfx.DrawString("Patient:", fontname, XBrushes.Black, 100, 125);
            gfx.DrawString(patient, fontname, XBrushes.Black, 190, 125);
            gfx.DrawString("Therapeut:", fontname, XBrushes.Black, 100, 150);
            gfx.DrawString(therapeut, fontname, XBrushes.Black, 215, 150);

        }
        public static void drawTable(XGraphics gfx)
        {
            XPen pen = new XPen(XColors.Black, 1);
            //Beim Anknüpfen mit dem Hauptprogramm, Anzahl der Zeilen = Anzahl der Übungen, 1 Zeile  ca 0,9cm
            // start x/y  end x/y
            XFont font = new XFont("Verdana", 17, XFontStyle.BoldItalic);
            gfx.DrawString("Übung", font, XBrushes.Black, 50, 270);
            gfx.DrawString("Dauer", font, XBrushes.Black, 385, 270);
            gfx.DrawString("Wdh.", font, XBrushes.Black, 465, 270);

            gfx.DrawLine(pen, 45, 250, 571, 250);
            gfx.DrawLine(pen, 45, 276, 571, 276);
            gfx.DrawLine(pen, 45, 250, 45, 703);
            gfx.DrawLine(pen, 381, 250, 381, 703);
            gfx.DrawLine(pen, 461, 250, 461, 703);
            gfx.DrawLine(pen, 571, 250, 571, 703);
            gfx.DrawLine(pen, 45, 703, 571, 703);

        }
        public static void uebungenCount(XGraphics gfx, string[] uebungen, string[] sets, string[] wiederholungen, string[,] arr)
        {
            int yStart = 295;
            int yAbstand = 15;
            XFont font = new XFont("Verdana", 10, XFontStyle.BoldItalic);
            for (int i = 0; i < uebungen.Length; i++)
            {
                gfx.DrawString(uebungen[i], font, XBrushes.Black, 50, yStart + (yAbstand * i));
                gfx.DrawString(sets[i], font, XBrushes.Black, 385, yStart + (yAbstand * i));
                gfx.DrawString(wiederholungen[i], font, XBrushes.Black, 465, yStart + (yAbstand * i));
            }

        }
        public static void printPDF()
        {
            Process proc = new Process();
            proc.StartInfo.CreateNoWindow = false;
            proc.StartInfo.Verb = "print";
            proc.StartInfo.FileName = "D:\\4.Klasse (Teil 2)\\4. Klasse\\C#\\PDFConverter\\PDFConverter\\bin\\Debug\\Trainingsplan.pdf";
            proc.Start();
            proc.WaitForExit(10000);
            proc.CloseMainWindow();
            proc.Close();
        }
        public static void sendMail(string absender, string empfaenger, string server, int port, string patient,string therapeut,string gender)
        {
            //muss man selbst eingeben/ändern
            Attachment data = new Attachment("D:\\4.Klasse (Teil 2)\\4. Klasse\\C#\\PDFConverter\\PDFConverter\\bin\\Debug\\Trainingsplan.pdf");
            SmtpClient SmtpServer = new SmtpClient(server);
            var mail = new MailMessage();
            mail.From = new MailAddress(absender);
            mail.To.Add(empfaenger);
            mail.Subject = "Trainingsplan";
            mail.IsBodyHtml = true;
            mail.Attachments.Add(data);
            string htmlBody;

            if (gender.Equals("m")) 
            {
                htmlBody = "Sehr geehrter Herr " + patient + ", <br><br> Im Anhang finden Sie Ihren, für Sie individuell erstellten Trainingsplan. Bei Fragen oder Unklarheiten zum Ablauf, melden Sie sich bitte umgehend bei mir.<br><br> Freundliche Grüße <br>" + therapeut;
            }
            if (gender.Equals("w"))
            {
                htmlBody = "Sehr geehrte Frau " + patient + ", <br><br> Im Anhang finden Sie Ihren, für Sie individuell erstellten Trainingsplan. Bei Fragen oder Unklarheiten zum Ablauf, melden Sie sich bitte umgehend bei mir.<br><br> Freundliche Grüße <br>" + therapeut;
            } else
                htmlBody = "ERROR you have not entered a correct gender. ";
            
            
            mail.Body = htmlBody;
            SmtpServer.Port = port;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential("GetFitAgain@outlook.de", "Passme34!");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
        }

    }
}
