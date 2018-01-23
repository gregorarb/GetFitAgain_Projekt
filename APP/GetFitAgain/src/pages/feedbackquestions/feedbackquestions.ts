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
  kindofquestionOneDynamic: Array<{QuestionID: number, questionIdentifyName: string, value: number, questiontext: string}>;
  kindofquestionTwoDynamic: Array<{QuestionID: number, questionIdentifyName: string, value: boolean, questiontext: string}>;
  kindofquestionThreeDynamic: Array<{QuestionID: number, questionIdentifyName: string, value: string, questiontext: string}>;

  questions: Array<{QuestionID: number, questiontext: string, kindofquestion: number}>;
  testValues: Array<{startvalue: any, QuestionID: number}>;
  disableFeedback: boolean;

  constructor(public navCtrl: NavController, public navParams: NavParams) {
    this.feedback = this.navParams.get('item');
    this.kindofquestionOneDynamic = [];
    this.kindofquestionTwoDynamic = [];
    this.kindofquestionThreeDynamic = [];
    this.disableFeedback = null;

    this.getQuestionsOfFeedback();
    this.fillQuestionsOfFeedback();
    console.log("Länge --> " + this.questions.length);
    
    this.generateKindOfQuestionOneDynamic();
    this.generateKindOfQuestionTwoDynamic();
    this.generateKindOfQuestionThreeDynamic();
  }

  getQuestionsOfFeedback(){
    this.questions = [];

    var getFeedback = new XMLHttpRequest(); // a new request
    getFeedback.open("GET","http://api/feedbackquestions/" + this.feedback.FeedbackID ,false);
    getFeedback.send(null);

    var newdata = JSON.parse(getFeedback.responseText);

    var myarray = newdata.data;
    var arrayLength;
    try{
      arrayLength = myarray.length;
    }
    catch(err){
      alert("Das Feedback ist noch nicht bereit um bearbeitet zu werden!");
      this.disableFeedback = false;
    }

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

  //Wenn die Page vollständig geladen ist
  ionViewDidLoad() {
    //console.log("u got logged brah");
    //document.getElementById("newcontent").innerHTML = "<h3>TESTITNOWANDFAST</h3>'";
  }

  logForm(){
    //console.log("data--> "+this.testValues);
    console.log("-----Ergebnisse-----");
    for(var i = 0; i < this.kindofquestionOneDynamic.length; i++){
      console.log("Fragen 1-5");
      console.log("QEUSTIONID --> " + this.kindofquestionOneDynamic[i].QuestionID);
      console.log("Value --> " + this.kindofquestionOneDynamic[i].value);

      //Speicherung in die Datenbank
      
      let postParams = {
        QuestionID: 1,
        answerint: 3,
        answerbool: 2,
        answerstring: "teststring"
      }

      var getFeedbackDone = new XMLHttpRequest(); // a new request
      getFeedbackDone.open("POST","http://api/answer",false);
      var params = "QuestionID="+this.kindofquestionOneDynamic[i].QuestionID+"&answerint="+this.kindofquestionOneDynamic[i].value+"&answerbool=2&answerstring='emptystring'";
      getFeedbackDone.send(postParams);

      console.log(postParams);
      
    }
    console.log("------------------------------------------------------");
    for(var i = 0; i < this.kindofquestionTwoDynamic.length; i++){
      console.log("Fragen true or false");
      console.log("QEUSTIONID --> " + this.kindofquestionTwoDynamic[i].QuestionID);
      console.log("Value --> " + this.kindofquestionTwoDynamic[i].value);
    }
    console.log("------------------------------------------------------");
    for(var i = 0; i < this.kindofquestionThreeDynamic.length; i++){
      console.log("Fragen true or false");
      console.log("QEUSTIONID --> " + this.kindofquestionThreeDynamic[i].QuestionID);
      console.log("Value --> " + this.kindofquestionThreeDynamic[i].value);
    }
  }

  onChange(ev: any, id: string){
    //console.log(ev);
    console.log("id --> " + id);
    console.log("value --> " + ev._value)
  }

  //Generiert 1-5 Fragen
  generateKindOfQuestionOneDynamic(){
    for (var i = 0; i < this.questions.length; i++) {
      if(this.questions[i].kindofquestion == 1){
        this.kindofquestionOneDynamic.push({
          QuestionID: this.questions[i].QuestionID,
          questionIdentifyName: "KindofquestionOne_"+this.questions[i].QuestionID,
          value: 1,
          questiontext: this.questions[i].questiontext
        });
      }
    }
  }

  //Generiert true or false Fragen
  generateKindOfQuestionTwoDynamic(){
    for (var i = 0; i < this.questions.length; i++) {
      if(this.questions[i].kindofquestion == 2){
        this.kindofquestionTwoDynamic.push({
          QuestionID: this.questions[i].QuestionID,
          questionIdentifyName: "KindofquestionTwo_"+this.questions[i].QuestionID,
          value: false,
          questiontext: this.questions[i].questiontext
        });
      }
    }
  }

  //Generiert Textfragen
  generateKindOfQuestionThreeDynamic(){
    for (var i = 0; i < this.questions.length; i++) {
      if(this.questions[i].kindofquestion == 3){
        this.kindofquestionThreeDynamic.push({
          QuestionID: this.questions[i].QuestionID,
          questionIdentifyName: "KindofquestionThree_"+this.questions[i].QuestionID,
          value: "",
          questiontext: this.questions[i].questiontext
        });
      }
    }
  }
}
