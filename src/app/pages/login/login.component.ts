import { Component, OnInit } from '@angular/core';
import { user } from 'src/app/models/user-model';
import { UsersService } from 'src/app/services/users.service';
import { FormBuilder, FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
public dbUsers:any[]=[];
  constructor(private userService:UsersService,private formbuilder:FormBuilder) { }
  loginForm : FormGroup = this.formbuilder.group({});
  loggedInUser:any;

  ngOnInit(): void {
    this.getAllUsers();
    this.loginForm=this.formbuilder.group({
      emailId:'',
      password:''
    })

  }
  getAllUsers() {
    this.userService.getAllUsers().subscribe((data) => {
      if (data != null) {
        this.dbUsers = data;
      }

    }, (error) => {
      alert('something went wrong!')
    });
  }
  validate() {
    var formdata = this.loginForm.value;
    if (formdata['emailId'] != null && formdata['password'] != null) {
      const result = this.dbUsers.filter((u) => {
        return (u.emailId == formdata['emailId'] && u.password == formdata['password']);
      });
      if (result.length) {
        this.loggedInUser = { userId: result[0].userId, emailId: result[0].emailId }
        localStorage.setItem('loggedInUser', JSON.stringify(this.loggedInUser));
        location.href = '/home'
      }
    }
  }
}
