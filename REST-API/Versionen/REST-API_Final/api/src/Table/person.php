<?php
//Gibt alle Items von person zurück
function getAllPersons(){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM person";
  $result = $conn->query($sql) or die("Datenbankverbindung nicht möglich");

  include_once "C:/xampp/htdocs/api/src/othermethods.php";

  $rows = toArray($result);

  if($rows != null){
    deliver_response(200, $rows, "data found");
  }
  else{
    deliver_response(200, $rows, "No Data found");
  }
}


//Gibt 1 Item von person zurück (gesucht mit der ID)
function getThisPerson($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM person where PersonID = $ID";
  $result = $conn->query($sql) or die("Datenbankverbindung nicht möglich");

  include_once DOC_ROOT_PATH . "/othermethods.php";

  $rows = toArray($result);

  if($rows != null){
    deliver_response(200, $rows, "data found");
  }
  else{
    deliver_response(200, $rows, "No Data found");
  }
}


//Erstellt ein Item der Tabelle person
function createPerson($prename, $surname, $birthdate, $street, $postcode, $Town, $Phonenumber, $Email, $sex){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "INSERT INTO person(prename, surname, birthdate, street, postcode, Town, Phonenumber, Email, sex)
          VALUES ('$prename', '$surname', '$birthdate', '$street', '$postcode', '$Town', '$Phonenumber', '$Email', '$sex')";

  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data created successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been created");
  }
}


//Updated ein Item der Tabelle person
function updatePerson($ID ,$prename, $surname, $birthdate, $street, $postcode, $Town, $Phonenumber, $Email, $sex){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "UPDATE person SET prename='$prename', surname='$surname', birthdate='$birthdate', street='$street', postcode='$postcode', Town='$Town', Phonenumber='$Phonenumber', Email='$Email', sex='$sex' WHERE PersonID='$ID'";

  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data updated successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been updated");
  }
}

//Löscht ein Item aus der Tabelle person
function deletePerson($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "DELETE FROM person WHERE PersonID =$ID";
  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}
