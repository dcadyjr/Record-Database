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
  discogs_id: number;
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
	records = [];
	details = [];
	
	

  constructor(private http: Http, private router: Router) {
   }

  search(){
  	this.http.post('http://localhost:9393/albums', this.newSearch).subscribe(response => {
  		
  		this.records = response.json().results;
  	})
  }

  getDetails(album){
  	this.router.navigate(['/details', album.id])
  }

  getSavedDetails(album){
    this.router.navigate(['/details', album.discogs_id])
  }

  saveAlbum(album){
  	this.http.post('http://localhost:9393/albums/save?token=' + window.localStorage.token, album).subscribe(response => {
  		{this.albums = response.json()}
  	})

  }
  delete(album){
    this.http.delete('http://localhost:9393/albums/' + album).subscribe(response => {
      this.albums = response.json()
    })
  }

  ngOnInit() {
  	this.http.get('http://localhost:9393/albums?token=' + window.localStorage.token).subscribe(response => {
  		this.albums = response.json()
  	})
  }

}
