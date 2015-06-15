$(document).ready(function(){

    var ctr = 0;
    setInterval(function() {
      var message_id = $(".messages_container div:last-child").attr('message_id');
      $.ajax({
        type: "GET",
        url: "/messages/"+message_id,
        success: function(){
        }
      }).done(function(new_messages){
        $.each(new_messages, function(key, data){
          $(".messages_container").append(
            "<div class='well well-sm animated bounceIn' message_id='"+data.id+"'>"+
              "<a href='/user/"+data.user_id+"'>"
              +data.user.first_name+" "+data.user.last_name+
              "</a>: "
              +data.main_message+
            "</div>"
          ).scrollTop(9999999);
        });
      });
    }, 5000);

    $("#js-message").on("ajax:success",function(e,data,status,xhr){
      $(".messages_container").append(
        "<div class='text-right well well-sm animated fadeIn' message_id='"+data.id+"'>"+
          // "<a href='/user/"+data.user_id+"'>"
          // +data.user.first_name+" "+data.user.last_name+
          // "</a>: "
          "<strong>You</strong>: "
          +data.main_message+
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
