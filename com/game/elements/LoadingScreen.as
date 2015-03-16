package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.TweenMax;
	
	
	public class LoadingScreen extends MovieClip {
		
		// Elements on swf file
		public var spinner_mc:MovieClip;
		
		// Tweens
		private var spinnerTween:TweenMax;
		
		public function LoadingScreen() {
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		
		private function Init(e:Event)
		{
			this.x = this.stage.stageWidth / 2;
			this.y = this.stage.stageHeight / 2;
			
			this.spinnerTween = new TweenMax(this.spinner_mc, 1, { rotation: 360 });
			this.spinnerTween.repeat(-1);
			this.spinnerTween.play();
		}
	}
}
