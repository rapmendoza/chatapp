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

    var reach_end = false;
    $(".messages_container").scroll(function(){
      if($(".messages_container").scrollTop() == 0){
        var count = parseInt($(".messages_container").attr("count"))+5;
        $(".messages_container").attr("count", count);
        $.ajax({
          type: "GET",
          url: "/messages/more/"+count
        }).done(function(messages){
          // console.log(messages);
          var user_id = $("#user_id").attr("value");
          var current = $(".messages_container").attr("current");
          if (current != messages.length) {
            $(".messages_container").html("");
            $.each(messages, function(key, data){
              var message = $("<div>").text(data.main_message).html();
              if (data.user_id != user_id) {
                $(".messages_container").append(
                  "<div class='well well-sm' message_id='"+data.id+"'>"+
                    "<a href='/user/"+data.user_id+"'>"
                    +data.user.first_name+" "+data.user.last_name+
                    "</a>: "
                    +message+
                  "</div>"
                ).scrollTop(300);
              } else {
                $(".messages_container").append(
                  "<div class='well well-sm text-right' message_id='"+data.id+"'>"+
                    "<strong>You</strong>: "
                    +message+
                  "</div>"
                ).scrollTop(300);
              }
            });
          } else if (reach_end != true) {
            reach_end = true;
            $(".messages_container").prepend(
              "<div class='well well-lg text-center animated bounceIn' id='no_more'>"
                +"<h4><strong>No more messages.</strong></h4>"+
              "</div>"
            ).scrollTop(0);
          }
          $(".messages_container").attr("current", messages.length);
        });
      }
    });

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
