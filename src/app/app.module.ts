import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavigationComponent } from './shared-component/navigation/navigation.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { ArtistsComponent } from './pages/artists/artists.component';
import { SongsComponent } from './pages/songs/songs.component';
import { FormsModule, ReactiveFormsModule,FormGroup } from '@angular/forms';
import {HttpClientModule} from '@angular/common/http'
import { NgxStarRatingModule } from 'ngx-star-rating';
import { AddEditSongComponent } from './pages/songs/add-edit-song/add-edit-song.component';
@NgModule({
  declarations: [
    AppComponent,
    NavigationComponent,
    HomeComponent,
    LoginComponent,
    ArtistsComponent,
    SongsComponent,
    AddEditSongComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    NgxStarRatingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
