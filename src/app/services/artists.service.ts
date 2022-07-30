import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, tap, throwError } from 'rxjs';
import { artist } from '../models/artists-model';

@Injectable({
  providedIn: 'root'
})
export class ArtistsService {

  constructor(private http:HttpClient) { }
  baseAPIUrl = 'https://localhost:44311/api';
  private handleError(error: any) {
    console.error(error);
    return throwError(error);
  }
  getArtists(): Observable<artist[]> {
    return this.http.get<artist[]>(`${this.baseAPIUrl}/Artists/GetAllArtists`).pipe(
      tap((data) => console.log('success')), catchError(this.handleError));
  }
  addArtist(postdata:any):Observable<number>{
    return this.http.post<number>(`${this.baseAPIUrl}/Artists`,postdata).pipe(
      tap((data) => console.log('success')), catchError(this.handleError));
  }
}
