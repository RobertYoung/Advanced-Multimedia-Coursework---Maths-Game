package com.game.buttons {

	import flash.display.MovieClip;
	import flash.events.Event;
	import com.game.factory.AppearanceSettings;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import com.greensock.TimelineMax;
	import flash.events.MouseEvent;
	import com.greensock.easing.*;
	import com.greensock.*;
	
	public class MenuButton extends MovieClip{

		// Tween variables
		private var tween:TimelineMax;
		
		public function MenuButton() {
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
		}

		private function Init(e:Event)
		{
			this.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			
			this.SetColour();
			
			this.tween = new TimelineMax({ name: "mainQueue" });
		}
		
		//******************//
		// COLOUR FUNCTIONS //
		//******************//
		private function SetColour()
		{
			var myColorTransform:ColorTransform = new ColorTransform();
			myColorTransform.color = AppearanceSettings.DefaultColour();
			
			var bg:MovieClip = this["button_mc"]["background_mc"] as MovieClip;
			bg.transform.colorTransform = myColorTransform;
		}
		
		//**************//
		// MOUSE EVENTS //
		//**************//
		private function OnMouseOver(e:MouseEvent)
		{
			this.removeEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, this.OnMouseOut);
			
			this.tween.append(AppearanceSettings.ButtonTween(this));
			this.tween.play();
		}
		
		private function OnMouseOut(e:MouseEvent)
		{
			this.removeEventListener(MouseEvent.MOUSE_OUT, this.OnMouseOut);
			this.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.tween.reverse();
		}
	}
}
