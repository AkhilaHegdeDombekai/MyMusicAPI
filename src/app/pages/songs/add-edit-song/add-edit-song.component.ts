import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ArtistsService } from 'src/app/services/artists.service';
import { SongsService } from 'src/app/services/songs.service';
import * as $ from "jquery";

@Component({
  selector: 'app-add-edit-song',
  templateUrl: './add-edit-song.component.html',
  styleUrls: ['./add-edit-song.component.css']
})
export class AddEditSongComponent implements OnInit {
  baseUrl = 'https://localhost:44311/'
  addSongForm: FormGroup = this.form.group({});
  file: any;
  addArtistForm: FormGroup = this.form.group({});
  artistsList: any[] = [];
  showModal: boolean = false;
  constructor(private songsService: SongsService, private form: FormBuilder, private artistsService: ArtistsService) { }

  ngOnInit(): void {

    this.addSongForm = this.form.group({
      songName: '',
      dor: '',
      artistId: '',
      file: ''
    });

    this.addArtistForm = this.form.group({
      artistName: '',
      DOB: '',
      Bio: ''
    });
    this.getAllArtists()
  }
  onFileChange(event: any) {

    if (event.target.files.length > 0) {
      this.file = event.target.files[0];
      this.addSongForm.patchValue({
        file: this.file
      });
    }
  }
  saveSongs() {
    if (this.addSongForm.valid) {
      let postData = this.addSongForm.value;
      let fileToUpload = <File>this.file;
      const formData = new FormData();
      formData.append('file', fileToUpload, fileToUpload.name);
      this.songsService.addSongs(postData, formData).subscribe((data) => {
        this.addSongForm.reset();
        alert('Data saved successfully!')
      }, (error) => {
        alert('something went wrong!')
      });
    }

  }
  openAddArtist() {
    this.showModal = true;
  }

  closeModal() {
    this.showModal = false;
  }
  AddArtist() {
    if (this.addArtistForm.valid) {
      let postData = this.addArtistForm.value;          
      this.artistsService.addArtist(postData).subscribe((data) => {
        this.addArtistForm.reset();
        this.addSongForm.reset()
        this.getAllArtists();
        this.addArtistForm.reset();
        this.closeModal();
        alert('Data saved successfully!')
      }, (error) => {
        alert('something went wrong!')
      });
    }
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
