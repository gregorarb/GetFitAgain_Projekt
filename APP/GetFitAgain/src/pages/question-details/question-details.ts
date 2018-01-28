import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';

@IonicPage()
@Component({
  selector: 'page-question-details',
  templateUrl: 'question-details.html',
})
export class QuestionDetailsPage {
  //Variablen
  question: any;
  
  //Konstruktor
  constructor(public navCtrl: NavController, public navParams: NavParams) {
    if(this.navParams.get('item') == null){
      this.question = [];

      /**
       * Standardwerte annehmen
       * QuestionID --> -1 weil es hier sowieso nicht mehr gebraucht wird
       * questiontext wird gefüllt
       * kindofquestion wird ausgewählt
       */
       this.question.push({
        QuestionID: -1,
        questiontext: "",
        kindofquestion: 0,
      });
    }
    else{
      this.question = this.navParams.get('item');
    }
  }

  logForm(){
    /**
     * Nur wenn QuestionID == -1 muss nichts gelöscht werden, sonst muss alles was mit der Antwort der Frage zu tun hat gelöscht werden
     */
     if(this.question.QuestionID != -1){

    }
  }
}
