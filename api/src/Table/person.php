<?php
//Gibt alle Personen zurück
function getAllPersons(){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());

  $sql = "SELECT * FROM person";
  $result = $conn->query($sql) or die("Datenbankverbindung nicht möglich");

  include_once DOC_ROOT_PATH . "/othermethods.php";

  $rows = toArray($result);

  deliver_response(200, $rows, "data found");
}

//Gibt eine Person zurück die mit ID gesucht wird
function getThisPerson($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());

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

  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());

  $sql = "INSERT INTO person (prename, surname, birthdate, street, postcode, Town, Phonenumber, Email, sex)
          VALUES ('$prename', '$surname', '$birthdate', '$street', '$postcode', '$town', '$phonenumber', '$email', '$sex')";

  //echo "Testdaten($prename, $surname, $birthdate, $street, $postcode, $town, $phonenumber, $email, $sex)";

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

  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());

  $sql = "DELETE FROM person WHERE PersonID=$ID";
  if ($conn->query($sql) === TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}
//------------------------------------------------------------------------------
//Datenbankresponse to Array
function toArray($result){
  $alldata[] = array();
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $row["prename"] = utf8_encode($row["prename"]);
      $row["surname"] = utf8_encode($row["surname"]);
      $row["street"] = utf8_encode($row["street"]);
      $row["Town"] = utf8_encode($row["Town"]);
      $row["Email"] = utf8_encode($row["Email"]);

//      echo "ID: " . $row["PersonID"]. "<br>Prename: " . $row["prename"]. " <br>Surname:" . $row["surname"]. "<br>Town: " . $row["Town"] ."<br>Street: " . $row["street"] ."<br><br>";

      $alldata[] = $row;
    }
  }

  return $alldata;
}
