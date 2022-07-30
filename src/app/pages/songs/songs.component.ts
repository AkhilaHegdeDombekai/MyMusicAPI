import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { SongsService } from 'src/app/services/songs.service';

@Component({
  selector: 'app-songs',
  templateUrl: './songs.component.html',
  styleUrls: ['./songs.component.css']
})
export class SongsComponent implements OnInit {
  songsList: any[] = [];
  songsdata: any[] = []
  baseUrl = 'https://localhost:44311/'
  formgroup: FormGroup = this.form.group({});
  constructor(private songsService:SongsService,private form: FormBuilder) { }

  ngOnInit(): void {
    this.getAllSongs();
    this.formgroup.reset()
    // this.formgroup.valueChanges.subscribe((element)=>{
    //   console.log(element);
    // })

  }
  ratingUpdate(event:any,songId:any){

   let rating= this.formgroup.get(songId.toString())?.value
   let loggedInuser:any= localStorage.getItem('loggedInUser')
   let userdetails = JSON.parse(loggedInuser)
   let updateData = {userId:userdetails.userId,songId:songId,rating:rating};
   debugger;

this.songsService.UpdateSongRating(updateData).subscribe((data) => {
      this.getAllSongs();
    }, (error) => {
      alert('something went wrong!')
    });

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
          
          this.formgroup.addControl(list.songId,new FormControl(0))
          i++;
        })
      }
    }, (error) => {
      alert('something went wrong!')
    });
  }
  addRating(songId:any){
    alert(songId);
  }
}
