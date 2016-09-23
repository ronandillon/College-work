myApp.factory('Authentication', ['$rootScope','$firebaseAuth','$firebaseObject','$location','FIREBASE_URL',function($rootScope,$firebaseAuth,$firebaseObject,$location,FIREBASE_URL) {
  

  var ref= new Firebase(FIREBASE_URL);
  var auth = $firebaseAuth(ref);
  
  return{
	  login: function(user){
		  auth.$authWithPassword({
			  email: user.email,
			  password: user.password
		  }).then(function(regUser){
			  $location.path('/success');
			  $("#item1").hide();
			  $("#item2").hide();
			  $("#item3").show();
		  }).catch(function(error){
			  $rootScope.message =error.message;
		  })
	  },
  	  register: function(user) {
  		
		auth.$createUser({
			email: user.email,
			password: user.password
		}).then(function(regUser){
			$rootScope.firstname=user.firstname;
			$rootScope.message = "Welcome " + user.firstname;
			var regRef = new Firebase(FIREBASE_URL + 'users')
	  		.child(regUser.uid).set({
	  			date: Firebase.ServerValue.TIMESTAMP,
	  			regUser: regUser.uid,
	  			firstname: user.firstname,
	  			lastname: user.lastname,
	  			email: user.email
	  		})
	  
		})
		.then(function(regUser){
			  $location.path('/success');
			  $("#item1").hide();
			  $("#item2").hide();
			  $("#item3").show();
		  }).catch(function(error){
			$rootScope.message=error.message;
		});
	    
	  },
	  logout: function(){
		  $("#item1").show();
		  $("#item2").show();
		  $("#item3").hide();
		 return auth.$unauth();
		 
	  },
	  requireAuth: function(){
		  return auth.$requireAuth();
	  }
	  
  };
  
  $Scope.login = function() {
    $Scope.message = "Welcome " + $Scope.user.email;
  };

  auth.$onAuth(function(authUser){
	  if(authUser){
		  var userRef= new Firebase(FIREBASE_URL + 'users/' + authUser.uid);
		  var userObj = $firebaseObject(userRef);
		  $rootScope.currentUser =userObj;
	  }else{
		  $rootScope.currentUser='';
	  }
  });
  

}]);