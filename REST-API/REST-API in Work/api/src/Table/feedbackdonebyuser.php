<?php
//Gibt alle Items von feedbackdonebyuser zurück
function getAllFeedbackdonebyusers(){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM feedbackdonebyuser";
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


//Gibt 1 Item von feedbackdonebyuser zurück (gesucht mit der ID von Person und Feedback)
function getFeedbackdonebyuserAssociationtable($FeedbackID, $CustomerID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "SELECT * FROM feedbackdonebyuser where FeedbackID = $FeedbackID && CustomerID = $CustomerID";
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


//Erstellt ein Item der Tabelle feedbackdonebyuser
function createFeedbackdonebyuser($FeedbackID, $CustomerID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "INSERT INTO feedbackdonebyuser(FeedbackID, CustomerID)
          VALUES ('$FeedbackID', '$CustomerID')";

  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data created successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been created");
  }
}


//Löscht ein Item aus der Tabelle feedbackdonebyuser
function deleteFeedbackdonebyuser($FeedbackID, $CustomerID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "DELETE FROM feedbackdonebyuser WHERE FeedbackID = $FeedbackID && CustomerID = $CustomerID";
  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}

//Löscht alle Items aus der Tabelle Feedbacksdonebyuser mit einer $FeedbackID
function deleteFeedbackdonebyuserWithFeedbackID($FeedbackID){
  define('DOC_ROOT_PATH', $_SERVER['DOCUMENT_ROOT'].'/');
  include_once DOC_ROOT_PATH . "/othermethods.php";

  //Verbindung aufbauen und Datenbankresponse UTF-8 encoden
  $conn = mysqli_connect('127.0.0.1', 'root', '', 'getfitagain', 3306) or die (mysql_error());
  mysqli_set_charset($conn, "utf8");

  $sql = "DELETE FROM feedbackdonebyuser WHERE FeedbackID = $FeedbackID";
  if ($conn->query($sql) == TRUE) {
    deliver_response(200, 0, "Data deleted successfully");
  }
  else {
    deliver_response(200, 1, "Data could not have been deleted");
  }
}
