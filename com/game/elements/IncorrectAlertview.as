package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import com.game.scenes.Main;
	import flash.events.MouseEvent;
	
	
	public class IncorrectAlertview extends MovieClip {
		
		// Elements in alerview
		public var title_txt:TextField;
		public var description_txt:TextField;
		public var ok_btn:MovieClip;
		
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
			
			this.ok_btn.mouseChildren = false;
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
		
		//*********************//
		// OK BUTTON FUNCTIONS //
		//*********************//
		public function SetOkButtonFunction(setFunction:Function)
		{
			this.ok_btn.addEventListener(MouseEvent.MOUSE_UP, setFunction);
		}
	}
	
}
