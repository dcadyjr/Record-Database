import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent implements OnInit {
	user = {};



  constructor(private http: Http, private router: Router) { }

  login(){
  	this.http.post('http://localhost:9393/users/login', this.user).subscribe(response => {
  		window.localStorage.setItem("token", response.json().token)
  		console.log("success");
  	})
  }

  register(){
  	this.http.post('http://localhost:9393/users/login', this.user).subscribe(response => {
  		window.localStorage.setItem('token', response.json().token)
  		console.log("success");
  	})
  }

  ngOnInit() {
  }

}
