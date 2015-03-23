package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.game.scenes.Main;
	import com.game.factory.Game;
	import flash.events.MouseEvent;
	import com.game.factory.*;
	
	public class SoundButton extends MovieClip {
		
		// Game variables
		private var main:Main;
		private var game:Game;

		// Elements in mc
		public var stop_mc:MovieClip;
		
		public function SoundButton() {
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
			this.addEventListener(MouseEvent.MOUSE_UP, ToggleState);
			this.addEventListener(MouseEvent.MOUSE_OVER, EnlargeButton);
			this.addEventListener(MouseEvent.MOUSE_OUT, NormaleSizeButton);
			
			this.stop_mc.visible = false;
		}
		
		public function Init(e:Event)
		{
			this.main = this.stage.getChildAt(0) as Main;
			
			if (this.main == null)
				return;
			
			this.game = this.main.game;
			this.mouseChildren = false;
		}
		
		private function ToggleState(e:MouseEvent)
		{
			if (MathsSharedObject.getInstance().GetSound())
			{
				this.main.StopThemeMusic();
				MathsSharedObject.getInstance().SetSoundOff();
				this.stop_mc.visible = true;
			}else{
				this.main.PlayThemeMusic();
				MathsSharedObject.getInstance().SetSoundOn();
				this.stop_mc.visible = false;
			}
		}
		
		private function EnlargeButton(e:MouseEvent)
		{
			this.scaleX = 1.2;
			this.scaleY = 1.2;
		}
		
		private function NormaleSizeButton(e:MouseEvent)
		{
			this.scaleX = 1;
			this.scaleY = 1;
		}
	}
}
