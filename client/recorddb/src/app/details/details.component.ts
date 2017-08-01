import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Http, Response } from '@angular/http';
import { NgForOf } from '@angular/common';
import { CommonModule } from '@angular/common'; 

class Album{
  id: number;
  name: string;
  artist: string;
  release_year: number;
  image_url: string;
  detail_url: string;
  discogs_id: number;
}

class Detail{
  title: string;
  artist: string;
  images: string;
  year: number;

}

class Track{
  title: string;
  duration: string;
}


@Component({
  selector: 'app-details',
  templateUrl: './details.component.html',
  styleUrls: ['./details.component.css']
})

export class DetailsComponent implements OnInit {
  albums: Album[] = [];
	details: Detail[] = [];
	tracks: Track[] = [];
  images = {};

  constructor(private route: ActivatedRoute, private http: Http) { 
  	let id = this.route.snapshot.params.id;

	this.http.get('http://localhost:9393/albums/details/' + id).subscribe(response => {
  		
  		this.details = response.json();
  		this.tracks = response.json().tracklist;
  		
  	})
  }
  
  ngOnInit() {
    this.http.get('http://localhost:9393/albums/' ).subscribe(response => {
 
      this.albums = response.json()
      this.images = response.json().image

    })
  }
}
