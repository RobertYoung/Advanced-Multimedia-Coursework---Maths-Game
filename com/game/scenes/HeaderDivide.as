package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import flash.text.TextField;
	import com.game.elements.IncorrectAlertview;
	import com.game.factory.MathsSharedObject;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.greensock.events.TweenEvent;
	
	public class HeaderDivide extends MovieClip {
		
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
		
		// Tween variables
		private var number1Tween:TimelineMax;
		
		public function HeaderDivide() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			
			this.SetupDivision();
			this.game.SetMaxWaterLevel(300);
			this.game.SetWaterLevelReachedMaxFunction(this.main.LoadDivideFromMouseEvent);
			this.game.SetUpdateScoreFunction(this.RaindropCaught);
			this.game.SetRaindropMinMaxValues(1, 10);
			this.SetLevel(1);
			this.game.StartRain();
		}
		
		//*****************//
		// SETUP FUNCTIONS //
		//*****************//
		private function SetupDivision()
		{
			//this.SetRandomNumberToMake();
			//this.SetRandomNumber2();
			
			var number2:Number = this.game.GenerateRandomNumber(1, 10);
			var numberToMake:Number = this.game.GenerateRandomNumber(1, 10);
			
			this.SetNumber2(number2 * numberToMake);
			this.SetNumberToMake(numberToMake);
			trace(this.GetNumber2() + " / " + number2 + " = " +numberToMake);
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
			this.SetNumberToMake(this.game.GenerateRandomNumber(1, 10));
		}
		
		//********************//
		// NUMBER 1 FUNCTIONS //
		//********************//
		private function SetNumber1(num:Number)
		{
			this.number1 = num;
			this.number1_txt.alpha = 0;
			this.number1_txt.text = num == 0 ? "" : num.toString();
			
			if (this.number1Tween == null)
				this.number1Tween = new TimelineMax();
			
			this.number1Tween.append(new TweenMax(this.number1_txt, 1, { alpha: 1 }));
			this.number1Tween.play();
		}
		
		private function GetNumber1():Number
		{
			return parseInt(this.number1_txt.text);
		}
		
		private function ResetNumber1()
		{
			if (this.number1Tween != null)
			{
				if (this.number1Tween.isActive())
					this.number1Tween.call(this.ReverseNumber1Tween);
				else
					this.ReverseNumber1Tween();
			}
		}
		
		private function ReverseNumber1Tween()
		{
			this.number1Tween.reverse();
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
		
		private function SetRandomNumber2()
		{
			this.SetNumber2(this.game.GenerateRandomNumber(1, 10));
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
			MathsSharedObject.getInstance().SetDivisionLevelData(this.levelNumber, this.game.GetScoreTimer());
			this.game.StartScoreTimer();
		}
		
		private function GetTotalTimeTaken():Number
		{
			return MathsSharedObject.getInstance().GetDivisionTotalTimeTaken();
		}
		
		//*****************//
		// RAINDROP CAUGHT //
		//*****************//
		private function RaindropCaught(number:Number)
		{
			this.SetNumber1(number);
			
			if ((this.number2 / this.number1) == this.GetNumberToMake())
			{
				this.SaveScore();
				
				// Correct
				if (this.levelNumber == 5)
				{
					this.game.SetGameComplete();
					this.game.GameComplete("divide", this.main.LoadPlayFromMouseEvent, this.GetTotalTimeTaken());
				}else{
					this.IncrementLevel();
					this.SetupDivision();
					this.main.swfWater.ResetWaterLevel();
					this.main.swfWater.DecreaseWaterLevel();
					this.ResetNumber1();
				}
			}else{
				// Incorrect
				var alertview:IncorrectAlertview = new IncorrectAlertview("Oh no!", this.number2 + " ÷ " + this.number1 + " does not equal " + this.GetNumberToMake(), this.main.LoadDivideFromMouseEvent);

				this.main.addChild(alertview);
				this.main.game.ResetAfterError();
			}
		}
	}
}
