<?php

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
?>
