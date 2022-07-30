import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { SongsService } from '../services/songs.service';
import { UsersService } from '../services/users.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  songsList: any[] = [];
  songsdata: any[] = []
  max = 5;
  rate = 2;
  isReadonly = false;

  baseUrl = 'https://localhost:44311/'
  constructor(private userService: UsersService, private songsService: SongsService, private form: FormBuilder) { }
  formgroup: FormGroup = this.form.group({});
  ngOnInit(): void {
    this.formgroup = this.form.group({
      // rating: ['', Validators.required],
    });
    this.getAllSongs();    
  }
  updateRate() {
    //alert(this.formgroup.get('rating')?.value)
  }

  getAllSongs() {
    this.songsService.getAllSongs().subscribe((data) => {
      if (data != null) {
        this.songsdata = data;
        this.songsdata.forEach(song => {
          song.coverImage = this.baseUrl + song.coverImage
        })
        this.songsList = this.songsdata;
        let i=1;
        this.songsList.forEach(list => {
          this.formgroup.addControl(list.songId,new FormControl(list.rating))
          i++;
        })
      }
    }, (error) => {
      alert('something went wrong!')
    });
  }
}
