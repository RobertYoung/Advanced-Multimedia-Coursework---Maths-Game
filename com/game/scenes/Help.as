package com.game.scenes {
	
	import flash.display.MovieClip;
	import fl.containers.ScrollPane;
	import com.game.elements.HelpText;
	
	public class Help extends MovieClip {
		
		// Elements in SWF file
		public var scrollPane_mc:ScrollPane;
		
		public function Help() {
			/* DO NOT PUT ANYTING IN HERE */
		}
		
		public function Init()
		{
			var helpText:HelpText = new HelpText();
			
			this.scrollPane_mc.source = helpText;
		}
	}
	
}
