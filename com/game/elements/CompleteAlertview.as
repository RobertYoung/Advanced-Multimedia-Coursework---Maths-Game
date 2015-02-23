package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import com.game.scenes.Main;
	import flash.events.MouseEvent;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	public class CompleteAlertview extends MovieClip {
		
		// Elements on alertview
		public var description_txt:TextField;
		public var next_btn:MovieClip;
		
		// Game variables
		private var main:Main;
		
		// Tween variables
		private var nextTween:TimelineMax;
		
		public function CompleteAlertview(setDescription:String, setNextButtonFunction:Function) {
			this.SetDescription(setDescription);
			this.SetNextButtonFunction(setNextButtonFunction);
			
			this.addEventListener(Event.ADDED_TO_STAGE, AddedToStage);
		}
		
		//****************//
		// ADDED TO STAGE //
		//****************//
		private function AddedToStage(e:Event)
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.x = this.stage.stageWidth / 2;
			this.y = this.stage.stageHeight / 2;
			this.name = Main.ELEMENT_COMPLETE_ALERTVIEW;
			this.main.BringCursorToFront();
			this.NextButtonTween();
		}
		
		//***********************//
		// DESCRIPTION FUNCTIONS //
		//***********************//
		public function SetDescription(setDescription:String)
		{
			this.description_txt.text = setDescription;
		}
		
		//***********************//
		// NEXT BUTTON FUNCTIONS //
		//***********************//
		public function SetNextButtonFunction(setFunction:Function)
		{
			this.next_btn.addEventListener(MouseEvent.MOUSE_UP, setFunction);
		}
		
		private function NextButtonTween()
		{
			if (this.nextTween == null)
			{
				this.nextTween = new TimelineMax();
				this.nextTween.append(new TweenMax(this.next_btn, 1, {glowFilter: {color:0x000000, alpha:1, blurX:20, blurY:20, strength:1}}));
				this.nextTween.repeat(-1);
				this.nextTween.yoyo(true);
				this.nextTween.play();
			}
		}
	}
}
