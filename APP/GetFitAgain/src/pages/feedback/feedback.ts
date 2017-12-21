import { Component } from '@angular/core';
import { List } from 'ionic-angular';

@Component({
  selector: 'page-feedback',
  templateUrl: 'feedback.html'
})
export class FeedbackPage {
  //Variablen
  items: Array<{title: string, note: string, icon: string}>;
  icons: string[];
  
  constructor() {
    // Let's populate this page with some filler content for funzies
    this.icons = ['somedata', 'otherdata'];

    this.items = [];
    for (let i = 1; i < 11; i++) {
      this.items.push({
        title: 'Feedback ' + i,
        note: 'This is item #' + i,
        icon: this.icons[Math.floor(Math.random() * this.icons.length)]
      });
    }
    
  }
  
}
