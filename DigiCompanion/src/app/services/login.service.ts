import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { HttpClient } from '@angular/common/http';
import { resolve } from 'url';
import { Constants } from '../utils/constants';


@Injectable()
export class LoginService {
  
  email;
  userType;
  name;

  constructor(private http: HttpClient) { 
     this.email = localStorage.getItem('email');
     this.userType = localStorage.getItem('userType');
     this.name = localStorage.getItem('name');
  }


  storeUserDetails(userDetails) {
    this.email = userDetails.email;
  }

  validateCredentials (email, password){
    
    return new Promise( ( resolve , reject ) => {

      var requestJson = {"email": email,
                      "password": password};
    
      this.http.post( Constants.BASE_URL + 'login', requestJson)
        .subscribe( (responseJson : any)  => {
      
          var success = responseJson.success;
          
          if( success ) {
            this.userType = responseJson.payload.user_type;
            this.email = responseJson.payload.email;
            this.name = responseJson.payload.name;
            localStorage.setItem( 'email' , this.email  );
            localStorage.setItem( 'userType' , this.userType  );
            localStorage.setItem( 'name' , this.name );
            resolve();
          } else {
            reject ( responseJson.error.error_message );
          }
            
        }
      );

    } );  
    
  }

  getUserDetails(): string{
    return this.email;
  }

}
