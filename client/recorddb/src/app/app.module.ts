import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { CollectionComponent } from './collection/collection.component';
import { DetailsComponent } from './details/details.component';

const routes: Routes = [
  {
	path: 'login',
	component: LoginComponent
  },
  {
   path: 'collection',
   component: CollectionComponent
  },
  {
    path: 'details/:id',
    component: DetailsComponent
  }

]

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    CollectionComponent,
    DetailsComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    RouterModule.forRoot(routes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
