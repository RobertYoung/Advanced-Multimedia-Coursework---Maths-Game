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
		public var level_txt:TextField;
		
		// Game elements
		private var main:Main;
		private var game:Game;
		
		// Number elements
		private var currentNumber:Number;
		private var numberToMake:Number;
		private var levelNumber:Number;
		
		public function HeaderAddition() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("HEADER ADDITION SWF LOADED");
			
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			this.SetRandomNumberToMake();
			this.game.SetUpdateScoreFunction(this.SetCurrentNumber);
			this.SetLevel(1);
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
		
		private function SetRandomNumberToMake()
		{
			this.SetNumberToMake(this.game.GenerateRandomNumber(20, 20));
		}
		
		//**************************//
		// CURRENT NUMBER FUNCTIONS //
		//**************************//
		private var updateNumbers:Array;
		private var updateNumberTimer:Timer;
		
		private function SetCurrentNumber(setNumber:Number, animated:Boolean = true)
		{
			this.currentNumber = this.GetCurrentNumber();
			
			if (animated)
			{
				updateNumbers = new Array();
				
				for (var i = currentNumber; i <= (currentNumber + setNumber); i++)
				{
					updateNumbers.push(i);
				}

				updateNumberTimer = new Timer(20);
				updateNumberTimer.addEventListener(TimerEvent.TIMER, this.UpdateCurrentNumber);
				updateNumberTimer.start();
			}else{
				this.currentNumber_txt.text = setNumber.toString();
			}
			
			this.currentNumber = setNumber;
		}
		
		private function UpdateCurrentNumber(e:TimerEvent = null)
		{
			if (this.updateNumbers[0] != null)
			{
				this.currentNumber_txt.text = this.updateNumbers[0].toString();
				this.updateNumbers.shift();
				this.currentNumber = this.GetCurrentNumber();
			}else{
				this.updateNumberTimer.stop();
				this.CheckScores();
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
				this.IncrementLevel();
				this.SetNumberToMake(0);
				this.SetRandomNumberToMake();
				this.SetCurrentNumber(0, false);
			}
		}
		
		//*****************//
		// LEVEL FUNCTIONS //
		//*****************//
		public function SetLevel(level:Number)
		{
			this.levelNumber = level;
			this.level_txt.text = "Level " + level + ":";
		}
		
		public function IncrementLevel()
		{
			this.levelNumber++;
			this.SetLevel(this.levelNumber);
		}
	}
	
}
