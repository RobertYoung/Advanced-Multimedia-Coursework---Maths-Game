package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import flash.text.TextField;
	import com.game.elements.IncorrectAlertview;
	import com.game.factory.MathsSharedObject;
	
	public class HeaderMultiplication extends MovieClip {
		
		// Game variables
		private var main:Main;
		private var game:Game;
		
		// Elements on SWF file
		public var number1_txt:TextField;
		public var number2_txt:TextField;
		public var numberToMake_txt:TextField;
		public var level_txt:TextField;
		
		// Number varialbes
		private var number1:Number;
		private var number2:Number;
		private var numberToMake:Number;
		private var levelNumber:Number;
		
		public function HeaderMultiplication() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			
			this.SetRandomNumberToMake();
			this.game.SetMaxWaterLevel(400);
			this.game.SetUpdateScoreFunction(this.RaindropCaught);
			this.game.SetRaindropMinMaxValues(10, 11);
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
			this.SetNumberToMake(this.game.GenerateRandomNumber(100, 100));
		}
		
		//********************//
		// NUMBER 1 FUNCTIONS //
		//********************//
		private function SetNumber1(num:Number)
		{
			this.number1 = num;
			this.number1_txt.text = num == 0 ? "" : num.toString();
		}
		
		private function GetNumber1():Number
		{
			return parseInt(this.number1_txt.text);
		}
		
		//********************//
		// NUMBER 2 FUNCTIONS //
		//********************//
		private function SetNumber2(num:Number)
		{
			this.number2 = num;
			this.number2_txt.text = num == 0 ? "" : num.toString();
		}
		
		private function GetNumber2():Number
		{
			return parseInt(this.number2_txt.text);
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
		
		private function SaveScore()
		{
			MathsSharedObject.getInstance().SetMultiplicationLevelData(this.levelNumber, this.game.GetScoreTimer());
			this.game.StartScoreTimer();
			trace(MathsSharedObject.getInstance().GetMultiplicationLevelData(this.levelNumber));
		}
		
		//*****************//
		// RAINDROP CAUGHT //
		//*****************//
		private function RaindropCaught(number:Number)
		{
			if (this.number1_txt.text == "")
			{
				this.SetNumber1(number);
			}else if (this.number2_txt.text == "")
			{
				this.SetNumber2(number);
				
				if ((this.number1 * this.number2) == this.GetNumberToMake())
				{
					this.SaveScore();
					
					// Correct
					if (this.levelNumber == 5)
					{
						this.game.SetGameComplete();
						this.game.GameComplete("multiplication", this.main.LoadPlayFromMouseEvent);
					}else{
						this.IncrementLevel();
						this.SetNumber1(0);
						this.SetNumber2(0);
						this.SetRandomNumberToMake();
						this.main.swfWater.ResetWaterLevel();
						this.main.swfWater.DecreaseWaterLevel();
					}
				}else{
					// Incorrect
					var alertview:IncorrectAlertview = new IncorrectAlertview("Oh no!", this.number1 + " x " + this.number2 + " does not equal " + this.GetNumberToMake(), this.main.LoadMultiplicationFromMouseEvent);

					this.main.addChild(alertview);
					this.main.game.ResetAfterError();
				}
			}
		}
	}
}
