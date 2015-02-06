package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import com.game.scenes.Main;
	
	
	public class IncorrectAlertview extends MovieClip {
		
		public var title_txt:TextField;
		public var description_txt:TextField;
		
		public function IncorrectAlertview(title:String, description:String) {
			this.SetTitle(title);
			this.SetDescription(description);
			
			this.addEventListener(Event.ADDED_TO_STAGE, AddedToStage);
		}
		
		//********//
		// EVENTS //
		//********//
		private function AddedToStage(e:Event)
		{
			this.x = this.stage.stageWidth / 2;
			this.y = this.stage.stageHeight / 2;
			this.name = Main.ELEMENT_INCORRECT_ALERTVIEW;
		}
		
		//*****************//
		// TITLE FUNCTIONS //
		//*****************//
		public function SetTitle(title:String)
		{
			this.title_txt.text = title;
		}
		
		//***********************//
		// DESCRIPTION FUNCTIONS //
		//***********************//
		public function SetDescription(description:String)
		{
			this.description_txt.text = description;
		}
	}
	
}
