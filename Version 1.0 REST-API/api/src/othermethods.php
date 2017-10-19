<?php
//Liefert den JSON String der zurückgegeben wird
function deliver_response($status, $data, $status_message) {

  header("HTTP/1.1 $status $status_message");

  $response['status']=$status;
  $response['status_message']=$status_message;
  $response['data']=$data;

  // returns a string in JSON format
  //JSON_UNESCAPED_UNICODE --> ohne dieses Statement würde json_encode UTF-8 Zeichen zu hexadezimalen umwandeln
  $json_response = json_encode($response, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
  echo $json_response;

  die();
}

//Formatiert den Datenbankresponse zu einem Array
function toArray($result){
  if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
      $alldata[] = $row;
    }
  }

  return $alldata;
}
?>
