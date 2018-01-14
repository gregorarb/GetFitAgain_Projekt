import { Component } from '@angular/core';
import { List } from 'ionic-angular';
import { NavController, NavParams } from 'ionic-angular';

import { FeedbackquestionsPage } from '../feedbackquestions/feedbackquestions';

@Component({
  selector: 'page-feedback',
  templateUrl: 'feedback.html'
})
export class FeedbackPage {
  //Variablen
  items: Array<{name: string, note: string, icon: string}>;
  icons: string[];
  //selectedItem: any;

  constructor(public navCtrl: NavController, public navParams: NavParams) {
    // Zufällig ausgewählt ob Objekt erledigt ist oder nicht
    this.icons = ['Erledigt', 'Unerledigt'];

    this.items = [];
    for (let i = 1; i < 11; i++) {
      this.items.push({
        name: 'Feedback ' + i,
        note: 'This is item #' + i,
        icon: this.icons[Math.floor(Math.random() * this.icons.length)]
      });
    }
    //this.show();
    //var json_obj = JSON.parse(this.Getdata("http://api/person/1"));
    //var json_obj = this.Getdata("http://api/person/1");
    //console.log("this is the name: "+json_obj.data.name);
    //console.log("DATA --> \n" + json_obj);
  }

  Getdata(yourUrl){
    var Httpreq = new XMLHttpRequest(); // a new request
    Httpreq.open("GET",yourUrl,false);
    Httpreq.send(null);
    return Httpreq.responseText;          
  }

  //wenn ein item in der Liste ausgewählt wurde
  openFeedbackQuestions(){
    this.navCtrl.push(FeedbackquestionsPage);
    
  }
}