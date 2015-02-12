package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	
	
	public class Water extends MovieClip {
		
		// Game variables
		private var main:Main;
		private var game:Game;
		
		// Elements on screen
		public var waterFill_mc:MovieClip;
		public var waterLevel_mc:MovieClip;
		
		public function Water() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			main = this.stage.getChildAt(0) as Main;
			game = main.game;
		}
		
		public function IncreaseWaterLevel()
		{
			this.waterFill_mc.y = this.waterFill_mc.y - 2;

			// Water gone past max
			if (this.waterFill_mc.y < this.waterLevel_mc.y)
			{
				this.game.waterLevelReachedMaxFunction();
			}
		}
		
		public function SetWaterLevel(setY:Number)
		{
			this.waterLevel_mc.y = setY;
		}
	}
	
}
