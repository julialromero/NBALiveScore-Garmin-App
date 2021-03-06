import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.Timer;


class Nuggets_Score_AppView extends WatchUi.View {
    var myTimer = new Timer.Timer();
    var requester = new MakeRequest();

    
    function initialize() {
        View.initialize();
    }


    // Load  resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.LoadStats(dc));
    }

    // Called when this View is brought to the foreground.
    function onShow() as Void { 
    	var endpoint = "games/live/";
    	requester.makeRequest(self, endpoint);
    	
    	// TODO: check if game is finished

        // TODO: Logic to handle halftime
    	
    	myTimer.start(method(:onShow), 180000, true);  // loop every 3 minutes

    }


    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }


    // Called when this View is removed from the screen.
    function onHide() as Void {
    }
    
    
    // Function called when the game view is incremented or initial request is returned
    function updateStats(stats) {
    
        var view = View.findDrawableById("team1");
        view.setText(stats.home);
        view = View.findDrawableById("team2");
        view.setText(stats.visitor);
        
        view = View.findDrawableById("score1");
        view.setText(stats.h_points);
        view = View.findDrawableById("score2");
        view.setText(stats.v_points);
        
        view = View.findDrawableById("quarter");
        view.setText(stats.quarter);
        view = View.findDrawableById("time");
        view.setText(stats.clock);
        
        WatchUi.requestUpdate();
    }

}
