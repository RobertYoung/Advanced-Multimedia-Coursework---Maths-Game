package com.game.factory {
	import com.game.elements.Raindrop;
	import com.game.scenes.Main;
	import flash.geom.Point;
	import com.greensock.TweenMax;
	import com.greensock.events.LoaderEvent;
	import com.greensock.easing.*;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	public class Game {

		// Game variables
		var main:Main;
		var duration:Number = 8;
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
		
		//**********************//
		// RESET GAME FUNCTIONS //
		//**********************//
		public function ResetAfterError()
		{
			this.rainTimer.stop();
			this.main.swfBucket.StopDrag();
		}
		
		private function InErrorState():Boolean
		{
			if (this.main.getChildByName(Main.ELEMENT_INCORRECT_ALERTVIEW) == null)
				return false;
			
			return true;
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
			
			var raindropTween:TweenMax = new TweenMax(raindrop, duration, { x: point.x, y: 850, onComplete: this.RaindropTweenComplete, onCompleteParams: [raindrop], ease: Circ.easeIn});
			
			raindropTween.play();
		}
		
		private function RaindropTweenComplete(raindrop:Raindrop)
		{
			this.RemoveRaindrop(raindrop);
			
			this.main.swfWater.IncreaseWaterLevel();
		}
		
		private function RemoveRaindrop(raindrop:Raindrop)
		{
			if (raindrop.parent != null)
				raindrop.parent.removeChild(raindrop);
		}
		
		private function RandomRaindropPosition():Point
		{
			var point:Point = new Point();
			
			point.x = this.GenerateRandomNumber(50, 984);
			point.y = this.GenerateRandomNumber(-100, -1000);
			
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
				// Check to see if there is an error alertview
				if (this.InErrorState())
					return; 
			
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
