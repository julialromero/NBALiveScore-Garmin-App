
class GameStats {
	var game_data, num_games;
	var game_iterator = 0;
	var nuggs_game_index = -1;
	var _view;
    
	public var quarter;
	public var status;
	public var clock;
	public var visitor;
	public var v_points;
	public var home;
	public var h_points;

	function update_game_data(r as Dictionary){
		game_data = r["api"]["games"];
		num_games = r["api"]["results"];
	}

	function initialize(r as Dictionary, view) {
		_view = view;
		update_game_data(r);
		
		var is_nuggets = false;
		var team;
		
		// identify nuggets game
		for(var i = 0; i < num_games; i++){
			team = game_data[i]["vTeam"]["shortName"];
			if(team.equals("NUG")){
				is_nuggets = true;
				nuggs_game_index = i;
				break;
			}
			
			team = game_data[i]["hTeam"]["shortName"];
			if(team.equals("NUG")){
				is_nuggets = true;
				nuggs_game_index = i;
				break;
			}
		}

		// If nuggets game is on, display nuggs stats
		if(nuggs_game_index != -1){
			game_iterator = nuggs_game_index;
		}

		set_game_stats();

    }

	function set_game_stats(){
		// Populate game stats
	    self.quarter = 	game_data[game_iterator]["currentPeriod"];
	    self.status = 	game_data[game_iterator]["statusGame"];
	    self.clock = 	game_data[game_iterator]["clock"];
	    self.visitor = 	game_data[game_iterator]["vTeam"]["nickName"];
	    self.v_points = game_data[game_iterator]["vTeam"]["score"]["points"];
	
	    self.home = 	game_data[game_iterator]["hTeam"]["nickName"];
	    self.h_points = game_data[game_iterator]["hTeam"]["score"]["points"];

		update_view();
	}

	// increment game index and update view
	function increment_game(){
		if(game_iterator == num_games-1){
			return;
		}

		game_iterator++;
		set_game_stats();
	}

	// decrement game index and update view
	function decrement_game(){
		if(game_iterator == 0){
			return;
		}

		game_iterator--;
		set_game_stats();
	}

	function update_view(){
		_view.updateStats(self);
	}
	
}
