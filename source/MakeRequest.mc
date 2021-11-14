// The function defines the variables for each of the
// necessary arguments in a Communications.makeWebRequest() call, then passes
// these variables as the arguments. 
import Toybox.System;
import Toybox.Communications;
import Toybox.Lang;

class MakeRequest {
	public var response;
	var _view;

    // set up the response callback function
    function onReceive(responseCode as Number, data as Dictionary?) as Void {
        if (responseCode == 200) {
            System.println("Request Successful");                   // print success
            
            // create stats object if doesn't exist 
            if(stats == null){
                stats = new GameStats(data, _view);
            }

            stats.update_game_data(data);
            stats.set_game_stats();
            
        } else {
            System.println("Response: " + responseCode);            // print response code
            
        }
    }

    function makeRequest(view, endpoint as String) as Void {
    	_view = view;
    	
        var url = "https://api-nba-v1.p.rapidapi.com/" + endpoint;                         // set the url

        var params = null;

        var options = {                                             // set the options
            :method => Communications.HTTP_REQUEST_METHOD_GET,      // set HTTP method
           
            :headers => {                                           // set headers
            //"Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED},
            "x-rapidapi-host" => "api-nba-v1.p.rapidapi.com",
   			"x-rapidapi-key" => $.ServerToken},
            // set response type
            :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
        };

        var responseCallback = method(:onReceive);                  // set responseCallback to
        // onReceive() method
        // Make the Communications.makeWebRequest() call

        Communications.makeWebRequest(url, params, options, method(:onReceive));
    }
}

