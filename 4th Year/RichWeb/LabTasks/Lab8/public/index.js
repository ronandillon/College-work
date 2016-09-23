function simplechat(){

var chat = new Firebase('https://mySimpleChatAppboi.firebaseio.com/');
var messageField = $('#message');
var messageList = $('#example-messages');
messageField.keypress(function (e) {
    if (e.keyCode == 13) {
    
     var usermessage = messageField.val();

    
      chat.push({text:usermessage});
      messageField.val('');
    }
});

chat.limitToLast(1).on('child_added', function (snapshot) {
  
    var data = snapshot.val();
    var message = data.text;


    var li = $("<li class='chatList'>");
    li.text(message);

    messageList.append(li)

    messageList[0].scrollTop = messageList[0].scrollHeight;
});

};