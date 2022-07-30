import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { songs } from './models/songs-model';
import { ArtistsComponent } from './pages/artists/artists.component';
import { LoginComponent } from './pages/login/login.component';
import { AddEditSongComponent } from './pages/songs/add-edit-song/add-edit-song.component';
import { SongsComponent } from './pages/songs/songs.component';

const routes: Routes = [
  {
      path: '',
      pathMatch:'full',
      component: LoginComponent
  },
  {
      path: 'home',
      pathMatch:'full',
      component: HomeComponent
  },
  {
    path: 'artists',
    pathMatch:'full',
    component: ArtistsComponent
},
 {
    path: 'allsongs',
    pathMatch:'full',
    component: SongsComponent
},
{
    path: 'addsongs',
    pathMatch:'full',
    component: AddEditSongComponent
},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
