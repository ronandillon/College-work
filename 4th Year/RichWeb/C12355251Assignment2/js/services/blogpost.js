myApp.factory('Blogpost', ['$rootScope','$firebaseAuth','$firebaseObject','$location','FIREBASE_URL',function($scope,$firebaseAuth,$firebaseObject,$location,FIREBASE_URL) {
  
	
  var ref= new Firebase(FIREBASE_URL);
  var auth = $firebaseAuth(ref);
  
  return{
	  post: function(blog){
		  auth.$createPost({
				
			}).then(function(regUser){
				var regRef = new Firebase(FIREBASE_URL + 'posts')
		  		.child(regUser.uid).set({
		  			date: Firebase.ServerValue.TIMESTAMP,
		  			regUser: regUser.uid,
		  			title: blog.title,
		  			content: blog.blogpost
		  		})
		  
			}).catch(function(error){
			  $scope.message =error.message;
		  })
	  }
  };
  
}]);
  