package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	public class Water extends MovieClip {
		
		// Game variables
		private var main:Main;
		private var game:Game;
		
		// Elements on screen
		public var waterFill_mc:MovieClip;
		public var waterLevel_mc:MovieClip;
		
		// Tweens
		private var waterFillTween:TweenMax;
		private var waterLevelTween:TweenMax;
		
		private var waterFillDefaultY:Number;
		
		public function Water() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			main = this.stage.getChildAt(0) as Main;
			game = main.game;
			
			this.waterFillDefaultY = this.waterFill_mc.y;
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
		
		public function ResetWaterLevel()
		{
			waterFillTween = new TweenMax(this.waterFill_mc, 1, { y: this.waterFillDefaultY, ease: Circ.easeIn });
			waterFillTween.play();
		}
		
		public function DecreaseWaterLevel()
		{
			waterLevelTween = new TweenMax(this.waterLevel_mc, 1, { y: (this.waterLevel_mc.y + 60), ease: Quad.easeIn });
			waterLevelTween.play();
		}
	}
	
}
