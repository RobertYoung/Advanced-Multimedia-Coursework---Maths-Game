package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class BackButton extends MovieClip {
		
		// Elements in SWF file
		public var backButton_mc:MovieClip;
		
		public function BackButton() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("BACK BUTTON SWF LOADED");
			
			backButton_mc.mouseChildren = false;
		}
		
		//*****************//
		// SET BACK BUTTON //
		//*****************//
		public function SetBackButtonOnMouseUp(onMouseUp:Function)
		{
			this.backButton_mc.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
	}
	
}
