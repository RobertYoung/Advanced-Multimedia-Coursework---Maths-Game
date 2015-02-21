package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.game.factory.AppearanceSettings;
	import flash.geom.ColorTransform;
	
	public class BackButton extends MovieClip {
		
		// Elements in SWF file
		public var backButton_mc:MovieClip;
		
		// Tween variables
		private var tween:TimelineMax;
		
		public function BackButton() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			backButton_mc.mouseChildren = false;

			this.SetColour();
			
			this.tween = new TimelineMax({ name: "mainQueue" });
			
			this.backButton_mc.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
		}
		
		//*****************//
		// SET BACK BUTTON //
		//*****************//
		public function SetBackButtonOnMouseUp(onMouseUp:Function)
		{
			this.backButton_mc.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		//***********************//
		// MOUSE EVENT FUNCTIONS //
		//***********************//
		private function OnMouseOver(e:MouseEvent)
		{
			this.backButton_mc.removeEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.backButton_mc.addEventListener(MouseEvent.MOUSE_OUT, this.OnMouseOut);
			
			this.tween.append(AppearanceSettings.ButtonTween(this));
			this.tween.play();
		}
		
		private function OnMouseOut(e:MouseEvent)
		{
			this.backButton_mc.removeEventListener(MouseEvent.MOUSE_OUT, this.OnMouseOut);
			this.backButton_mc.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.tween.reverse();
		}
		
		//******************//
		// COLOUR FUNCTIONS //
		//******************//
		private function SetColour()
		{
			var myColorTransform:ColorTransform = new ColorTransform();
			myColorTransform.color = AppearanceSettings.DefaultColour();
			
			var bg:MovieClip = this.backButton_mc["background_mc"] as MovieClip;
			bg.transform.colorTransform = myColorTransform;
		}
	}
}
