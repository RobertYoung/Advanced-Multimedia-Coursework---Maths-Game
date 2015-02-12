package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import com.game.scenes.Main;
	import flash.events.MouseEvent;
	import com.game.factory.Game;
	
	
	public class IncorrectAlertview extends MovieClip {

		// Game variables
		private var main:Main;
		private var game:Game;
		
		// Elements in alerview
		public var title_txt:TextField;
		public var description_txt:TextField;
		public var ok_btn:MovieClip;
		public var exit_btn:MovieClip;
		
		public function IncorrectAlertview(title:String, description:String, okFunction:Function) {
			this.SetTitle(title);
			this.SetDescription(description);
			this.SetOkButtonFunction(okFunction);
			
			this.addEventListener(Event.ADDED_TO_STAGE, AddedToStage);
		}
		
		//********//
		// EVENTS //
		//********//
		private function AddedToStage(e:Event)
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.game = main.game;
			
			this.x = this.stage.stageWidth / 2;
			this.y = this.stage.stageHeight / 2;
			this.name = Main.ELEMENT_INCORRECT_ALERTVIEW;
			
			this.ok_btn.mouseChildren = false;
			this.exit_btn.mouseChildren = false;
			
			this.exit_btn.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadPlayFromMouseEvent);
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
