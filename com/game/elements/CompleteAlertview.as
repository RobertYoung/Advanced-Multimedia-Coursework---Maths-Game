package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import com.game.scenes.Main;
	import flash.events.MouseEvent;
	
	public class CompleteAlertview extends MovieClip {
		
		// Elements on alertview
		public var description_txt:TextField;
		public var next_btn:MovieClip;
		
		// Game variables
		private var main:Main;
		
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
	}
}
