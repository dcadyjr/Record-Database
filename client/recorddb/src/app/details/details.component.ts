import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Http, Response } from '@angular/http';

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.css']
})
export class DetailsComponent implements OnInit {

	details = {};

  constructor(private route: ActivatedRoute, private http: Http) { 
  	let id = this.route.snapshot.params.id;

	this.http.get('http://localhost:9393/albums/details/' + id).subscribe(response => {

  		this.details = response.json();
  		console.log(this.details);
  	})
  }


  ngOnInit() {
  }

}
