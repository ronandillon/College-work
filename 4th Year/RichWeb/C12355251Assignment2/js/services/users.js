myApp.factory('users', ['$rootScope','$firebaseArray','$firebaseObject','$location','FIREBASE_URL',function($rootScope,$firebase,$firebaseObject,$location,FIREBASE_URL) {
            
	
			var ref = new Firebase(FIREBASE_URL + 'users/');
            var auth = $firebase(ref);
            
            
            var getusers = function(id){
              ref = new Firebase(FIREBASE_URL + 'users/');
              
              auth = $firebase(ref);
              return auth;
            };
        
            var adduser = function (newuser) {
              console.log(newuser)
              users.$add(newuser);
            };
        
            var updateuser = function (id){
              users.$save(id);
            };
        
            var removeuser = function (id) {
              users.$remove(id);
            };
            
            return {
              getusers: getusers,
              adduser: adduser,
              updateuser: updateuser,
              removeuser: removeuser,
            }
        
        }]);