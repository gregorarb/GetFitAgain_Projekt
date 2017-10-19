<?php
header("Content-Type: text/html; charset=UTF-8");
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

//andere benötige Methoden (toArray und deliver_response)
include_once('othermethods.php');

//Personmethoden
include_once('Table/person.php');
//Therapistmethoden
include_once('Table/therapist.php');
//Doctormethoden
include_once('Table/doctor.php');
//Customermethoden
include_once('Table/customer.php');

$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$app = new \Slim\App(["settings" => $config]);

//REST-API für die Tabelle Person
//------------------------------------------------------------------------------
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
});

//Update Person
$app->put('/person/{ID}', function (Request $request, Response $response){

  if(isset($request->getParsedBody()['prename'])
  && isset($request->getParsedBody()['surname'])
  && isset($request->getParsedBody()['birthdate'])
  && isset($request->getParsedBody()['street'])
  && isset($request->getParsedBody()['postcode'])
  && isset($request->getParsedBody()['town'])
  && isset($request->getParsedBody()['phonenumber'])
  && isset($request->getParsedBody()['email'])
  && isset($request->getParsedBody()['sex']) )
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
    $ID = $request->getAttribute('ID');
    deleteperson($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle Therapist
//------------------------------------------------------------------------------
//Get all Therapists
$app->get('/therapist', function (Request $request, Response $response) {
    getAllTherapists();
});
//Get Therapist with ID
$app->get('/therapist/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisTherapist($ID);
});
//Create new Therapist
$app->post('/therapist', function (Request $request, Response $response) {
    if(isset($_POST["PersonID"])
    && isset($_POST["Username"])
    && isset($_POST["Password"]))
    {
      $PersonID = $_POST["PersonID"];
      $Username = $_POST["Username"];
      $Password = $_POST["Password"];
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createTherapist($PersonID, $Username, $Password);
});
//Delete Therapist
$app->delete('/therapist/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteTherapist($ID);
});
//Update Therapist
$app->put('/therapist/{ID}', function (Request $request, Response $response){

  if(isset($request->getParsedBody()['PersonID'])
    && isset($request->getParsedBody()['Username'])
    && isset($request->getParsedBody()['Password']))
  {
    $ID = $request->getAttribute('ID');
    $PersonID = $request->getParsedBody()['PersonID'];
    $Username = $request->getParsedBody()['Username'];
    $Password = $request->getParsedBody()['Password'];
  }
  else{
    deliver_response(200, 1, "Not enough information");
  }
  updateTherapist($ID, $PersonID, $Username, $Password);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle Doktor
//------------------------------------------------------------------------------
//Get all Doctors
$app->get('/doctor', function (Request $request, Response $response) {
    getAllDoctors();
});
//Get Therapist with ID
$app->get('/doctor/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisDoctor($ID);
});
//Create new Doctor
$app->post('/doctor', function (Request $request, Response $response) {
    if(isset($_POST["areaofexpertise"])
    && isset($_POST["PersonID"]))
    {
      $PersonID = $_POST["PersonID"];
      $areaofexpertise = $_POST["areaofexpertise"];
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createDoctor($PersonID, $areaofexpertise);
});
//Delete Doctor
$app->delete('/doctor/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteDoctor($ID);
});
//Update Doctor
$app->put('/doctor/{ID}', function (Request $request, Response $response){

  if(isset($request->getParsedBody()['PersonID'])
    && isset($request->getParsedBody()['areaofexpertise']))
  {
    $ID = $request->getAttribute('ID');
    $PersonID = $request->getParsedBody()['PersonID'];
    $areaofexpertise = $request->getParsedBody()['areaofexpertise'];
  }
  else{
    deliver_response(200, 1, "Not enough information");
  }
  updateDoctor($ID, $PersonID, $areaofexpertise);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle Customer
//------------------------------------------------------------------------------
//Gets all Persons
$app->get('/customer', function (Request $request, Response $response) {
    getAllCustomers();
});

//Get Person with ID
$app->get('/customer/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisCustomer($ID);
});

//Create new Person
$app->post('/customer', function (Request $request, Response $response) {
    if(isset($_POST["Diagnose"])
    && isset($_POST["SocialSecurityNumber"])
    && isset($_POST["Insurance"])
    && isset($_POST["Password"])
    && isset($_POST["PersonID"])
    && isset($_POST["DoctorID"])
    && isset($_POST["TherapistID"]))
    {
      $Diagnose = $_POST["Diagnose"];
      $SocialSecurityNumber = $_POST["SocialSecurityNumber"];
      $Insurance = $_POST["Insurance"];
      $Password = $_POST["Password"];
      $PersonID = $_POST["PersonID"];
      $DoctorID = $_POST["DoctorID"];
      $TherapistID = $_POST["TherapistID"];
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createCustomer($Diagnose, $SocialSecurityNumber, $Insurance, $Password, $PersonID, $DoctorID, $TherapistID);
});

//Update Customer
$app->put('/customer/{ID}', function (Request $request, Response $response){
  if(isset($request->getParsedBody()['Diagnose'])
  && isset($request->getParsedBody()['SocialSecurityNumber'])
  && isset($request->getParsedBody()['Insurance'])
  && isset($request->getParsedBody()['Password'])
  && isset($request->getParsedBody()['PersonID'])
  && isset($request->getParsedBody()['DoctorID'])
  && isset($request->getParsedBody()['TherapistID']))
  {
    $ID = $request->getAttribute('ID');
    $Diagnose = $request->getParsedBody()['Diagnose'];
    $SocialSecurityNumber = $request->getParsedBody()['SocialSecurityNumber'];
    $Insurance = $request->getParsedBody()['Insurance'];
    $Password = $request->getParsedBody()['Password'];
    $PersonID = $request->getParsedBody()['PersonID'];
    $DoctorID = $request->getParsedBody()['DoctorID'];
    $TherapistID = $request->getParsedBody()['TherapistID'];
  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateCustomer($ID, $Diagnose, $SocialSecurityNumber, $Insurance, $Password, $PersonID, $DoctorID, $TherapistID);
});

//Delete Customer
$app->delete('/customer/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteCustomer($ID);
});
//------------------------------------------------------------------------------

$app->run();
