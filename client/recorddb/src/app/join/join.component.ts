import { Component, OnInit } from '@angular/core';
import {Http, Response } from '@angular/http'
import { Router } from '@angular/router'

@Component({
  selector: 'app-join',
  templateUrl: './join.component.html',
  styleUrls: ['./join.component.css']
})
export class JoinComponent implements OnInit {

	newUser = {};

  constructor(private http: Http, private router: Router) { }



 register(){
  	this.http.post('http://localhost:9393/users/register', this.newUser).subscribe(response => {
  		window.localStorage.setItem('token', response.json().token)
      this.router.navigate(['/collection'])

  	})
  }
  goToLogin(){
    
    this.router.navigate(['/login'])
  }

    ngOnInit() {
  }

}
