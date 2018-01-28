import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Platform, ActionSheetController } from 'ionic-angular';
import { QuestionDetailsPage } from '../question-details/question-details';

/**
 * Generated class for the ManageQuestionsPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-manage-questions',
  templateUrl: 'manage-questions.html',
})
export class ManageQuestionsPage {
  //Variablen
  questions: Array <{QuestionID: number, questiontext: string, kindofquestion: number, icon: string}>;
  
  constructor(public navCtrl: NavController, public navParams: NavParams, public actionsheetCtrl: ActionSheetController){
    this.getFeedbackData();
  }

  getFeedbackData(){
    this.questions = [];
    
    var getFeedback = new XMLHttpRequest(); // a new request
    getFeedback.open("GET","http://api/question",false);
    getFeedback.send(null);
    
    var newdata = JSON.parse(getFeedback.responseText);
    var iconname = "";

    for(var i = 0; i < newdata.data.length; i++){
      if(newdata.data[i].kindofquestion == 1){
        iconname = "swap";
      }
      else if(newdata.data[i].kindofquestion == 2){
        iconname = "checkbox-outline";
      }
      else if(newdata.data[i].kindofquestion == 3){
        iconname = "ios-create";
      }

      this.questions.push({
        QuestionID: newdata.data[i].QuestionID,
        questiontext: newdata.data[i].questiontext,
        kindofquestion: newdata.data[i].kindofquestion,
        icon: iconname
      });
    }
  }
  //Optionen wenn Item aus Liste ausgewählt wurde
  openMenu($event, item) {
    let actionSheet = this.actionsheetCtrl.create({
      title: 'Was wollen Sie machen?',
      buttons: [
        {
          text: 'Bearbeiten',
          role: 'edit',
          icon: 'create',
          handler: () => {
            console.log('Edit clicked');
            this.navCtrl.push(QuestionDetailsPage, {
              item: item
            });
            
          }
        },
        {
          text: 'Löschen',
          role: 'destructive',
          icon: 'trash',
          handler: () => {
            console.log('Delete clicked');
            /*
            this.deleteAllFeedbackQuestions(item);
            this.deleteDoneFeedback(item);

            //Redirect zu anderen Feedbacks
            this.navCtrl.setRoot(FeedbackPage);
            */
          }
        },
        {
          text: 'Abbrechen',
          role: 'cancel',
          icon: 'close',
          handler: () => {
            console.log('Cancel clicked');
          }
        }
      ]
    });
    actionSheet.present();
  }

  addItem(){
    console.log("Add clicked");
    this.navCtrl.push(QuestionDetailsPage);
  }
}
