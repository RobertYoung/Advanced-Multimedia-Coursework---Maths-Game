package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.buttons.ButtonPlay;
	import com.game.buttons.ButtonStats;
	import com.game.buttons.ButtonHelp;
	import flash.events.MouseEvent;
	
	
	public class Menu extends MovieClip {
		
		// Game elements
		private var main:Main;
		
		// Elements in this SWF file
		public var play_mc:ButtonPlay;
		public var stats_mc:ButtonStats;
		public var help_mc:ButtonHelp;
		
		public function Menu() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			main = this.stage.getChildAt(0) as Main;
			
			this.play_mc.mouseChildren = false;
			this.stats_mc.mouseChildren = false;
			this.help_mc.mouseChildren = false;
			
			this.play_mc.addEventListener(MouseEvent.MOUSE_UP, PlayMouseUp);
			this.stats_mc.addEventListener(MouseEvent.MOUSE_UP, StatsMouseUp);
			this.help_mc.addEventListener(MouseEvent.MOUSE_UP, HelpMouseUp);
		}
		
		//**************//
		// MOUSE EVENTS //
		//**************//
		private function PlayMouseUp(e:MouseEvent)
		{
			this.GoToPlay();
		}
		
		private function StatsMouseUp(e:MouseEvent)
		{
			this.GoToStats();
		}
		
		private function HelpMouseUp(e:MouseEvent)
		{
			this.GoToHelp();
		}
		
		//************//
		// GO TO PLAY //
		//************//
		private function GoToPlay()
		{
			main.LoadPlay();
		}
		
		//*************//
		// GO TO STATS //
		//*************//
		private function GoToStats()
		{
			main.LoadStats();
		}
		
		//************//
		// GO TO HELP //
		//************//
		private function GoToHelp()
		{
			main.LoadHelp();
		}
	}
	
}
