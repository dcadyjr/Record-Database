import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';
import { NgForOf } from '@angular/common';

class Album{
	id: number;
	title: string;
	resource_url: string;
	year: number;
	thumb: string;
}

@Component({
  selector: 'app-collection',
  templateUrl: './collection.component.html',
  styleUrls: ['./collection.component.css']
})
export class CollectionComponent implements OnInit {
	albums: Album[] = [];
	newAlbum: Album = new Album();
	newSearch = {};
	bobs = [];
	details = [];
	
	

  constructor(private http: Http, private router: Router) { }

  search(){
  	this.http.post('http://localhost:9393/albums', this.newSearch).subscribe(response => {
  		
  		this.bobs = response.json().results;
  	})
  }

  getDetails(album){
  	this.router.navigate(['/details', album.id])
  }

  saveAlbum(newAlbum){
  	this.http.post('http://localhost:9393/albums/save', this.newAlbum).subscribe(response => {
  		{this.albums = response.json()}
  		console.log(this.newAlbum);
  	})

  }

  ngOnInit() {
  }

}
