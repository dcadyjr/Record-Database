import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';
import { NgForOf } from '@angular/common';

class Album{
	id: number;
	name: string;
	artist: string;
	release_year: number;
	image_url: string;
	detail_url: string;
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
	
	

  constructor(private http: Http, private router: Router) {
   }

  search(){
  	this.http.post('http://localhost:9393/albums', this.newSearch).subscribe(response => {
  		
  		this.bobs = response.json().results;
  		console.log(this.bobs);
  	})
  }

  getDetails(album){
  	this.router.navigate(['/details', album.id])
  }

  getSavedDetails(album){
    this.router.navigate(['/details', album.discogs_id])
  }

  saveAlbum(album){
  	this.http.post('http://localhost:9393/albums/save', album).subscribe(response => {
  		{this.albums = response.json()}
  		console.log(this.newAlbum);
  	})

  }
  delete(){

  }

  ngOnInit() {
  	this.http.get('http://localhost:9393/albums').subscribe(response => {
  		this.albums = response.json()
  	})
  }

}
