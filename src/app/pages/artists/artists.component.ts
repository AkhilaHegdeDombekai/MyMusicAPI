import { Component, OnInit } from '@angular/core';
import { ArtistsService } from 'src/app/services/artists.service';

@Component({
  selector: 'app-artists',
  templateUrl: './artists.component.html',
  styleUrls: ['./artists.component.css']
})
export class ArtistsComponent implements OnInit {
  artistsList: any[] = [];
  constructor(private artistsService: ArtistsService) { }

  ngOnInit(): void {
    this.getAllArtists()
  }
  getAllArtists() {
    this.artistsService.getArtists().subscribe((data) => {
      if (data != null) {
        this.artistsList = data;

      }
    }, (error) => {
      alert('something went wrong!')
    });
  }

}
