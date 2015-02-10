package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import com.game.scenes.Main;
	import flash.events.Event;
	
	public class Raindrop extends MovieClip {

		// Game variables
		private var main:Main;
		
		// Elements in raindrop
		public var number_txt:TextField;
		
		// Raindrop variables
		public var tween:TweenMax;
		
		public function Raindrop(setNumber:Number = 00) {
			this.SetNumber(setNumber);
			
			this.addEventListener(Event.ADDED_TO_STAGE, AddedToStage);
		}
		
		//********//
		// EVENTS //
		//********//
		private function AddedToStage(e:Event)
		{
			main = this.stage.getChildAt(0) as Main;
		}

		//******************//
		// NUMBER FUNCTIONS //
		//******************//
		public function SetNumber(setNumber:Number)
		{
			this.number_txt.text = setNumber.toString();
		}
		
		public function GetNumber():Number
		{
			return parseInt(this.number_txt.text);
		}
		
		//****************//
		// FADE FUNCTIONS //
		//****************//
		public function StartFade()
		{
			var tween:TweenMax = new TweenMax(this, 2, { alpha: 0, onComplete: RemoveRaindrop });
			
			tween.play();
		}
		
		//*****************//
		// REMOVE RAINDROP //
		//*****************//
		public function RemoveRaindrop()
		{
			if (this.parent != null)
			{
				this.tween.kill();
				this.parent.removeChild(this);
			}
		}
		
		//*****************//
		// TWEEN FUNCTIONS //
		//*****************//
		public function StartTween(duration:Number)
		{
			this.tween = new TweenMax(this, duration, { x: this.x, y: 850, onComplete: this.TweenComplete, ease: Circ.easeIn});
			this.tween.play();
		}
		
		private function TweenComplete()
		{
			this.RemoveRaindrop();
			this.main.swfWater.IncreaseWaterLevel();
		}
	}
}
