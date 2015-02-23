package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	public class TileBackground extends MovieClip {
		
		// Tile panes
		public var tilePane1_mc:MovieClip;
		public var tilePane2_mc:MovieClip;
		public var tilePane3_mc:MovieClip;
		public var tilePane4_mc:MovieClip;
		public var tilePane5_mc:MovieClip;
		public var tilePane6_mc:MovieClip;
		public var tilePane7_mc:MovieClip;
		public var tilePane8_mc:MovieClip;
		public var tilePane9_mc:MovieClip;
		public var tilePane10_mc:MovieClip;
		public var tilePane11_mc:MovieClip;
		public var tilePane12_mc:MovieClip;
		public var tilePane13_mc:MovieClip;
		public var tilePane14_mc:MovieClip;
		public var tilePane15_mc:MovieClip;
		public var tilePane16_mc:MovieClip;
		public var tilePane17_mc:MovieClip;
		public var tilePane18_mc:MovieClip;
		public var tilePane19_mc:MovieClip;
		public var tilePane20_mc:MovieClip;
		public var tilePane21_mc:MovieClip;
		public var tilePane22_mc:MovieClip;
		public var tilePane23_mc:MovieClip;
		public var tilePane24_mc:MovieClip;
		public var tilePane25_mc:MovieClip;
		public var tilePane26_mc:MovieClip;
		public var tilePane27_mc:MovieClip;
		public var tilePane28_mc:MovieClip;
		public var tilePane29_mc:MovieClip;
		public var tilePane30_mc:MovieClip;
		
		// Tweens
		private var tilePane1_mcTween:TimelineMax;
		private var tilePane2_mcTween:TimelineMax;
		private var tilePane3_mcTween:TimelineMax;
		private var tilePane4_mcTween:TimelineMax;
		private var tilePane5_mcTween:TimelineMax;
		private var tilePane6_mcTween:TimelineMax;
		private var tilePane7_mcTween:TimelineMax;
		private var tilePane8_mcTween:TimelineMax;
		private var tilePane9_mcTween:TimelineMax;
		private var tilePane10_mcTween:TimelineMax;
		private var tilePane11_mcTween:TimelineMax;
		private var tilePane12_mcTween:TimelineMax;
		private var tilePane13_mcTween:TimelineMax;
		private var tilePane14_mcTween:TimelineMax;
		private var tilePane15_mcTween:TimelineMax;
		private var tilePane16_mcTween:TimelineMax;
		private var tilePane17_mcTween:TimelineMax;
		private var tilePane18_mcTween:TimelineMax;
		private var tilePane19_mcTween:TimelineMax;
		private var tilePane20_mcTween:TimelineMax;
		private var tilePane21_mcTween:TimelineMax;
		private var tilePane22_mcTween:TimelineMax;
		private var tilePane23_mcTween:TimelineMax;
		private var tilePane24_mcTween:TimelineMax;
		private var tilePane25_mcTween:TimelineMax;
		private var tilePane26_mcTween:TimelineMax;
		private var tilePane27_mcTween:TimelineMax;
		private var tilePane28_mcTween:TimelineMax;
		private var tilePane29_mcTween:TimelineMax;
		private var tilePane30_mcTween:TimelineMax;
		
		public function TileBackground() {
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		
		//******//
		// INIT //
		//******//
		private function Init(e:Event)
		{
			//this.tilePane1_mcTween = this.TileTweenColour(this.tilePane1_mc);
			//this.tilePane2_mcTween = this.TileTweenAlpha(this.tilePane2_mc);
			
			for (var i = 1; i <= 30; i++)
			{
				var tile:MovieClip = this["tilePane" + i + "_mc"] as MovieClip;
				var tween:TimelineMax = this[tile.name + "Tween"] as TimelineMax;
				
				tween = this.TileTweenAlpha(tile);
			}
		}
		
		//************//
		// TILE TWEEN //
		//************//
		private function TileTweenColour(tile:MovieClip):TimelineMax
		{
			var timeline:TimelineMax = new TimelineMax();
			
			timeline.append(new TweenMax(tile, 1, { colorMatrixFilter:{colorize:0x99ffff, amount:1}, yoyo:true, repeat:-1 }));
			timeline.play();
			
			return timeline;
		}
		
		private function TileTweenAlpha(tile:MovieClip):TimelineMax
		{
			var timeline:TimelineMax = new TimelineMax();
			
			for (var i = 1; i <= 5; i++)
			{
				timeline.append(new TweenMax(tile, this.RandomDuration(), { alpha: this.RandomAlpha(), ease: Sine.easeInOut }));
			}
			
			timeline.seek(this.RandomSeek());
			timeline.repeat(-1);
			timeline.yoyo(true);
			timeline.repeatDelay(this.RandomDelay());
			timeline.play();
			
			return timeline;
		}
		
		//*************************//
		// RANDOM NUMBER FUNCTIONS //
		//*************************//
		private function GenerateRandomNumber(minNum:Number, maxNum:Number):Number 
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
		private function RandomDuration():Number
		{
			return this.GenerateRandomNumber(0.7, 1);
		}
		
		private function RandomSeek():Number
		{
			return this.GenerateRandomNumber(1, 3);
		}		
		
		private function RandomAlpha():Number
		{
			return this.GenerateRandomNumber(0.5, 0.8);
		}
		
		private function RandomDelay():Number
		{
			return this.GenerateRandomNumber(1, 3);
		}
	} 	
}
