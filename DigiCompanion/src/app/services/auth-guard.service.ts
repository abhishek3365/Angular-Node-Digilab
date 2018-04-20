import { Injectable } from "@angular/core";
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from "@angular/router";
import { Observable } from "rxjs/Observable";

@Injectable()
export class AuthGuard implements CanActivate {
    
    constructor( public router : Router ) { }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean | Observable<boolean> | Promise<boolean> {
        
        var result  = localStorage.getItem('isAuthenticated');
        var isAuthenticated = result == 'true';
        
        if( isAuthenticated )
            return true;
        else{
            this.router.navigate( ['/base'] );
            return false;
        }

    }
}
