package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import com.game.factory.Game;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class HeaderAddition extends MovieClip {
		
		// Elements in SWF
		public var numberToMake_txt:TextField;
		public var currentNumber_txt:TextField;
		
		// Game elements
		private var main:Main;
		private var game:Game;
		
		public function HeaderAddition() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("HEADER ADDITION SWF LOADED");
			
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			this.numberToMake_txt.text = this.game.GenerateRandomNumber(20, 500).toString();
			
			this.game.SetUpdateScoreFunction(this.SetCurrentNumber);
			this.game.StartRain();
		}
		
		//**************************//
		// CURRENT NUMBER FUNCTIONS //
		//**************************//
		private var updateNumbers:Array;
		private var updateNumberTimer:Timer;
		
		private function SetCurrentNumber(setNumber:Number)
		{
			var currentNumber:Number = this.GetCurrentNumber();
		
			updateNumbers = new Array();
			
			for (var i = currentNumber; i <= (currentNumber + setNumber); i++)
			{
				updateNumbers.push(i);
			}
		
			updateNumberTimer = new Timer(20);
			
			updateNumberTimer.addEventListener(TimerEvent.TIMER, this.UpdateCurrentNumber);
			updateNumberTimer.start();
		}
		
		private function UpdateCurrentNumber(e:TimerEvent = null)
		{
			if (this.updateNumbers[0] != null)
			{
				this.currentNumber_txt.text = this.updateNumbers[0].toString();
				this.updateNumbers.shift();
			}else{
				this.updateNumberTimer.stop();
			}
		}
		
		private function GetCurrentNumber():Number
		{
			return parseInt(this.currentNumber_txt.text);
		}
	}
	
}
