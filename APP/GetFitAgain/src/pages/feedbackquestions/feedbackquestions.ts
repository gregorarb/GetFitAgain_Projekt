import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { FeedbackPage } from '../feedback/feedback';

@IonicPage()
@Component({
  selector: 'page-feedbackquestions',
  templateUrl: 'feedbackquestions.html',
})
export class FeedbackquestionsPage {
  //Variablen
  feedback: any;
  questions: Array<{QuestionID: number, questiontext: string, kindofquestion: number}>;
  testValues: Array<{startvalue: any, QuestionID: number}>;
  //Values: Array<any>;

  constructor(public navCtrl: NavController, public navParams: NavParams) {
    this.feedback = this.navParams.get('item');
    
    this.testValues = [];
    this.testValues.push({
      startvalue: 1,
      QuestionID: 1
    });
    this.testValues.push({
      startvalue: null,
      QuestionID: 2
    });
    this.testValues.push({
      startvalue: false,
      QuestionID: 3
    });
    
    this.getQuestionsOfFeedback();
    this.fillQuestionsOfFeedback();
    console.log("Länge --> " + this.questions.length);
  }

  getQuestionsOfFeedback(){
    this.questions = [];

    var getFeedback = new XMLHttpRequest(); // a new request
    getFeedback.open("GET","http://api/feedbackquestions/" + this.feedback.FeedbackID ,false);
    getFeedback.send(null);

    var newdata = JSON.parse(getFeedback.responseText);

    var myarray = newdata.data;
    var arrayLength = myarray.length;

    for (var i = 0; i < arrayLength; i++) {
      this.questions.push({
        QuestionID: myarray[i].QuestionID,
        questiontext: myarray[i].questiontext,
        kindofquestion: myarray[i].kindofquestion
      });
      }
  }

  fillQuestionsOfFeedback(){
    for (var i = 0; i < this.questions.length; i++) {
      var getQuestion = new XMLHttpRequest(); // a new request
      getQuestion.open("GET","http://api/question/" + this.questions[i].QuestionID ,false);
      getQuestion.send(null);
    
      var newdata = JSON.parse(getQuestion.responseText);

      this.questions[i].questiontext = newdata.data[0].questiontext;
      this.questions[i].kindofquestion = newdata.data[0].kindofquestion;
    }
  }

  fillForm(){

  }

  //Wenn die Page vollständig geladen ist
  ionViewDidLoad() {
    //console.log("u got logged brah");
    //document.getElementById("newcontent").innerHTML = "<h3>TESTITNOWANDFAST</h3>'";
  }
  logForm(){
    //console.log("data--> "+this.testValues);
    for (var i = 0; i < this.testValues.length; i++){
      console.log("----------------------------");
      console.log(this.testValues[i].startvalue);
    } 
  }
  onChange(ev: any, id: string){
    //console.log(ev);
    console.log("id --> " + id);
    console.log("value --> " + ev._value)
  }
}
