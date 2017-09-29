import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';

// class User{
// 	id: number;
// 	email: string;
// 	password: string;
// 	screen_name: string;
// }


@Component({
  selector: 'app-root',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent implements OnInit {

	user = {};
	

	//: User = new User();

  constructor(private http: Http, private router: Router) { }

  login(){
  	
  	this.http.post('http://localhost:9393/users/login', this.user).subscribe(response => {
  		window.localStorage.setItem('token', response.json().token)
  		this.router.navigate(['/collection'])
  		
  	})
  }
   goToJoin(){
    
    this.router.navigate(['/users/register'])
  }

  ngOnInit() {
  }

}
