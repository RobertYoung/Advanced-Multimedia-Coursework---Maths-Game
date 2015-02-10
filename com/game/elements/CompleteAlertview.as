package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import com.game.scenes.Main;
	
	public class CompleteAlertview extends MovieClip {
		
		public var description_txt:TextField;
		
		public function CompleteAlertview(setDescription:String) {
			this.SetDescription(setDescription);
			
			this.addEventListener(Event.ADDED_TO_STAGE, AddedToStage);
		}
		
		//****************//
		// ADDED TO STAGE //
		//****************//
		private function AddedToStage(e:Event)
		{
			this.x = this.stage.stageWidth / 2;
			this.y = this.stage.stageHeight / 2;
			this.name = Main.ELEMENT_COMPLETE_ALERTVIEW;
		}
		
		//***********************//
		// DESCRIPTION FUNCTIONS //
		//***********************//
		public function SetDescription(setDescription:String)
		{
			this.description_txt.text = setDescription;
		}
	}
	
}
