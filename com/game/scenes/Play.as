package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Play extends MovieClip {
		
		// Elements in this SWF
		public var addition_mc:MovieClip;
		public var subtraction_mc:MovieClip;
		public var multiplication_mc:MovieClip;
		public var division_mc:MovieClip;
		public var money_mc:MovieClip;
		
		// Game variables
		private var main:Main;
		
		public function Play() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("SWF PLAY LOADED");
			
			this.main = this.stage.getChildAt(0) as Main;
			
			this.addition_mc.mouseChildren = false;
			this.subtraction_mc.mouseChildren = false;
			this.multiplication_mc.mouseChildren = false;
			this.division_mc.mouseChildren = false;
			this.money_mc.mouseChildren = false;
			
			this.addition_mc.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadAdditionFromMouseEvent);
			this.subtraction_mc.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadSubtractionFromMouseEvent);
		}
	}
	
}
