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
using RestSharp;
using Newtonsoft.Json;

namespace Trainingsplanerstellung
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public ObservableCollection<string> ExercisesInPlan_List { get; set; }
        public ObservableCollection<Person> Customers_List { get; set; }
        public ObservableCollection<Person> Persons_List { get; set; }

        public MainWindow()
        {
            DataContext = this;

            ExercisesInPlan_List = new ObservableCollection<string>();
            Customers_List = new ObservableCollection<Person>();
            Persons_List = new ObservableCollection<Person>();

            FetchTable("person", "http://localhost/api/src");

            InitializeComponent();
        }

        /// <summary>
        /// Holt alle Einträge eines Tables der Datenbank über ein Webservice heraus
        /// </summary>
        /// <param name="table">Table, aus dem alle Einträge geholt werden sollen</param>
        /// <param name="baseUrl">Base-URL des Webservice, hier liegt die index.php Datei</param>
        public void FetchTable(string table, string baseUrl)
        {
            var client = new RestClient();
            // URL des Ordners mit der index.php, über die man mit REST Tabellen aufrufen kann
            client.BaseUrl = new Uri("http://localhost/api/src");

            var request = new RestRequest();
            // {BaseUrl}/{Resource}, zB: http://localhost/api/src/person gibt alle Personen zurück
            request.Resource = table;

            IRestResponse response = client.Execute(request);
            Console.WriteLine(response.Content);
            if (response.Content.Length != 0) { 
                string[] split = response.Content.Split('[');
                string[] jsonSplit = split[1].Split(']');
                string jsonStr = jsonSplit[0];

                // Tilde kommt nie vor, notwendig fürs splitten 
                // (an Beistrich splitten ist schwierig, da sie öfters vorkommen)
                jsonStr = jsonStr.Replace("},", "}~");

                string[] allItemsOfTable = jsonStr.Split('~');

                foreach (var item in allItemsOfTable)
                {
                    switch(table) {
                        case "person":
                            {
                                Persons_List.Add(JsonConvert.DeserializeObject<Person>(item));
                                break;
                            }
                        case "customer":
                            {
                                // get all persons
                                break;
                            }
                    }
                }
            }
        }

        private void NumberValidationAnzahl_TextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void NumberValidationDauer_TextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex(@"[^0-9]+");
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
