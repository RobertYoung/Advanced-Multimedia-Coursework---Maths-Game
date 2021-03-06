﻿package com.game.factory {
	
	import com.game.scenes.Main;
	import flash.geom.Point;
	import com.greensock.TweenMax;
	import com.greensock.events.LoaderEvent;
	import com.greensock.easing.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import com.game.elements.*;
	
	public class Game {

		// Game variables
		var main:Main;
		var duration:Number = 8;
		var rainTimer:Timer;
		var raindropMinValue:Number = 10;
		var raindropMaxValue:Number = 11;
		var scoreTimer:Timer;
		
		// Function variables
		var updateScoresFunction:Function;
		public var waterLevelReachedMaxFunction:Function;
		
		// Progress meter variables
		private var progressMeter:ProgressMeter;
		
		// Sound variables
		private var droplet:Droplet;
		private var dropletWrong:DropletWrong;
		
		public function Game(setMain:Main) {
			this.main = setMain;
		}

		//**********************//
		// START GAME FUNCTIONS //
		//**********************//
		public function StartRain()
		{
			if (rainTimer == null)
				rainTimer = new Timer(this.GenerateRandomNumber(1000, 2000));
			
			rainTimer.addEventListener(TimerEvent.TIMER, this.CreateRaindrop);
			rainTimer.start();
			this.StartScoreTimer();
		}
		
		//**********************//
		// RESET GAME FUNCTIONS //
		//**********************//
		public function ResetAfterError()
		{
			this.rainTimer.stop();
			this.main.swfBucket.StopDrag();
			this.FadeAllRaindrops();
		}
		
		public function InErrorState():Boolean
		{
			if (this.main.getChildByName(Main.ELEMENT_INCORRECT_ALERTVIEW) == null)
				return false;
			
			return true;
		}
		
		//***************//
		// GAME COMPLETE //
		//***************//
		private function IsGameComplete():Boolean
		{
			if (this.main.getChildByName(Main.ELEMENT_COMPLETE_ALERTVIEW) == null)
				return false;
			
			return true;
		}
		
		public function SetGameComplete()
		{
			this.rainTimer.stop();
			this.main.swfBucket.StopDrag();
			this.FadeAllRaindrops();
		}

		public function GameComplete(level:String, okFunction:Function, time:Number = 0)
		{
			var alertview:CompleteAlertview = new CompleteAlertview("You have successfully completed all the " + level + " levels", okFunction, level, time);
			
			this.main.addChild(alertview);
		}
		
		//****************//
		// RANDOM NUMBERS //
		//****************//
		public function GenerateRandomNumber(minValue:Number, maxValue:Number):Number
		{
			return (Math.floor(Math.random() * (maxValue - minValue + 1)) + minValue);
		}
		
		//********************//
		// RAINDROP FUNCTIONS //
		//********************//
		public function CreateRaindrop(e:TimerEvent = null)
		{
			var raindrop:Raindrop = new Raindrop();
			var point:Point = this.RandomRaindropPosition();
			
			raindrop.x = point.x;
			raindrop.y = point.y;
			raindrop.SetNumber(this.RandomRaindropnumber());
			raindrop.addEventListener(Event.ENTER_FRAME, CheckRaindropHitsBucket);
			raindrop.name = Main.ELEMENT_RAINDROP;
			
			main.addChild(raindrop);
			
			raindrop.StartTween(duration);
		}
		
		private function RandomRaindropPosition():Point
		{
			var point:Point = new Point();
			
			point.x = this.GenerateRandomNumber(50, 984);
			point.y = this.GenerateRandomNumber(-50, -400);
			
			return point;
		}
		
		private function RandomRaindropnumber():Number
		{
			return this.GenerateRandomNumber(this.raindropMinValue, this.raindropMaxValue);
		}
		
		private function CheckRaindropHitsBucket(e:Event)
		{
			var raindrop:Raindrop = e.target as Raindrop;
			
			if (raindrop.hitTestObject(this.main.swfBucket.bucket_mc) == true)
			{
				// Check to see if there is an error alertview or complete alertview
				if (this.InErrorState() || this.IsGameComplete())
					return; 
			
				raindrop.removeEventListener(Event.ENTER_FRAME, CheckRaindropHitsBucket);
				
				var number:Number = raindrop.GetNumber();
				
				if (this.updateScoresFunction != null)
					this.updateScoresFunction(number);
				
				raindrop.RemoveRaindrop();
				
				this.PlayDropletSound();
			}
		}
		
		public function FadeAllRaindrops()
		{
			for (var i = 0; i < this.main.numChildren; i++)
			{
				if (this.main.getChildAt(i).name == Main.ELEMENT_RAINDROP)
				{
					var raindrop:Raindrop = this.main.getChildAt(i) as Raindrop;
					
					raindrop.removeEventListener(Event.ENTER_FRAME, CheckRaindropHitsBucket);
					raindrop.StartFade();
				}
			}
		}
		
		public function SetRaindropMinMaxValues(min:Number, max:Number)
		{
			this.raindropMinValue = min;
			this.raindropMaxValue = max;
		}
		
		//*************************//
		// UPDATE SCORES FUNCTIONS //
		//*************************//
		public function SetUpdateScoreFunction(setFunction:Function)
		{
			this.updateScoresFunction = setFunction;
		}
		
		//***********************//
		// WATER LEVEL FUNCTIONS //
		//***********************//
		public function SetWaterLevelReachedMaxFunction(setFunction:Function)
		{
			this.waterLevelReachedMaxFunction = setFunction;
		}

		public function SetMaxWaterLevel(max:Number)
		{
			this.main.swfWater.SetWaterLevel(max);
		}
		
		public function MaxWaterLevelReached()
		{
			var alertview:IncorrectAlertview = new IncorrectAlertview("Oh no!", "The room has filled with too much water", this.waterLevelReachedMaxFunction);
			
			this.main.addChild(alertview);
			this.FadeAllRaindrops();
			this.main.game.ResetAfterError();
		}
		
		//*****************//
		// TIMER FUNCTIONS //
		//*****************//
		public function StopTimer()
		{
			if (this.rainTimer != null && this.rainTimer.running)
				this.rainTimer.stop();
			
			if (this.scoreTimer != null && this.scoreTimer.running)
				this.scoreTimer.stop();
		}
		
		//*****************//
		// SCORE FUNCTIONS //
		//*****************//
		public function StartScoreTimer()
		{
			this.scoreTimer = new Timer(100);
			this.scoreTimer.start();
		}
		
		public function GetScoreTimer():Number
		{
			return this.scoreTimer.currentCount / 10;
		}
		
		//**************************//
		// PROGRESS METER FUNCTIONS //
		//**************************//
		public function AddProgressMeter(current:Number, numberToMake:Number)
		{
			progressMeter = new ProgressMeter(current, numberToMake);
			
			this.main.addChild(progressMeter);
		}
		
		public function UpdateProgressMeter(current:Number)
		{
			progressMeter.SetCurrentNumber(current);
		}
		
		public function SetNewNumberToMakeProgressMeter(number:Number)
		{
			progressMeter.SetNumberToMake(number, false);
		}
		
		public function SetNewCurrentNumberProgressMeter(number:Number)
		{
			progressMeter.SetCurrentNumber(number, false);
		}
		
		//*****************//
		// SOUND FUNCTIONS //
		//*****************//
		public function PlayDropletSound()
		{
			trace("droplet: " + MathsSharedObject.getInstance().GetSound());
			if (!MathsSharedObject.getInstance().GetSound())
				return;
			
			if (this.droplet == null)
				this.droplet = new Droplet();
			
			this.droplet.play();
		}
		
		public function PlayDropletWrongSound()
		{
			trace("droped wrong: " + MathsSharedObject.getInstance().GetSound());
			if (!MathsSharedObject.getInstance().GetSound())
				return;
			
			if (this.dropletWrong == null)
				this.dropletWrong = new DropletWrong();
			
			this.dropletWrong.play();
		}
	}
}
