<?php
//Gibt alle Items von pictures zurück
function getAllPicturess(){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM pictures";
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


//Gibt 1 Item von pictures zurück (gesucht mit der ID)
function getThisPictures($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM pictures where PictureID = $ID";
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


//Erstellt ein Item der Tabelle pictures
function createPictures($TaskID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "INSERT INTO pictures(TaskID)
          VALUES ('$TaskID')";

  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data created successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been created");
  }
}


//Updated ein Item der Tabelle pictures
function updatePictures($ID ,$TaskID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "UPDATE pictures SET TaskID='$TaskID' WHERE PictureID='$ID'";

  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data updated successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been updated");
  }
}

//Löscht ein Item aus der Tabelle pictures
function deletePictures($ID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "DELETE FROM pictures WHERE PictureID =$ID";
  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}
