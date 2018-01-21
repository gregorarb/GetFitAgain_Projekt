import { Component } from '@angular/core';
import { List } from 'ionic-angular';
import { NavController, NavParams } from 'ionic-angular';
import { IonicStorageModule } from '@ionic/storage';

import { FeedbackquestionsPage } from '../feedbackquestions/feedbackquestions';

@Component({
  selector: 'page-feedback',
  templateUrl: 'feedback.html'
})
export class FeedbackPage {
  //Variablen
  feedbacks: Array<{FeedbackID: number, name: string, done: string, donebool: boolean}>;

  //Konstruktor
  constructor(public navCtrl: NavController, public navParams: NavParams){//, private storage: Storage) {
    this.getFeedbacksFromDatabase();
    //this.storage.setItem("CustomerID", "1");
  }

  //fügt Feedbacks mit allen wichtigen Informationen von der Datenbank in die Liste ein
  getFeedbacksFromDatabase(){
    //customerid --> mit local storage ersetzen
    var customerid = 1;

    //Get feedback
    var getFeedback = new XMLHttpRequest(); // a new request
    getFeedback.open("GET","http://api/feedback",false);
    getFeedback.send(null);
    
    var newdata = JSON.parse(getFeedback.responseText);

    //Get Feedbacks done by users
    var getFeedbackDone = new XMLHttpRequest(); // a new request
    getFeedbackDone.open("GET","http://api/feedbackdonebyuser",false);
    getFeedbackDone.send(null);
    
    var newdata2 = JSON.parse(getFeedbackDone.responseText);
    var myarray2 = newdata2.data;
    var arrayLength2 = myarray2.length;
    
    var myarray = newdata.data;
    var arrayLength = myarray.length;

    this.feedbacks = [];
    
    for (var i = 0; i < arrayLength; i++) {
        var isitdone = "Unerledigt";
        var isitdonebool = null;
        //hat der user das feedback schon gemacht?
        for (var j = 0; j < arrayLength2; j++){
          //customerid --> lokales objekt später DB objekt
          if(customerid == myarray2[j].CustomerID){
            if(myarray2[j].FeedbackID == myarray[i].FeedbackID){
              isitdone = "Erledigt";
              isitdonebool = false;
            }
            
          }
        }
        
        this.feedbacks.push({
          FeedbackID: myarray[i].FeedbackID,
          name: myarray[i].name,
          done: isitdone,
          donebool: isitdonebool
        });
        
    }
  }

  //wenn ein item in der Liste ausgewählt wurde
  openFeedbackQuestions($event, item){
    this.navCtrl.push(FeedbackquestionsPage, {
      item: item
    });
    
  }
}