package com.game.factory {
	
	import flash.text.TextFormat;
	import com.game.fonts.*;
	import com.greensock.TweenMax;
	import flash.display.MovieClip;
	
	public class AppearanceSettings {

		import flash.text.Font;
		
		public function AppearanceSettings() {
			
		}
		
		public static function DefaultTextFormat(fontSize:int = 25):TextFormat
		{
			var font:PoplarFont = new PoplarFont();
			var textFormat:TextFormat = new TextFormat();
			
			textFormat.size = fontSize;
			textFormat.font = font.fontName;
			
			return textFormat;
		}
		
		public static function DefaultColour():int
		{
			return 0x59ABE3;
		}
		
		//*********//
		// BUTTONS //
		//*********//
		public static function ButtonTween(button:MovieClip):TweenMax
		{
			return new TweenMax(button, 0.4, {glowFilter:{color:0x000000, alpha:1, blurX:30, blurY:30}, scaleX: 1.05, scaleY: 1.05 });
		}
	}
}
