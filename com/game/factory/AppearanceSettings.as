package com.game.factory {
	
	import flash.text.TextFormat;
	import com.game.fonts.*;
	
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
	}
}
