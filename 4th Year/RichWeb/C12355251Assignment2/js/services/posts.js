myApp.factory('posts', ['$rootScope','$firebaseArray','$firebaseObject','$location','FIREBASE_URL',function($rootScope,$firebase,$firebaseObject,$location,FIREBASE_URL) {
            
	
			var ref = new Firebase(FIREBASE_URL + 'posts/');
            var auth = $firebase(ref);
            console.log("ref:"+ref);     
            
            var getposts = function(id){
              ref = new Firebase(FIREBASE_URL + 'posts/'+id);
			  ref.orderByChild("data").on("child_added", function(snapshot) {
  console.log(snapshot.key() + " was " + snapshot.val().data + " meters tall");
			  });
              auth = $firebase(ref.orderByChild("data"));
              return auth;
            };
        
            var addpost = function (newpost) {
              console.log(newpost)
              posts.$add(newpost);
            };
        
            var updatepost = function (id){
              posts.$save(id);
            };
        
            var removepost = function (id) {
              posts.$remove(id);
            };
            return {
              getposts: getposts,
              addpost: addpost,
              updatepost: updatepost,
              removepost: removepost,
            }
        
        }]);