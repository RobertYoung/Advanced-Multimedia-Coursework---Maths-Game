package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import com.game.factory.Game;
	
	
	public class HeaderAddition extends MovieClip {
		
		// Elements in SWF
		public var numberToMake_txt:TextField;
		public var currentNumber_txt:TextField;
		
		// Game elements
		private var main:Main;
		private var game:Game;
		
		public function HeaderAddition() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("HEADER ADDITION SWF LOADED");
			
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			this.numberToMake_txt.text = this.game.GenerateRandomNumber(20, 500).toString();
			
			this.game.StartRain();
		}
	}
	
}
