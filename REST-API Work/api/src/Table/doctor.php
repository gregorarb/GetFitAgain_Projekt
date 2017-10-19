<?php
//Gibt alle Therapeuten zurück
function getAllDoctors(){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM doctor";
  $result = $conn->query($sql) or die("Datenbankverbindung nicht möglich");

  include_once DOC_ROOT_PATH . "/othermethods.php";

  $rows = toArray($result);

  deliver_response(200, $rows, "data found");
}

//Gibt einen Therapist zurück die mit ID gesucht wird
function getThisDoctor($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM Doctor where DoctorID = $ID";
  $result = $conn->query($sql) or die("Datenbankverbindung nicht möglich");

  include_once DOC_ROOT_PATH . "/othermethods.php";

  $rows = toArray($result);

  deliver_response(200, $rows, "data found");
}


//Erstellt einen Therapeuten
function createDoctor($PersonID, $areaofexpertise){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "INSERT INTO doctor (PersonID, areaofexpertise)
          VALUES ('$PersonID', '$areaofexpertise')";

  if ($conn->query($sql) === TRUE) {
    deliver_response(200, 0, "Data created successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been created");
  }

}

//Löscht eine Doctor
function deleteDoctor($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "DELETE FROM doctor WHERE DoctorID=$ID";
  if ($conn->query($sql) === TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}

//Updated einen Doctor
function updateDoctor($ID, $PersonID, $areaofexpertise){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "UPDATE doctor SET
          PersonID='$PersonID',
          areaofexpertise='$areaofexpertise'
          WHERE DoctorID='$ID'";
  if ($conn->query($sql) === TRUE) {
    deliver_response(200, 0, "Data updated successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been updated");
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
