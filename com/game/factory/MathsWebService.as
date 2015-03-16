package com.game.factory {
	import com.alducente.services.WebService;
	import flash.events.Event;
	
	public class MathsWebService {

		// Constant variables
		private static const WEB_SERVICE_URL:String = "http://cmpproj.cms.livjm.ac.uk/cmpryoun/services/mathsservice/WebService.asmx?WSDL"
		
		// Web service variables
		var webService:WebService;
		
		public function MathsWebService() {
			
		}

		//************//
		// SAVE SCORE //
		//************//
		private var level:String;
		private var totalTime:Number;
		private var username:String;
		public function SaveScore(setLevel:String, setTotalTime:Number, setUsername:String)
		{
			this.level = setLevel;
			this.totalTime = setTotalTime;
			this.username = setUsername;
			
			webService = new WebService();
			webService.addEventListener(Event.CONNECT, SaveScoreConnection);
			webService.connect(MathsWebService.WEB_SERVICE_URL);
		}
		
		private function SaveScoreConnection(e:Event)
		{
			webService.SaveScore(SaveScoreComplete, level, totalTime, this.username);
		}
		
		private function SaveScoreComplete(response:XML)
		{
			trace("WEB SERVICE - SAVE SCORE: " + response.child("*").child("*").child("*"));
			
			if (response.child("*").child("*").child("*") == "Saved") {
				
			}else{
				
			}
		}
		
		//************//
		// GET SCORES //
		//************//
		private var getScoresCallback:Function;
		private var getScoresLevel:String;
		public function GetScores(setLevel:String, callback:Function)
		{
			this.getScoresLevel = setLevel;
			this.getScoresCallback = callback;
			
			webService = new WebService();
			webService.addEventListener(Event.CONNECT, GetScoresConnection);
			webService.connect(MathsWebService.WEB_SERVICE_URL);
		}
		
		private function GetScoresConnection(e:Event)
		{
			webService.GetScores(GetScoresComplete, this.getScoresLevel);
		}
		
		private function GetScoresComplete(response:XML)
		{
			trace("WEB SERVICE - SAVE SCORE: " + response.child("*").child("*").child("*"));

			var scores = response.child("*").child("*").child("*").child("*");
			
			if (getScoresCallback != null)
			{
				this.getScoresCallback(scores);
			}
		}
	}
}
