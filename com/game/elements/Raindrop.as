package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	
	public class Raindrop extends MovieClip {
		
		public var number_txt:TextField;
		
		public function Raindrop(setNumber:Number = 00) {
			this.SetNumber(setNumber);
		}
		
		public function SetNumber(setNumber:Number)
		{
			this.number_txt.text = setNumber.toString();
		}
	}
	
}
