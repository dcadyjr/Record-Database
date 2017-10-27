import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HttpModule } from '@angular/http';
import { FormsModule } from '@angular/forms';
import { EllipsisModule } from 'ngx-ellipsis';

import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { CollectionComponent } from './collection/collection.component';
import { DetailsComponent } from './details/details.component';
import { JoinComponent } from './join/join.component';

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
  },
  {
    path: 'users/register',
    component: JoinComponent
  }

]

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    CollectionComponent,
    DetailsComponent,
    JoinComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    EllipsisModule,
    RouterModule.forRoot(routes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
