package com.game.buttons {

	import flash.display.MovieClip;
	import flash.events.Event;
	import com.game.factory.AppearanceSettings;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	
	public class MenuButton extends MovieClip{

		public function MenuButton() {
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
		}

		private function Init(e:Event)
		{
			var myColorTransform:ColorTransform = new ColorTransform();
			myColorTransform.color = AppearanceSettings.DefaultColour();
			
			var bg:MovieClip = this["button_mc"]["background_mc"] as MovieClip;
			bg.transform.colorTransform = myColorTransform;
		}
	}
}
