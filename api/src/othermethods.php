<?php
header('Content-Type: text/html; charset=utf-8');
function deliver_response($status, $data, $status_message) {

  header("HTTP/1.1 $status $status_message");

  $response['status']=$status;
  $response['status_message']=$status_message;
  //$response['data']=utf8ize($data);
  $response['data']=$data;

  // returns a string in JSON format
  $json_response=json_encode($response, JSON_PRETTY_PRINT);
  //$json_response=json_encode($response);
  echo $json_response;

  die();
}

//https://stackoverflow.com/questions/19361282/why-would-json-encode-returns-an-empty-string
//Solves the Encoding Problem
function utf8ize($d) {
  if (is_array($d)) {
      foreach ($d as $k => $v) {
          $d[$k] = utf8ize($v);
      }
  } else if (is_string ($d)) {
      return utf8_encode($d);
  }
  return $d;
}
?>
