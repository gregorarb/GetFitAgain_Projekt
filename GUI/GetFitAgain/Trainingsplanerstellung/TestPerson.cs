using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Trainingsplanerstellung
{
    public class TestPerson
    {
        public TestPerson(string vorname, string nachname, int sozialversicherungsnummer, string geburtsdatum, string strasse, string pLZ, string ort, string telefonnummer, string email, string geschlecht, string diagnose, string versicherung)
        {
            Vorname = vorname;
            Nachname = nachname;
            Sozialversicherungsnummer = sozialversicherungsnummer;
            Geburtsdatum = geburtsdatum;
            Strasse = strasse;
            PLZ = pLZ;
            Ort = ort;
            Telefonnummer = telefonnummer;
            Email = email;
            Geschlecht = geschlecht;
            Diagnose = diagnose;
            Versicherung = versicherung;
        }

        public TestPerson()
        {
            new TestPerson("Max", "Mustermann", 3121, "31.02.1904", "Eichenweg", "4332", "Au an der Donau", "203921301231", "email@email.at", "männlich", "latin", "Allianz");
        }

        public String Vorname { get; set; }
        public String Nachname { get; set; }
        public int Sozialversicherungsnummer { get; set; }
        public string Geburtsdatum { get; internal set; }
        public string Strasse { get; internal set; }
        public string PLZ { get; internal set; }
        public string Ort { get; internal set; }
        public string Telefonnummer { get; internal set; }
        public string Email { get; internal set; }
        public string Geschlecht { get; internal set; }
        public string Diagnose { get; internal set; }
        public string Versicherung { get; internal set; }
    }
}
