﻿package com.game.factory {
	import com.game.elements.Raindrop;
	import com.game.scenes.Main;
	import flash.geom.Point;
	import com.greensock.TweenMax;
	import com.greensock.events.LoaderEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class Game {

		// Game variables
		var main:Main;
		var duration:Number = 10;
		var rainTimer:Timer;
		
		// Function variables
		var updateScoresFunction:Function;
		
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
			
			main.addChild(raindrop);
			
			var raindropTween:TweenMax = new TweenMax(raindrop, duration, { x: point.x, y: 1200, onComplete: this.RemoveRaindrop, onCompleteParams: [raindrop] });
			
			raindropTween.play();
		}
		
		private function RemoveRaindrop(raindrop:Raindrop)
		{
			raindrop.parent.removeChild(raindrop);
		}
		
		private function RandomRaindropPosition():Point
		{
			var point:Point = new Point();
			
			point.x = this.GenerateRandomNumber(50, 984);
			point.y = this.GenerateRandomNumber(-100, -500);
			
			return point;
		}
		
		private function RandomRaindropnumber():Number
		{
			return this.GenerateRandomNumber(1, 20);
		}
		
		private function CheckRaindropHitsBucket(e:Event)
		{
			var raindrop:Raindrop = e.target as Raindrop;
			
			if (raindrop.hitTestObject(this.main.swfBucket.bucket_mc) == true)
			{
				raindrop.removeEventListener(Event.ENTER_FRAME, CheckRaindropHitsBucket);
				
				var number:Number = raindrop.GetNumber();
				
				if (this.updateScoresFunction != null)
					this.updateScoresFunction(number);
				
				this.RemoveRaindrop(raindrop);
			}
		}
		
		//*************************//
		// UPDATE SCORES FUNCTIONS //
		//*************************//
		public function SetUpdateScoreFunction(setFunction:Function)
		{
			this.updateScoresFunction = setFunction;
		}
	}
}
