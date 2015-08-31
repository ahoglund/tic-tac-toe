TicTacToe = {
	init: function() {
		$(document).on('click',"a.tile", function() {
      $(this).attr('id');
      $(this).find('span.tile-content').html("X");
		});
		$(document).on('click', "#new-game", function() {
      $.get("/game/new",
       function(result) { 
        	$("a.tile span.tile-content").html("");
        }
      );
		});
		$(document).on('click', ".tile", function(e) {
      e.preventDefault();
      player_information = $("#player-information");
      var current_tile   = $(this);
      $.get("/move", {mark: player_information.attr("data-mark"), turn: player_information.attr("data-turn") },
       function(result) {
        	current_tile.attr('disabled', true).css('font-size', '130px').html(result.mark);
          player_information.attr("data-mark", result.mark);
          player_information.attr("data-turn", result.turn);
          player_information.html(result.mark + "'s turn.");
        }
      );
		})
	}
}

$(document).ready(function() {
  TicTacToe.init();
});