import { Component, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';
import { Router } from '@angular/router';
import { NgForOf } from '@angular/common';
import { EllipsisModule } from 'ngx-ellipsis';

class Album{
	id: number;
	name: string;
	artist: string;
	release_year: number;
	image_url: string;
	detail_url: string;
  discogs_id: number;
}

class Wish{
  id: number;
  name: string;
  artist: string;
  release_year: number;
  image_url: string;
  detail_url: string;
  discogs_id: number;
}

class Record{
  title: string;
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
	records: Record[] = [];
  wishes: Wish[] = [];
  newWish: Wish = new Wish();
  showSearch: Boolean = false;
	showCrate: Boolean = true;
  showWish: Boolean = false;



  constructor(private http: Http, private router: Router) {

   }

  search(){
  	this.http.post('http://localhost:9393/albums', this.newSearch).subscribe(response => {
  		
      this.showSearch = true;
      this.showCrate = false;
      this.showWish = false;
  		this.records = response.json().results;
  	})
  }

  getDetails(album){
  	this.router.navigate(['/details', album.id])
  }

  getSavedDetails(album){
    this.router.navigate(['/details', album.discogs_id])
  }

  getSavedWishDetails(wish){
    this.router.navigate(['/details', wish.discogs_id])
  }

//saves album and puts in My Crate
  saveAlbum(album){  
  	this.http.post('http://localhost:9393/albums/save?token=' + window.localStorage.token, album).subscribe(response => {
  		{this.albums = response.json()}
  	})
  }

//saves album and puts in My Wishlist
  saveWish(wish){ 
    this.http.post('http://localhost:9393/wishes/save?token=' + window.localStorage.token, wish).subscribe(response => {
      {this.wishes = response.json()}
    })
  }

//deletes album from My Crate
  delete(album){
    this.http.delete('http://localhost:9393/albums/' + album + '?token=' + window.localStorage.token).subscribe(response => {
      this.albums = response.json()
    })
  }

//deletes album from My Wishlist
  wishdelete(wish){
    this.http.delete('http://localhost:9393/wishes/' + wish + '?token=' + window.localStorage.token).subscribe(response => {
      this.wishes = response.json()
    })
  }

  logout(){
    window.localStorage.clear();
    this.router.navigate(['/login'])
  }
  goToCrate(){
      this.showCrate = true;
      this.showWish = false;
      this.showSearch = false;
  }
  goToWishlist(){
      this.showCrate = false;
      this.showWish = true;
      this.showSearch = false;

  }
  goToSearch(){
      this.showCrate = false;
      this.showWish = false;
      this.showSearch = true;

  }

  ngOnInit() {
  	this.http.get('http://localhost:9393/albums?token=' + window.localStorage.token).subscribe(response => {
  		this.albums = response.json()
  	})

    this.http.get('http://localhost:9393/wishes?token=' + window.localStorage.token).subscribe(response => {
      this.wishes = response.json()
    })
  }

}
