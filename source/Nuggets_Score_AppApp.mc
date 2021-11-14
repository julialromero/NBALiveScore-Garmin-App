import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class Nuggets_Score_AppApp extends Application.AppBase {
    var InputDelegate;
    function initialize() {
        AppBase.initialize();
        InputDelegate = new MyInputDelegate();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    // when user hits button, check if nuggets game is live
    	
    // if nuggets game is live, get score
    	
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
        System.println("onStop");
    	// quit query
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
    	// check if phone is paired
		if(!System.getDeviceSettings().phoneConnected) {
                System.println("phone not connected");
		        return [new ConnectToGcmView() ];
		    } 
		    
		// TODO: return default loading view instead
		return [new Nuggets_Score_AppView() ];
    }
}	



function getApp() as Nuggets_Score_AppApp {
    return Application.getApp() as Nuggets_Score_AppApp;
}


// class ClickDelegate extends WatchUi.BehaviorDelegate {
//     function initialize() {
//         BehaviorDelegate.initialize();
//     }
//     function onKey(evt) {
//         System.println("Key is pressed");
//     	return [ new Nuggets_Score_AppView() ] as Array<Views or InputDelegates>;
//     }
// }

// class InputDelegate extends WatchUi.BehaviorDelegate {
//     function onTap(clickEvent) {
//         System.println(clickEvent.getCoordinates()); // e.g. [36, 40]
//         System.println(clickEvent.getType());        // CLICK_TYPE_TAP = 0
//         return true;
//     }
// }

class MyInputDelegate extends WatchUi.InputDelegate {
    function initialize() {
        System.println("init input delegate");
        WatchUi.InputDelegate.initialize();
    }
    
    function onKey(keyEvent) {
        System.println("key");
        System.println(keyEvent.getKey());         // e.g. KEY_MENU = 7
        return true;
    }

    function onTap(clickEvent) {
        System.println("tap");
        System.println(clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
        return true;
    }

    function onSwipe(swipeEvent) {
        System.println("swip");
        System.println(swipeEvent.getDirection()); // e.g. SWIPE_DOWN = 2
        return true;
    }
}