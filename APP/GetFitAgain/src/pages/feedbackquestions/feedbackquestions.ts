import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { FeedbackPage } from '../feedback/feedback';

/**
 * Generated class for the FeedbackquestionsPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-feedbackquestions',
  templateUrl: 'feedbackquestions.html',
})
export class FeedbackquestionsPage {
  //Variablen
  feedback: any;
  
  constructor(public navCtrl: NavController, public navParams: NavParams) {
    this.feedback = this.navParams.get('item');
    console.log("----Feedback----");
    console.log(this.feedback.FeedbackID);
    console.log(this.feedback.name);
    console.log(this.feedback.done);
    
  }

  
  ionViewDidLoad() {
    console.log("u got logged brah");
    //document.getElementById("newcontent").innerHTML = "<h3>TESTITNOWANDFAST</h3>'";
  }
 
}
