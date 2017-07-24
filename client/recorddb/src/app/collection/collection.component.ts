import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';

class Album{
	id: number;
	name: string;
	artist: string;
	release_year: number;
	image_url: string;
}

@Component({
  selector: 'app-collection',
  templateUrl: './collection.component.html',
  styleUrls: ['./collection.component.css']
})
export class CollectionComponent implements OnInit {
	newSearch = {};

  constructor(private http: Http, private router: Router) { }

  search(){
  	this.http.post('http://localhost:9393/albums', this.newSearch).subscribe(response => {
  		
  		let searchResults = [];

		let result = response.json();


  		
  		
  		
  	})
  }

  ngOnInit() {
  }

}
