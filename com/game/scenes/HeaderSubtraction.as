package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import flash.text.TextField;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.game.elements.IncorrectAlertview;
	import com.game.factory.MathsSharedObject;
	
	public class HeaderSubtraction extends MovieClip {
		
		// Game variables
		private var main:Main;
		private var game:Game;
		
		// Elements in SWF file
		public var currentNumber_txt:TextField;
		public var numberToMake_txt:TextField;
		public var level_txt:TextField;
		
		// Number elements
		private var currentNumber:Number;
		private var numberToMake:Number;
		private var levelNumber:Number;
		private var originalNumber:Number;
		
		public function HeaderSubtraction() {
			/* DO NOT PUT ANYTHING IN HERE*/
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			this.game.AddProgressMeter(this.numberToMake, this.originalNumber);
			this.SetRandomNumberToMake();
			this.game.SetUpdateScoreFunction(this.SetCurrentNumber);
			this.GenerateRandomCurrentNumber();
			this.SetLevel(1);
			this.game.SetRaindropMinMaxValues(1, 20);
			this.game.SetMaxWaterLevel(500);
			this.game.StartRain();
		}
		
		//**************************//
		// CURRENT NUMBER FUNCTIONS //
		//**************************//
		private var numbersToUpdate:Array;
		private var updateNumbers:Array;
		private var updateNumberTimer:Timer;
		
		private function GenerateRandomCurrentNumber()
		{
			this.SetCurrentNumber(this.game.GenerateRandomNumber(20, 300), false);
			this.originalNumber = this.currentNumber;
			this.game.SetNewNumberToMakeProgressMeter(this.originalNumber);
		}
		
		private function SetCurrentNumber(setNumber:Number, animated:Boolean = true)
		{
			if (this.updateNumberTimer != null && this.updateNumberTimer.running)
			{
				if (this.numbersToUpdate == null)
					this.numbersToUpdate = new Array();

				this.numbersToUpdate.push(setNumber);
				
				return;
			}
			
			this.AddCurrentNumber(setNumber, animated);
		}
		
		private function AddCurrentNumber(setNumber:Number, animated:Boolean)
		{
			this.currentNumber = this.GetCurrentNumber();
			
			if (animated)
			{
				updateNumbers = new Array();
				
				for (var i = currentNumber; i >= (currentNumber - setNumber); i--)
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
			this.game.UpdateProgressMeter(this.originalNumber - this.currentNumber);
			
			if (this.currentNumber < this.numberToMake)
			{
				// Incorrect
				var alertview:IncorrectAlertview = new IncorrectAlertview("Oh no!", "Looks like you have gone too far", this.main.LoadSubtractionFromMouseEvent);
				
				alertview.SetOkButtonFunction(this.main.LoadSubtractionFromMouseEvent);
				this.main.addChild(alertview);
				this.main.game.ResetAfterError();
			}else if (this.currentNumber == this.numberToMake)
			{
				this.SaveScore();
				
				// Correct
				if (this.levelNumber == 5)
				{
					this.game.SetGameComplete();
					this.game.GameComplete("subtraction", this.main.LoadPlayFromMouseEvent);
				}else{
					this.IncrementLevel();
					this.SetRandomNumberToMake();
					this.GenerateRandomCurrentNumber();
					this.main.swfWater.ResetWaterLevel();
					this.main.swfWater.DecreaseWaterLevel();
				}
			}
		}
		
		private function SaveScore()
		{
			MathsSharedObject.getInstance().SetSubtractionLevelData(this.levelNumber, this.game.GetScoreTimer());
			this.game.StartScoreTimer();
		}
		
		//**************************//
		// NUMBER TO MAKE FUNCTIONS //
		//**************************//
		private function SetRandomNumberToMake()
		{
			this.SetNumberToMake(this.game.GenerateRandomNumber(0, 0));
		}
		
		private function SetNumberToMake(setNumber:Number)
		{
			this.numberToMake = setNumber;
			this.numberToMake_txt.text = setNumber.toString();
			this.game.SetNewCurrentNumberProgressMeter(this.numberToMake);
		}
		
		//*****************//
		// LEVEL FUNCTIONS //
		//*****************//
		public function SetLevel(level:Number)
		{
			this.levelNumber = level;
			this.level_txt.text = "Level " + level;
		}
		
		public function IncrementLevel()
		{
			this.levelNumber++;
			this.SetLevel(this.levelNumber);
		}
	}
	
}
