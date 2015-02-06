package com.game.scenes {
	
	import flash.display.MovieClip;
	
	
	public class Water extends MovieClip {
		
		public var waterFill_mc:MovieClip;
		
		public function Water() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("WATER SWF LOADED");
		}
		
		public function IncreaseWaterLevel()
		{
			this.waterFill_mc.y = this.waterFill_mc.y - 10;
		}
	}
	
}
