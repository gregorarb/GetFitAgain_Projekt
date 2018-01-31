<?php
header("Content-Type: text/html; charset=UTF-8");
//------------------------------------------------------------------------------
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, PUT, DELETE');
//------------------------------------------------------------------------------
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
//Difficulties
include_once('Table/difficulty.php');
//Task
include_once('Table/task.php');
//Category
include_once('Table/category.php');
//Categories
include_once('Table/categories.php');
//Undercategory
include_once('Table/undercategory.php');
//Picture
include_once('Table/picture.php');
//trainingplan
include_once('Table/trainingplan.php');
//tasks
include_once('Table/tasks.php');
//pictures
include_once('Table/pictures.php');

//Diplomarbeitsfiles
//Feedback
include_once('Table/feedback.php');
//Feedbackdonebyuser
include_once('Table/feedbackdonebyuser.php');
//question
include_once('Table/question.php');
//feedbackquestions
include_once('Table/feedbackquestions.php');
//answer
include_once('Table/answer.php');

$config['displayErrorDetails'] = true;
$config['addContentLengthHeader'] = false;

$app = new \Slim\App(["settings" => $config]);

//------------------------------------------------------------------------------
//$app = new \Slim\App;
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");

    return $response;
});
//------------------------------------------------------------------------------



//REST-API für die Tabelle person
//------------------------------------------------------------------------------
//Get all
$app->get('/person', function (Request $request, Response $response) {
    getAllPersons();
});


//Get person with ID
$app->get('/person/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisPerson($ID);
});


//Create new Item of person
$app->post('/person', function (Request $request, Response $response) {
    if(isset($_POST["prename"]) && isset($_POST["surname"]) && isset($_POST["birthdate"]) && isset($_POST["street"]) && isset($_POST["postcode"]) && isset($_POST["Town"]) && isset($_POST["Phonenumber"]) && isset($_POST["Email"]) && isset($_POST["sex"])){
      $prename = $_POST["prename"];
      $surname = $_POST["surname"];
      $birthdate = $_POST["birthdate"];
      $street = $_POST["street"];
      $postcode = $_POST["postcode"];
      $Town = $_POST["Town"];
      $Phonenumber = $_POST["Phonenumber"];
      $Email = $_POST["Email"];
      $sex = $_POST["sex"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createPerson($prename, $surname, $birthdate, $street, $postcode, $Town, $Phonenumber, $Email, $sex);
});


//Update person
$app->put('/person/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['prename']) && isset($request->getParsedBody()['surname']) && isset($request->getParsedBody()['birthdate']) && isset($request->getParsedBody()['street']) && isset($request->getParsedBody()['postcode']) && isset($request->getParsedBody()['Town']) && isset($request->getParsedBody()['Phonenumber']) && isset($request->getParsedBody()['Email']) && isset($request->getParsedBody()['sex'])){
    $ID = $request->getAttribute('ID');
      $prename = $request->getParsedBody()['prename'];
      $surname = $request->getParsedBody()['surname'];
      $birthdate = $request->getParsedBody()['birthdate'];
      $street = $request->getParsedBody()['street'];
      $postcode = $request->getParsedBody()['postcode'];
      $Town = $request->getParsedBody()['Town'];
      $Phonenumber = $request->getParsedBody()['Phonenumber'];
      $Email = $request->getParsedBody()['Email'];
      $sex = $request->getParsedBody()['sex'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updatePerson($ID, $prename, $surname, $birthdate, $street, $postcode, $Town, $Phonenumber, $Email, $sex);

});


//Delete Person
$app->delete('/person/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deletePerson($ID);
});
//-----------------------------------------------------------------------------

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

//REST-API für die Tabelle Difficulty
//------------------------------------------------------------------------------
//Get all
$app->get('/difficulty', function (Request $request, Response $response) {
    getAllDifficulties();
});
//Get one
$app->get('/difficulty/{ID}', function (Request $request, Response $response) {
  $ID = $request->getAttribute('ID');
  getThisDifficulty($ID);
});
//Create new Difficulty
$app->post('/difficulty', function (Request $request, Response $response) {
    if(isset($_POST["Level"]))
    {
      $Level = $_POST["Level"];
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createDifficulty($Level);
});

//Delete Difficulty
$app->delete('/difficulty/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteDifficulty($ID);
});

//Update Difficulty
$app->put('/difficulty/{ID}', function (Request $request, Response $response){

  if(isset($request->getParsedBody()['Level']))
  {
    $ID = $request->getAttribute('ID');
    $Level = $request->getParsedBody()['Level'];
  }
  else{
    deliver_response(200, 1, "Not enough information");
  }
  updateDifficulty($ID, $Level);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle Task
//------------------------------------------------------------------------------
//Get all
$app->get('/task', function (Request $request, Response $response) {
    getAllTasks();
});
//Get one
$app->get('/task/{ID}', function (Request $request, Response $response) {
  $ID = $request->getAttribute('ID');
  getThisTask($ID);
});

//Create new Task
$app->post('/task', function (Request $request, Response $response) {
    if(isset($_POST["Name"])
    && isset($_POST["Description"])
    && isset($_POST["DifficultyID"]))
    {
      $Name = $_POST["Name"];
      $Description = $_POST["Description"];
      $DifficultyID = $_POST["DifficultyID"];
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createTask($Name, $Description, $DifficultyID);
});

//Delete Task
$app->delete('/task/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteTask($ID);
});

//Update task
$app->put('/task/{ID}', function (Request $request, Response $response){
  if(
     isset($request->getParsedBody()["Name"])
  && isset($request->getParsedBody()["Description"])
  && isset($request->getParsedBody()["DifficultyID"]))
  {
    $ID = $request->getAttribute('ID');
    $Name = $request->getParsedBody()['Name'];
    $Description = $request->getParsedBody()['Description'];
    $DifficultyID = $request->getParsedBody()['DifficultyID'];
  }
  else{
    deliver_response(200, 1, "Not enough information");
  }
  updateTask($ID, $Name, $Description, $DifficultyID);
});

//------------------------------------------------------------------------------

//REST-API für die Tabelle category
//------------------------------------------------------------------------------
//Get all
$app->get('/category', function (Request $request, Response $response) {
    getAllCategorys();
});

//Get category with ID
$app->get('/category/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisCategory($ID);
});

//Create new Item of category
$app->post('/category', function (Request $request, Response $response) {
    if(isset($_POST["name"])){
      $name = $_POST["name"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createCategory($name);
});

//Update category
$app->put('/category/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['name'])){
    $ID = $request->getAttribute('ID');
      $name = $request->getParsedBody()['name'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateCategory($ID, $name);

});

//Delete Category
$app->delete('/category/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteCategory($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle categories
//------------------------------------------------------------------------------
//Get all
$app->get('/categories', function (Request $request, Response $response) {
    getAllCategoriess();
});

//Get categories with ID
$app->get('/categories/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisCategories($ID);
});

//Create new Item of categories
$app->post('/categories', function (Request $request, Response $response) {
    if(isset($_POST["UnderCategoryID"]) && isset($_POST["TaskID"])){
      $UnderCategoryID = $_POST["UnderCategoryID"];
      $TaskID = $_POST["TaskID"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createCategories($UnderCategoryID, $TaskID);
});

//Update categories
$app->put('/categories/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['UnderCategoryID']) && isset($request->getParsedBody()['TaskID'])){
    $ID = $request->getAttribute('ID');
      $UnderCategoryID = $request->getParsedBody()['UnderCategoryID'];
      $TaskID = $request->getParsedBody()['TaskID'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateCategories($ID, $UnderCategoryID, $TaskID);

});

//Delete Categories
$app->delete('/categories/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteCategories($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle undercategory
//------------------------------------------------------------------------------
//Get all
$app->get('/undercategory', function (Request $request, Response $response) {
    getAllUndercategorys();
});

//Get undercategory with ID
$app->get('/undercategory/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisUndercategory($ID);
});

//Create new Item of undercategory
$app->post('/undercategory', function (Request $request, Response $response) {
    if(isset($_POST["name"]) && isset($_POST["CategoryID"])){
      $name = $_POST["name"];
      $CategoryID = $_POST["CategoryID"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createUndercategory($name, $CategoryID);
});

//Update undercategory
$app->put('/undercategory/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['name']) && isset($request->getParsedBody()['CategoryID'])){
    $ID = $request->getAttribute('ID');
      $name = $request->getParsedBody()['name'];
      $CategoryID = $request->getParsedBody()['CategoryID'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateUndercategory($ID, $name, $CategoryID);

});

//Delete Undercategory
$app->delete('/undercategory/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteUndercategory($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle picture
//------------------------------------------------------------------------------
//Get all
$app->get('/picture', function (Request $request, Response $response) {
    getAllPicture();
});

//Get picture with ID
$app->get('/picture/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisPicture($ID);
});

//Create new Item of picture
$app->post('/picture', function (Request $request, Response $response) {
    if(isset($_POST["name"]) && isset($_POST["order"]) && isset($_POST["pic"]) && isset($_POST["group"])){
      $name = $_POST["name"];
      $order = $_POST["order"];
      $pic = $_POST["pic"];
      $group = $_POST["group"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createPicture($name, $order, $pic, $group);
});

//Update picture
$app->put('/picture/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['name']) && isset($request->getParsedBody()['order']) && isset($request->getParsedBody()['pic']) && isset($request->getParsedBody()['group'])){
    $ID = $request->getAttribute('ID');
      $name = $request->getParsedBody()['name'];
      $order = $request->getParsedBody()['order'];
      $pic = $request->getParsedBody()['pic'];
      $group = $request->getParsedBody()['group'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updatePicture($ID, $name, $order, $pic, $group);

});

//Delete Picture
$app->delete('/picture/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deletePicture($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle trainingplan
//------------------------------------------------------------------------------
//Get all
$app->get('/trainingplan', function (Request $request, Response $response) {
    getAllTrainingplans();
});

//Get trainingplan with ID
$app->get('/trainingplan/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisTrainingplan($ID);
});

//Create new Item of trainingplan
$app->post('/trainingplan', function (Request $request, Response $response) {
    if(isset($_POST["name"]) && isset($_POST["CustomerID"])){
      $name = $_POST["name"];
      $CustomerID = $_POST["CustomerID"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createTrainingplan($name, $CustomerID);
});

//Update trainingplan
$app->put('/trainingplan/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['name']) && isset($request->getParsedBody()['CustomerID'])){
    $ID = $request->getAttribute('ID');
      $name = $request->getParsedBody()['name'];
      $CustomerID = $request->getParsedBody()['CustomerID'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateTrainingplan($ID, $name, $CustomerID);

});

//Delete Trainingplan
$app->delete('/trainingplan/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteTrainingplan($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle tasks
//------------------------------------------------------------------------------
//Get all
$app->get('/tasks', function (Request $request, Response $response) {
    getAllTasksAssociationTable();
});

//Get tasks with ID of the Trainingplan
$app->get('/tasks/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getTasksOfTrainingsplan($ID);
});

//Get the item identified with TrainingplanID and taskID
$app->get('/tasks/{planID}/{taskID}', function (Request $request, Response $response) {
    $planID = $request->getAttribute('planID');
    $taskID = $request->getAttribute('taskID');

    getOneTaskOfAssociationtable($planID, $taskID);
});

//Create new Item of tasks
$app->post('/tasks', function (Request $request, Response $response) {
    if(isset($_POST["TrainingplanID"]) && isset($_POST["TaskID"]) && isset($_POST["Repeats"]) && isset($_POST["Sets"]) && isset($_POST["Duration"])){
      $TrainingplanID = $_POST["TrainingplanID"];
      $TaskID = $_POST["TaskID"];
      $Repeats = $_POST["Repeats"];
      $Sets = $_POST["Sets"];
      $Duration = $_POST["Duration"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createTasks($TrainingplanID, $TaskID, $Repeats, $Sets, $Duration);
});

//Update tasks
$app->put('/tasks/{TrainingplanID}/{taskID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['Repeats']) && isset($request->getParsedBody()['Sets']) && isset($request->getParsedBody()['Duration'])){
    $TrainingplanID = $request->getAttribute('TrainingplanID');
    $taskID = $request->getAttribute('taskID');
    $Repeats = $request->getParsedBody()['Repeats'];
    $Sets = $request->getParsedBody()['Sets'];
    $Duration = $request->getParsedBody()['Duration'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateTasks($TrainingplanID, $taskID, $Repeats, $Sets, $Duration);

});

//Delete Tasks
$app->delete('/tasks/{TrainingplanID}/{taskID}', function (Request $request, Response $response) {
    $TrainingplanID = $request->getAttribute('TrainingplanID');
    $taskID = $request->getAttribute('taskID');
    deleteTasks($TrainingplanID, $taskID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle pictures
//------------------------------------------------------------------------------
//Get all
$app->get('/pictures', function (Request $request, Response $response) {
    getAllPicturess();
});

//Get pictures with ID
$app->get('/pictures/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisPictures($ID);
});

//Create new Item of pictures
$app->post('/pictures', function (Request $request, Response $response) {
    if(isset($_POST["TaskID"])){
      $TaskID = $_POST["TaskID"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createPictures($TaskID);
});

//Update pictures
$app->put('/pictures/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['TaskID'])){
    $ID = $request->getAttribute('ID');
      $TaskID = $request->getParsedBody()['TaskID'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updatePictures($ID, $TaskID);

});

//Delete Pictures
$app->delete('/pictures/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deletePictures($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle Feedback
//------------------------------------------------------------------------------
//Get all
$app->get('/feedback', function (Request $request, Response $response) {
    getAllFeedbacks();
});

//Get Feedback with ID
$app->get('/feedback/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisFeedback($ID);
});

//Create new Item of Feedback
$app->post('/feedback', function (Request $request, Response $response) {
    if(isset($_POST["name"])){
      $name = $_POST["name"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createFeedback($name);
});

//Update Feedback
$app->put('/feedback/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['name'])){
    $ID = $request->getAttribute('ID');
      $name = $request->getParsedBody()['name'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateFeedback($ID, $name);

});

//Delete Feedback
$app->delete('/feedback/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteFeedback($ID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle feedbackdonebyuser
//------------------------------------------------------------------------------
//Get all
$app->get('/feedbackdonebyuser', function (Request $request, Response $response) {
    getAllFeedbackdonebyusers();
});

//Get feedbackdonebyuser with ID
$app->get('/feedbackdonebyuser/{FeedbackID}/{CustomerID}', function (Request $request, Response $response) {
    $FeedbackID = $request->getAttribute('FeedbackID');
    $CustomerID = $request->getAttribute('CustomerID');

    getFeedbackdonebyuserAssociationtable($FeedbackID, $CustomerID);
});

//Create new Item of feedbackdonebyuser
$app->post('/feedbackdonebyuser', function (Request $request, Response $response) {
    if(isset($_POST["FeedbackID"]) && isset($_POST["CustomerID"])){
      $FeedbackID = $_POST["FeedbackID"];
      $CustomerID = $_POST["CustomerID"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createFeedbackdonebyuser($FeedbackID, $CustomerID);
});

//Update feedbackdonebyuser
//Kein Update benötigt / möglich --> Wenn ein Datensatz einmal in der Datenbank ist dann ist das Feedback erledigt und es kann nicht wiederholt werden
//Möglichkeit wäre aber den Datensatz zu löschen somit kann man die Befragung erneut durchführen

//Delete Feedbackdonebyuser
$app->delete('/feedbackdonebyuser/{FeedbackID}/{CustomerID}', function (Request $request, Response $response) {
    $FeedbackID = $request->getAttribute('FeedbackID');
    $CustomerID = $request->getAttribute('CustomerID');
    deleteFeedbackdonebyuser($FeedbackID, $CustomerID);
});
//------------------------------------------------------------------------------
//REST-API für die Tabelle question
//------------------------------------------------------------------------------
//Get all
$app->get('/question', function (Request $request, Response $response) {
    getAllQuestions();
});

//Get question with ID
$app->get('/question/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisQuestion($ID);
});

//Create new Item of question
$app->post('/question', function (Request $request, Response $response) {
    if(isset($_POST["questiontext"]) && isset($_POST["kindofquestion"])){
      $questiontext = $_POST["questiontext"];
      $kindofquestion = $_POST["kindofquestion"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createQuestion($questiontext, $kindofquestion);
});

//Update question
$app->put('/question/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['questiontext']) && isset($request->getParsedBody()['kindofquestion'])){
    $ID = $request->getAttribute('ID');
    $questiontext = $request->getParsedBody()['questiontext'];
    $kindofquestion = $request->getParsedBody()['kindofquestion'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateQuestion($ID, $questiontext, $kindofquestion);

});

//Delete Question
$app->delete('/question/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    deleteQuestion($ID);
});
//------------------------------------------------------------------------------
//REST-API für die Tabelle feedbackquestions
//------------------------------------------------------------------------------

//Get feedbackquestions with ID
$app->get('/feedbackquestions/{FeedbackID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('FeedbackID');
    getThisFeedbackquestions($ID);
});

//Create new Item of feedbackquestions
$app->post('/feedbackquestions', function (Request $request, Response $response) {
    if(isset($_POST["FeedbackID"]) && isset($_POST["QuestionID"])){
      $FeedbackID = $_POST["FeedbackID"];
      $QuestionID = $_POST["QuestionID"];
    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createFeedbackquestions($FeedbackID, $QuestionID);
});

//Kein Update

//Delete Feedbackquestions
$app->delete('/feedbackquestions/{FeedbackID}/{QuestionID}', function (Request $request, Response $response) {
    $FeedbackID = $request->getAttribute('FeedbackID');
    $QuestionID = $request->getAttribute('QuestionID');
    deleteFeedbackquestions($FeedbackID, $QuestionID);
});
//------------------------------------------------------------------------------

//REST-API für die Tabelle answer
//------------------------------------------------------------------------------
//Get all
$app->get('/answer', function (Request $request, Response $response) {
    getAllAnswers();
});

//Get answer with ID
$app->get('/answer/{ID}', function (Request $request, Response $response) {
    $ID = $request->getAttribute('ID');
    getThisAnswer($ID);
});

//Create new Item of answer
$app->post('/answer', function (Request $request, Response $response) {
    if(isset($_POST["FeedbackID"]) && isset($_POST["CustomerID"]) && isset($_POST["QuestionID"]) && isset($_POST["answerint"]) && isset($_POST["answerbool"]) && isset($_POST["answerstring"])){
      $FeedbackID = $_POST["FeedbackID"];
      $CustomerID = $_POST["CustomerID"];
      $QuestionID = $_POST["QuestionID"];
      $answerint = $_POST["answerint"];
      $answerbool = $_POST["answerbool"];
      $answerstring = $_POST["answerstring"];

    }
    else{
      deliver_response(200, 1, "Not enough information");
    }

    createAnswer($FeedbackID, $CustomerID, $QuestionID, $answerint, $answerbool, $answerstring);
});

//Update answer
$app->put('/answer/{ID}', function (Request $request, Response $response){

if(isset($request->getParsedBody()['FeedbackID']) && isset($request->getParsedBody()['CustomerID']) && isset($request->getParsedBody()['QuestionID']) && isset($request->getParsedBody()['answerint']) && isset($request->getParsedBody()['answerbool']) && isset($request->getParsedBody()['answerstring'])){
    $ID = $request->getAttribute('ID');
      $FeedbackID = $request->getParsedBody()['FeedbackID'];
      $CustomerID = $request->getParsedBody()['CustomerID'];
      $QuestionID = $request->getParsedBody()['QuestionID'];
      $answerint = $request->getParsedBody()['answerint'];
      $answerbool = $request->getParsedBody()['answerbool'];
      $answerstring = $request->getParsedBody()['answerstring'];

  }
  else{
    deliver_response(200, 1, "Not enough information");
  }

  updateAnswer($ID, $FeedbackID, $CustomerID, $QuestionID, $answerint, $answerbool, $answerstring);

});

//Delete Answer
$app->delete('/answer/{FeedbackID}/{CustomerID}', function (Request $request, Response $response) {
    $FeedbackID = $request->getAttribute('FeedbackID');
    $CustomerID = $request->getAttribute('CustomerID');
    deleteAnswer($FeedbackID, $CustomerID);
});
//------------------------------------------------------------------------------
$app->run();
