package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import com.greensock.TweenMax;
	
	
	public class Raindrop extends MovieClip {
		
		// Elements in raindrop
		public var number_txt:TextField;
		
		// Raindrop variables
		private var caught:Boolean = false;
		
		public function Raindrop(setNumber:Number = 00) {
			this.SetNumber(setNumber);
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
		
		//******************//
		// CAUGHT FUNCTIONS //
		//******************//
		public function SetCaught()
		{
			this.caught = true;
		}
		
		public function GetCaught():Boolean
		{
			return this.caught;
		}
		
		//****************//
		// FADE FUNCTIONS //
		//****************//
		public function StartFade()
		{
			var tween:TweenMax = new TweenMax(this, 2, { alpha: 0 });
			
			tween.play();
		}
	}
}
