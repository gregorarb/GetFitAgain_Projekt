<?php
//Gibt alle Customer zurück
function getAllCustomers(){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM customer";
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

//Gibt einen Customer zurück der mit ID gesucht wird
function getThisCustomer($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM customer where CustomerID = $ID";
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

//Erstellt einen Customer
function createCustomer($Diagnose, $SocialSecurityNumber, $Insurance, $Password, $PersonID, $DoctorID, $TherapistID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "INSERT INTO customer (Diagnose, SocialSecurityNumber, Insurance, Password, PersonID, DoctorID, TherapistID)
          VALUES ('$Diagnose', '$SocialSecurityNumber', '$Insurance', '$Password', '$PersonID', '$DoctorID', '$TherapistID')";

  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data created successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been created");
  }

}

//Löscht einen Customer
function deleteCustomer($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "DELETE FROM customer WHERE CustomerID=$ID";
  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}

//Updated einen Customer
function updateCustomer($ID, $Diagnose, $SocialSecurityNumber, $Insurance, $Password, $PersonID, $DoctorID, $TherapistID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "UPDATE customer SET
          Diagnose='$Diagnose',
          SocialSecurityNumber='$SocialSecurityNumber',
          Insurance='$Insurance',
          Password='$Password',
          PersonID='$PersonID',
          DoctorID='$DoctorID',
          TherapistID='$TherapistID'
          WHERE CustomerID='$ID'";

  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data updated successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been updated");
  }
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
