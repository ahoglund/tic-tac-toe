TicTacToe = {
	init: function() {
		$(document).on('click',"a.tile", function() {
      $(this).attr('id');
      $(this).find('span.tile-content').html("X");
		});
		$(document).on('click', "#new-game", function() {
      // $.get("/game/new", { salutation: "Howdy", name: "Friend" },
      $.get("/game/new",
       function(result) { 
        	$("a.tile span.tile-content").html("");
        }
      );
		})

		$(document).on('click', ".tile", function() {
			var current_player = $(this).data("player");
      $.get("/move/" + current_player,
       function(result) { 
        	$("a.tile span.tile-content").html(result);
        }
      );
		})
	}
}

$(document).ready(function() {
  TicTacToe.init();
});