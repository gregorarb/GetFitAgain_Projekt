<?php
//Gibt alle Personen zurück
function getAllPersons(){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM person";
  $result = $conn->query($sql) or die("Datenbankverbindung nicht möglich");

  include_once DOC_ROOT_PATH . "/othermethods.php";

  $rows = toArray($result);

  deliver_response(200, $rows, "data found");
}

//Gibt eine Person zurück die mit ID gesucht wird
function getThisPerson($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  
  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM person where PersonID = $ID";
  $result = $conn->query($sql) or die("Datenbankverbindung nicht möglich");

  include_once DOC_ROOT_PATH . "/othermethods.php";

  $rows = toArray($result);

  deliver_response(200, $rows, "data found");
}

//Erstellt eine Person
function createPerson($prename, $surname, $birthdate, $street, $postcode, $town, $phonenumber, $email, $sex){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "INSERT INTO person (prename, surname, birthdate, street, postcode, Town, Phonenumber, Email, sex)
          VALUES ('$prename', '$surname', '$birthdate', '$street', '$postcode', '$town', '$phonenumber', '$email', '$sex')";

  if ($conn->query($sql) === TRUE) {
    deliver_response(200, 0, "Data created successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been created");
  }

}

//Löscht eine Person
function deletePerson($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "DELETE FROM person WHERE PersonID=$ID";
  if ($conn->query($sql) === TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}

//Updated eine Person
function updatePerson($ID, $prename, $surname, $birthdate, $street, $postcode, $town, $phonenumber, $email, $sex){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "UPDATE person SET
          prename='$prename',
          surname='$surname',
          birthdate='$birthdate',
          street='$street',
          postcode='$postcode',
          Town='$town',
          Phonenumber='$phonenumber',
          Email='$email',
          sex='$sex'
          WHERE PersonID='$ID'";
  if ($conn->query($sql) === TRUE) {
    deliver_response(200, 0, "Data updated successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been updated");
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
