package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	
	public class SplashScreen extends MovieClip {

		// Game elements
		private var main:Main;
		
		// Elements on SWF file
		public var flood_mc:MovieClip;
		public var catcher_mc:MovieClip;
		
		// Timelines
		public var floodTimeline:TimelineMax;
		public var catcherTimeline:TimelineMax;
		
		public function SplashScreen() {
			/** DO NOT PUT ANYTHING IN HERE **/
		}
		
		//******//
		// INIT //
		//******//
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			
			this.floodTimeline = new TimelineMax();
			
			this.floodTimeline.append(new TweenMax(this.flood_mc, 2, { x: 512 }));
			this.floodTimeline.play();
			
			this.catcherTimeline = new TimelineMax({ onComplete: LoadGame });
			
			this.catcherTimeline.append(new TweenMax(this.catcher_mc, 2, { x: 512 } ));
			this.catcherTimeline.delay(0.4);
			this.catcherTimeline.play();
		}
		
		//***********//
		// LOAD GAME //
		//***********//
		private function LoadGame()
		{
			this.main.LoadMenu();
		}
	}
	
}
