$(document).ready(function(){

    $("#js-message").on("ajax:success",function(e,data,status,xhr){
      var message = $("<div>").text(data.main_message).html();
      $(".messages_container").append(
        "<div class='text-right well well-sm animated fadeIn' message_id='"+data.id+"'>"+
          "<strong>You</strong>: "
          +message+
        "</div>"
      ).scrollTop(9999999);
      $('textarea').val('');
    }).on("ajax:error", function(e, data, status, xhr){
      console.log(data);
    });

    // $(".messages_container").scroll(function(){
    //   if($(".messages_container").scrollTop() == 0){
    //     //run next_10 function here
    //     $.ajax("/messages/next_messages");
    //   }
    // });

    $(".messages_container").scrollTop(9999999);

    $('textarea').keypress(function (e) {
      var key = e.which;
      if(window.event.shiftKey && key == 13) {

      } else if(key == 13) {
        event.preventDefault();
        $("#js-message").submit();
      }
    });

    $('div.alert').addClass("animated fadeInDown");
    setTimeout(function() {
      $('div.alert').addClass("animated fadeOutUp");
    }, 3000);

});




// puts "Hello"
// sleep 5
// puts "After Sleep"
// puts "End"
//
// Hello
// After Sleep
// End
//
//
// console.log("Hello")
// setTimeout(function() {
//   console.log("After Sleep")
// }, 5000);
// console.log("End")
//
// Hello
// End
// After Sleep
