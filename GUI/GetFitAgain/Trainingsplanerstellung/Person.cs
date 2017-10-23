using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Trainingsplanerstellung
{
    public class Person
    {
        public int PersonID { get; set; }
        public string Prename { get; set; }
        public string Surname { get; set; }
        public DateTime Birthdate { get; set; }
        public string Street { get; set; }
        public int Postcode { get; set; }
        public string Town { get; set; }
        public string Phonenumber { get; set; }
        public string Email { get; set; }
        public string Sex { get; set; }

        public Person(int personID, string prename, string surname, DateTime birthdate, string street, int postcode, string town, string phonenumber, string email, string sex)
        {
            PersonID = personID;
            Prename = prename;
            Surname = surname;
            Birthdate = birthdate;
            Street = street;
            Postcode = postcode;
            Town = town;
            Phonenumber = phonenumber;
            Email = email;
            Sex = sex;
        }

        public override string ToString()
        {
            return Surname + " " + Prename;
        }
    }
}
