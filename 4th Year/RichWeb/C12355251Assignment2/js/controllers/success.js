myApp.controller('SuccessController', ['$scope','Blogpost','posts','users','comments','$firebaseAuth','$firebaseObject','FIREBASE_URL',function($rootScope,Blogpost,posts,users,Comments,$firebaseAuth,$firebaseObject,FIREBASE_URL) {
	
	var ref= new Firebase(FIREBASE_URL);
	var auth = $firebaseAuth(ref);
	var authData = ref.getAuth();
	var ref = new Firebase(FIREBASE_URL + 'users/');
	var userRef = new Firebase(FIREBASE_URL + 'users/'+authData.uid);
	var postRef = new Firebase(FIREBASE_URL + 'posts/'+authData.uid);
	var proRef =  new Firebase(FIREBASE_URL + 'posts/');
	var commRef;

	$rootScope.user = {"userid":authData};
	profile(authData.uid);
	displayComments();
	feed();
	
	
	$(window).keydown(function(event){
		    if(event.keyCode == 13) {
		      event.preventDefault();
		      return false;
		    }
	});
	
	$rootScope.blogpost = function() {
		  //Blogpost.post($rootScope.user);
		  var postData={'title':$rootScope.blog.title,'blogpost':$rootScope.blog.blogpost,'data': 0 -Date.now()};
		  postRef.push(postData);
		  $rootScope.blog.blogpost="";
		  $rootScope.blog.title="";
	  };
	
	  
	var blogpost=$('#blog');
	userRef.on("value", function(snapshot) {
		var data = snapshot.val();
	    var message = data.firstname;
	    
		  
		}, function (errorObject) {
		  console.log("The read failed: " + errorObject.code);
		});
	
	
	//Posts user comments to firebase
	$rootScope.comment= function(postID){
		console.log("hey i made it"+postID);
		commRef = new Firebase(FIREBASE_URL + 'comments/'+postID)
		var postData={'comment':$rootScope.comment.message,'regUser':authData.uid,'data':Firebase.ServerValue.TIMESTAMP};
		commRef.push(postData);
		displayComments(postID);
		$rootScope.comment.message="";
		
	};

	
	
	
	$rootScope.profile = function(user_pro){
		
		$rootScope.data = {};
	    $rootScope.data.posts = posts.getposts(user_pro);
	    console.log("cellphone:  "+$rootScope.data.posts);
	    $("#title").hide();
		$("#blogpost").hide();
		$("#submitblog").hide();
		if(authData.uid==user_pro)
		{
			$("#title").show();
			$("#blogpost").show();
			$("#submitblog").show();
		}
		
	};
	
	//Function to show all of the users blog posts
	function profile(user_pro){
		
		$rootScope.data = {};
	    $rootScope.data.posts = posts.getposts(user_pro);

	    console.log($rootScope.data.posts);
	    $("#title").hide();
		$("#blogpost").hide();
		$("#submitblog").hide();
		if(authData.uid==user_pro || user_pro == "Bloggington")
		{
			$("#title").show();
			$("#blogpost").show();
			$("#submitblog").show();
		}
		
		
	};
	
	$rootScope.displayComments = function(){
		console.log();
		$rootScope.data = {};
	    $rootScope.data.comments = Comments.getComments();
	    console.log($rootScope.data.comments);
	    
	};
	
//Function to show all of the users comments 
	function displayComments(){
		console.log();
		$rootScope.data2 = {};
	    $rootScope.data2.comments = Comments.getComments();
		$rootScope.data3 = {};
		$rootScope.data3.users = users.getusers();
		
		
	    console.log("scup"+$rootScope.data2.comments);
		
	};
	
//Function to display the feed of users posts. 	
	function feed(){
		
		$rootScope.data4 = {};
	    $rootScope.data4.posts = posts.getposts("");
		console.log($rootScope.data4.posts);
		
	}
	
}]);



