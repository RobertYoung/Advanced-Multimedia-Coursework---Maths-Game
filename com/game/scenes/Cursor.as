package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.ui.*;
	import flash.events.Event;
	import com.greensock.plugins.*;
	import com.greensock.TweenMax;
	import com.greensock.TimelineMax;
	
	public class Cursor extends MovieClip {
		
		// Elements on swf
		public var cursor_mc:MovieClip;
		
		// Game variables
		private var main:Main;
		
		// Tween variables
		private var clickTween:TimelineMax;
		
		public function Cursor() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.SetupCursor();
		}
		
		//******************//
		// CURSOR FUNCTIONS //
		//******************//
		private function SetupCursor()
		{
			this.main.stage.addEventListener(Event.MOUSE_LEAVE, CursorRollOut, false, 0, true);
			this.main.stage.addEventListener(MouseEvent.MOUSE_OUT , CursorRollOut, false, 0, true);
			this.main.stage.addEventListener(MouseEvent.MOUSE_OVER, CursorRollOver, false, 0, true);
			this.main.stage.addEventListener(MouseEvent.MOUSE_MOVE, CursorMove, false, 0, true);
			this.main.stage.addEventListener(MouseEvent.MOUSE_DOWN, CursorMouseDown, false, 0, true);
			this.main.stage.addEventListener(MouseEvent.MOUSE_UP, CursorMouseUp, false, 0, true);
			
			this.cursor_mc.mouseEnabled = false;
			this.cursor_mc.mouseChildren = false;
			this.mouseChildren = false;
			this.mouseEnabled = false;
		}
		
		private function CursorRollOut(e:Event)
		{
			this.cursor_mc.visible = false;
			//Mouse.show();
		}
		
		private function CursorRollOver(e:MouseEvent)
		{
			this.cursor_mc.visible = true;
			//Mouse.hide();
		}
		
		private function CursorMove(e:MouseEvent)
		{
			this.cursor_mc.x = this.main.stage.mouseX;
			this.cursor_mc.y = this.main.stage.mouseY;
		}
		
		private function CursorMouseDown(e:MouseEvent)
		{
			if (this.clickTween == null)
			{
				this.clickTween = new TimelineMax();
				this.clickTween.append(new TweenMax(this.cursor_mc, 0.2, { shortRotation: { rotationX: -70, rotationY: 0, rotationZ: 0 } }));
			}
			
			this.clickTween.play();
		}
		
		private function CursorMouseUp(e:MouseEvent)
		{
			this.clickTween.reverse();
		}
	}
}
