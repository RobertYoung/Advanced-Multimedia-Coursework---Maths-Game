package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import com.game.factory.Game;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import com.game.elements.IncorrectAlertview;
	
	
	public class HeaderAddition extends MovieClip {
		
		// Elements in SWF
		public var numberToMake_txt:TextField;
		public var currentNumber_txt:TextField;
		
		// Game elements
		private var main:Main;
		private var game:Game;
		
		// Number elements
		private var currentNumber:Number;
		private var numberToMake:Number;
		
		public function HeaderAddition() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("HEADER ADDITION SWF LOADED");
			
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			this.SetNumberToMake(this.game.GenerateRandomNumber(20, 20));
			
			this.game.SetUpdateScoreFunction(this.SetCurrentNumber);
			this.game.StartRain();
		}
		
		//**************************//
		// NUMBER TO MAKE FUNCTIONS //
		//**************************//
		private function GetNumberToMake():Number
		{
			return parseInt(this.numberToMake_txt.text);
		}
		
		private function SetNumberToMake(setNumber:Number)
		{
			this.numberToMake = setNumber;
			this.numberToMake_txt.text = setNumber.toString();;
		}
		
		//**************************//
		// CURRENT NUMBER FUNCTIONS //
		//**************************//
		private var updateNumbers:Array;
		private var updateNumberTimer:Timer;
		
		private function SetCurrentNumber(setNumber:Number)
		{
			currentNumber = this.GetCurrentNumber();
			
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
				this.currentNumber = this.GetCurrentNumber();
			}else{
				this.CheckScores();
				this.updateNumberTimer.stop();
			}
		}
		
		private function GetCurrentNumber():Number
		{
			return parseInt(this.currentNumber_txt.text);
		}
		
		//**************//
		// CHECK SCORES //
		//**************//
		private function CheckScores()
		{
			if (this.currentNumber > this.numberToMake)
			{
				// Incorrect
				var alertview:IncorrectAlertview = new IncorrectAlertview("Oh no!", "Looks like you have gone too far");
				
				this.main.addChild(alertview);
				
				this.main.game.ResetAfterError();
			}else if (this.currentNumber == this.numberToMake)
			{
				// Correct
				trace("well done");
			}
		}
	}
	
}
