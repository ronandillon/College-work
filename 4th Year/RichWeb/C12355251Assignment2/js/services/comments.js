myApp.factory('comments', ['$rootScope','$firebaseArray','$firebaseObject','$location','FIREBASE_URL',function($rootScope,$firebase,$firebaseObject,$location,FIREBASE_URL) {
            
	
			var ref = new Firebase(FIREBASE_URL + 'comments/');
            var auth = $firebase(ref);
            
            
            var getComments = function(){
              ref = new Firebase(FIREBASE_URL + 'comments/');
              
              auth = $firebase(ref);
              return auth;
            };
        
            var addComment = function (newComment) {
              console.log(newComment)
              comments.$add(newComment);
            };
        
            var updateComment = function (id){
              comments.$save(id);
            };
        
            var removeComment = function (id) {
              comments.$remove(id);
            };
            
            return {
              getComments: getComments,
              addComment: addComment,
              updateComment: updateComment,
              removeComment: removeComment,
            }
        
        }]);