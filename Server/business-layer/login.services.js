module.exports =  ( usersDao )  => {
    
    var LoginServices= {};
    
    /**
    * Check if the user is valid or not 
    * If found then returns the userId and type of user
    * If not then returns an appropriate error message
    * @param {*} requestBody request payload containing the email and password
    */
    LoginServices.authenticate = ( requestBody ) => {
        
        return new Promise( ( resolve,reject ) => {
            
            let email = requestBody.email;
            let password = requestBody.password;

            if( email === undefined || password === undefined )
                reject( 'Invalid Params' );

            usersDao.getUser ( email , password )
            .then( (result) => {
                resolve( { 
                    user_type : result.user_type  ,
                    initiator_id : result.initiator_id , 
                    user_type_id : result.user_type_id , 
                    email : result.email.trim() ,
                    name : result.name ? result.name.trim() : null 
                } );
            }, (error) => {
                reject(error);
            } )

        } );

    };

    return LoginServices;

};