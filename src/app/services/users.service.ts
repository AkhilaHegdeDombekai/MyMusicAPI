import { Injectable } from '@angular/core';
import { HttpClient,HttpClientModule } from '@angular/common/http'
import { catchError, Observable, tap, throwError } from 'rxjs';
import { user } from '../models/user-model';

@Injectable({
  providedIn: 'root'
})
export class UsersService {
  baseAPIUrl = 'https://localhost:44311/api'
  constructor(private http: HttpClient) { }

  private handleError(error: any) {
    console.error(error);
    return throwError(error);
  }
  getAllUsers(): Observable<user[]> {
    return this.http.get<user[]>(`${this.baseAPIUrl}/user`).pipe(
      tap((data) => console.log('success')), catchError(this.handleError));
  }
}
