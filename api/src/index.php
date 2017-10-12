<?php
header('Content-Type: text/html; charset=utf-8');
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

//JSON string
include_once('othermethods.php');

//Personmethoden
include_once('Table/person.php');


$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$app = new \Slim\App(["settings" => $config]);

$app->get('/hello/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $response->getBody()->write("Hello, $name");

    return $response;
});
//PERSON
//Get * from Person
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
    if(isset($_POST["prename"]) && isset($_POST["surname"]) && isset($_POST["birthdate"]) && isset($_POST["street"]) && isset($_POST["postcode"]) && isset($_POST["town"]) && isset($_POST["phonenumber"]) && isset($_POST["email"]) && isset($_POST["sex"])){
      $prename = $_POST["prename"];
      $surname = $_POST["surname"];
      $birthdate = $_POST["birthdate"];
      $street = $_POST["street"];
      $postcode = $_POST["postcode"];
      $town = $_POST["town"];
      $phonenumber = $_POST["phonenumber"];
      $email = $_POST["email"];
      $sex = $_POST["sex"];
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createPerson($prename, $surname, $birthdate, $street, $postcode, $town, $phonenumber, $email, $sex);
    //echo "($prename, $surname, $birthdate, $street, $postcode, $town, $phonenumber, $email, $sex)";
    //echo "secondtest";
});
//Delete Person
$app->delete('/person/{ID}', function (Request $request, Response $response) {
    include_once('Table/person.php');
    $ID = $request->getAttribute('ID');
    //echo "Delete Person with PersonID($ID)";
    deleteperson($ID);
});
//------------------------------------------------------------------------------
$app->run();
