import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Http, Response } from '@angular/http';
import { NgForOf } from '@angular/common';
import { CommonModule } from '@angular/common'; 

@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.css']
})
export class DetailsComponent implements OnInit {

	details = {};
	artists = {};
	tracks = [];

  constructor(private route: ActivatedRoute, private http: Http) { 
  	let id = this.route.snapshot.params.id;

	this.http.get('http://localhost:9393/albums/details/' + id).subscribe(response => {
  		this.details = response.json();
  		// this.artists = response.json().artists[0];
  		this.tracks = response.json().tracklist;
  		console.log(this.details);
  		// console.log(this.artists);
  		console.log(this.tracks[1].duration);
  		
  	})
  }


  ngOnInit() {
  }

}
