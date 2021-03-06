import { Injectable } from "@angular/core";
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from "@angular/router";
import { Observable } from "rxjs/Observable";
import { LoginService } from "../services/login.service";
import { UserType } from "../model/userType.model";

@Injectable()
export class AdminGuard implements CanActivate {
    
    constructor( private router : Router , private loginService : LoginService ) { }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean | Observable<boolean> | Promise<boolean> {
        
        var userType = this.loginService.userType;

        if( userType === UserType.ADMIN )
            return true;
        else{
            this.router.navigate( ['/main'] );
            return false;
        }

    }
}
