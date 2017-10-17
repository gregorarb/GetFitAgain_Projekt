<?php
header("Content-Type: text/html; charset=UTF-8");
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

//andere benötige Methoden (toArray und deliver_response)
include_once('othermethods.php');

//Personmethoden
include_once('Table/person.php');


$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$app = new \Slim\App(["settings" => $config]);

//REST-API für die Tabelle Person-----------------------------------------------
//Gets all Persons
$app->get('/person', function (Request $request, Response $response) {
    getAllPersons();
});
//Get Person with ID
$app->get('/person/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisPerson($ID);
});
//Create new Person
$app->post('/person', function (Request $request, Response $response) {
    if(isset($_POST["prename"])
    && isset($_POST["surname"])
    && isset($_POST["birthdate"])
    && isset($_POST["street"])
    && isset($_POST["postcode"])
    && isset($_POST["town"])
    && isset($_POST["phonenumber"])
    && isset($_POST["email"])
    && isset($_POST["sex"]))
    {
      //$prename = utf8_encode($_POST["prename"]);
      //$surname = utf8_encode($_POST["surname"]);
      //$birthdate = utf8_encode($_POST["birthdate"]);
      //$street = utf8_encode($_POST["street"]);

      $prename = $_POST["prename"];
      $surname = $_POST["surname"];
      $birthdate = $_POST["birthdate"];
      $street = $_POST["street"];

      $postcode = $_POST["postcode"];
      $town = $_POST["town"];
      $phonenumber = $_POST["phonenumber"];
      $email = $_POST["email"];
      $sex = $_POST["sex"];
      //echo "Schörghuber";
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createPerson($prename, $surname, $birthdate, $street, $postcode, $town, $phonenumber, $email, $sex);
});
//Update Person
$app->put('/person/{ID}', function (Request $request, Response $response){

  if(isset($request->getParsedBody()['prename']) != null
  && isset($request->getParsedBody()['surname']) != null
  && isset($request->getParsedBody()['birthdate']) != null
  && isset($request->getParsedBody()['street']) != null
  && isset($request->getParsedBody()['postcode']) != null
  && isset($request->getParsedBody()['town']) != null
  && isset($request->getParsedBody()['phonenumber']) != null
  && isset($request->getParsedBody()['email']) != null
  && isset($request->getParsedBody()['sex']) != null)
  {
    $ID = $request->getAttribute('ID');
    $prename = $request->getParsedBody()['prename'];
    $surname = $request->getParsedBody()['surname'];
    $birthdate = $request->getParsedBody()['birthdate'];
    $street = $request->getParsedBody()['street'];
    $postcode = $request->getParsedBody()['postcode'];
    $town = $request->getParsedBody()['town'];
    $phonenumber = $request->getParsedBody()['phonenumber'];
    $email = $request->getParsedBody()['email'];
    $sex = $request->getParsedBody()['sex'];
  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updatePerson($ID, $prename, $surname, $birthdate, $street, $postcode, $town, $phonenumber, $email, $sex);

});
//Delete Person
$app->delete('/person/{ID}', function (Request $request, Response $response) {
    include_once('Table/person.php');
    $ID = $request->getAttribute('ID');
    deleteperson($ID);
});
//------------------------------------------------------------------------------
$app->run();
