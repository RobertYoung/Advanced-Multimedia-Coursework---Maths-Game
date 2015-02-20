package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import com.greensock.TimelineMax;
	import com.game.elements.Wave;
	import com.game.elements.Mark;
	import flash.geom.Point;
	import com.game.elements.Raindrop;
	
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
				this.game.MaxWaterLevelReached();
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
		
		public function CreateWaveTween()
		{
			trace("Wave tween");
			var bezier:Array = new Array();
			
			for (var i = 0; i < 1150; i += 20)
			{
				var nY = i % 12 == 0 ? 15 : 20;
				var pos = { x: i, y: nY };
				
				bezier.push(pos);
			}
			
			for (var o = 1; o <= 40; o++)
			{
				var wave:Wave = new Wave();
				
				wave.x = -50;
				wave.y = 40;
				
				this.waterFill_mc.addChild(wave);
				
				var tween:TweenMax = new TweenMax(wave, 25, {  bezier: bezier,
																repeat:-1, 
																ease: Sine.easeInOut });
				tween.delay(o * 0.8);
				tween.seek(o * 2.4);
				tween.play();
			}
		}
	}	
}
