import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, tap, throwError } from 'rxjs';
import { songs } from '../models/songs-model';

@Injectable({
  providedIn: 'root'
})
export class SongsService {
  baseAPIUrl = 'https://localhost:44311/api'
  constructor(private http: HttpClient) { }
  private handleError(error: any) {
    console.error(error);
    return throwError(error);
  }
  getAllSongs(): Observable<songs[]> {
    return this.http.get<songs[]>(`${this.baseAPIUrl}/Songs/GetAllSongs`).pipe(
      tap((data) => console.log('success')), catchError(this.handleError));
  }
  addSongs(postData:any,postFormData:any):Observable<number>{
    debugger;
    const formData = new FormData();
    formData.append('file', postData['file']);
    formData.append('songname', postData['songName']);
    formData.append('Dor', postData['dor']);
    formData.append('artistId', postData['artistId']);
    debugger;
    //postData['file']=formData;
    return this.http.post<number>(`${this.baseAPIUrl}/Songs`,formData).pipe(
      tap((data)=>console.log('success'),catchError(this.handleError))
    )
  }

  UpdateSongRating(postData:any):Observable<number>{
    
    return this.http.post<number>(`${this.baseAPIUrl}/Songs/UpdateSongRating/${postData.songId}/${postData.rating}/${postData.userId}`,postData).pipe(
      tap((data)=>console.log('success'),catchError(this.handleError))
    )
  }

}
