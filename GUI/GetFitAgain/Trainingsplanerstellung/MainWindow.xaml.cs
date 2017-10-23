using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Text.RegularExpressions;

namespace Trainingsplanerstellung
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public ObservableCollection<string> ExercisesInPlan_List { get; set; }
        public ObservableCollection<TestPerson> Customers_List { get; set; }

        public MainWindow()
        {
            DataContext = this;
            //ConnectToDB_Local();
            ExercisesInPlan_List = new ObservableCollection<string>();
            Customers_List = new ObservableCollection<TestPerson>();

            for(int i=0; i<10; i++)
            {
                TestPerson tp = new TestPerson("Max"+i, "Mustermann", 3121, "31.02.1904", "Eichenweg", "4332", "Au an der Donau", "203921301231"+i%3, "email@email.at", "männlich", "latin", "Allianz");

                Customers_List.Add(tp);
                Console.WriteLine(tp.Vorname);
            }

            InitializeComponent();
        }

        private void ConnectToDB_Local()
        {
            MySqlConnection conn;
            string myConnectionString;

            myConnectionString = "server=localhost;uid=getfitagain_user;" +
                "pwd=GetFitAgain34;database=getfitagain;";

            try
            {
                conn = new MySqlConnection();
                conn.ConnectionString = myConnectionString;
                conn.Open();

                Console.WriteLine("Connection successful");

                // Execute a command
                MySqlCommand myCommand = conn.CreateCommand();
                myCommand.CommandText = "select pic from picture";
            }
            catch (MySqlException ex)
            {

            }
        }

        private void NumberValidationAnzahl_TextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void NumberValidationDauer_TextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9:]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void TreeViewItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            MessageBox.Show("Sie haben auf Übung1 geklickt.");
        }

        private void TabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Exercise_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

        }

        private void TrainingsplanErstellen_Button_Click(object sender, RoutedEventArgs e)
        {
            Boolean createPlan = false;

            MessageBoxResult mbr = MessageBox.Show("Wollen Sie den Trainingsplan jetzt erstellen?", "", MessageBoxButton.YesNo);
            if (mbr == MessageBoxResult.Yes)
            {
                Console.WriteLine("Ja");
                createPlan = true;
            }
            else if (mbr == MessageBoxResult.No)
            {
                Console.WriteLine("Nein");
            }

            // Wenn er ja gedrückt hat -> Plan erstellen
            if (createPlan)
            {
                Console.WriteLine("Fenster mit neuem Trainingsplan öffnen.");
            }
        }

        private void UebungHinzufuegen_Button_Click(object sender, RoutedEventArgs e)
        {
            Boolean addExercise = false;

            MessageBoxResult mbr = MessageBox.Show("Übung hinzufügen?", "", MessageBoxButton.YesNo);
            if (mbr == MessageBoxResult.Yes)
            {
                Console.WriteLine("Ja");
                addExercise = true;
            }
            else if (mbr == MessageBoxResult.No)
            {
                Console.WriteLine("Nein");
            }

            // Wenn er ja gedrückt hat -> Plan erstellen
            if (addExercise)
            {
                Console.WriteLine("Übung zur List hinzufügen");
                this.ExercisesInPlan_List.Add(AusgewaehlteUebung_TextBox.Text);
            }
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
