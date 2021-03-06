import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { ChartsModule } from 'ng2-charts';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { ListPage } from '../pages/list/list';
import { FeedbackPage } from '../pages/feedback/feedback';
import { FeedbackquestionsPage } from '../pages/feedbackquestions/feedbackquestions';
import { ManageQuestionsPage } from '../pages/manage-questions/manage-questions';
import { QuestionDetailsPage } from '../pages/question-details/question-details';
import { ManageFeedbacksPage } from '../pages/manage-feedbacks/manage-feedbacks';
import { FeedbackDetailsPage } from '../pages/feedback-details/feedback-details';
import { FeedbackstatisticsPage } from '../pages/feedbackstatistics/feedbackstatistics';
import { StatisticKindofquestionOnePage } from '../pages/statistic-kindofquestion-one/statistic-kindofquestion-one';
import { StatisticKindofquestionTwoPage } from '../pages/statistic-kindofquestion-two/statistic-kindofquestion-two';
import { StatisticKindofquestionThreePage } from '../pages/statistic-kindofquestion-three/statistic-kindofquestion-three';

import { StatusBar } from '@ionic-native/status-bar';
import { SplashScreen } from '@ionic-native/splash-screen';

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    ListPage,
    FeedbackPage,
    FeedbackquestionsPage,
    ManageQuestionsPage,
    QuestionDetailsPage,
    ManageFeedbacksPage,
    FeedbackDetailsPage,
    FeedbackstatisticsPage,
    StatisticKindofquestionOnePage,
    StatisticKindofquestionTwoPage,
    StatisticKindofquestionThreePage
  ],
  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    ChartsModule
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    ListPage,
    FeedbackPage,
    FeedbackquestionsPage,
    ManageQuestionsPage,
    QuestionDetailsPage,
    ManageFeedbacksPage,
    FeedbackDetailsPage,
    FeedbackstatisticsPage,
    StatisticKindofquestionOnePage,
    StatisticKindofquestionTwoPage,
    StatisticKindofquestionThreePage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
