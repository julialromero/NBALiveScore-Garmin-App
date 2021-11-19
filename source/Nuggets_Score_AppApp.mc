import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

var stats = null;

class Nuggets_Score_AppApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
        //InputDelegate = new MyInputDelegate();
        new ToggleGamesDelegate();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    // when user hits button, check if nuggets game is live
    	
    // if nuggets game is live, get score
    	
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
    	// check if phone is paired
		if(!System.getDeviceSettings().phoneConnected) {
                System.println("phone not connected");
		        return [new ConnectToGcmView() ];
		    } 
		    
		// TODO: return default loading view instead
		return [new Nuggets_Score_AppView(), new ToggleGamesDelegate()];
    }
}	


function getApp() as Nuggets_Score_AppApp {
    return Application.getApp() as Nuggets_Score_AppApp;
}


class ToggleGamesDelegate extends WatchUi.InputDelegate {
    function initialize() {
        InputDelegate.initialize();
    }

    // function onKey(evt) {
    //     System.println("Key is pressed");
    // 	return true;
    // }

    // function onTap(clickEvent) {
    //     System.println("tap detected");
    //     System.println(clickEvent.getCoordinates()); // e.g. [36, 40]
    //     System.println(clickEvent.getType());        // CLICK_TYPE_TAP = 0
    //     return true;
    // }

    function onSwipe(swipeEvent) {
        if(stats == null){
            return true;
        }

        var direction = swipeEvent.getDirection();
        System.println(swipeEvent.getDirection()); // e.g. SWIPE_DOWN = 2

        // if right swipe
        if(direction == 1){
            stats.increment_game();
        }

        // if left swipe
        if(direction == 3){
            stats.decrement_game();
        }

        return true;
    }
}
