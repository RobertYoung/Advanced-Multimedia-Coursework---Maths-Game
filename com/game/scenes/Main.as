package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.events.LoaderEvent;
	
	
	public class Main extends MovieClip {

		//***********//
		// SWF FILES //
		//***********//
		public static const SWF_MAIN:String = "main";
		public static const SWF_LOGO:String = "logo";
		public static const SWF_MENU:String = "menu";
		public static const SWF_PLAY:String = "play";
		public static const SWF_STATS:String = "stats";
		public static const SWF_HELP:String = "help";
		
		//***************//
		// SWF VARIABLES //
		//***************//
		public var swfMain:Main;
		public var swfLogo:Logo;
		public var swfMenu:Menu;
		public var swfPlay:Play;
		public var swfStats:Stats;
		public var swfHelp:Help;
		
		var loader:LoaderMax;
		
		public function Main() {
			this.LoadMenu();
		}
		
		//***********//
		// LOAD MENU //
		//***********//
		public function LoadMenu()
		{
			this.RemoveSWFFiles();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadMenuComplete });
			
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_MENU + ".swf", { name: Main.SWF_MENU, container: this }));
			loader.load();
		}
		
		private function LoadMenuComplete(e:LoaderEvent)
		{
			this.swfMenu = LoaderMax.getContent(Main.SWF_MENU).rawContent as Menu;
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			
			this.swfMenu.init();
			this.swfLogo.init();
		}
		
		//***********//
		// LOAD PLAY //
		//***********//
		public function LoadPlay()
		{
			this.RemoveSWFFiles();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadPlayComplete });
			
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_PLAY + ".swf", { name: Main.SWF_PLAY, container: this }));
			loader.load();
		}
		
		private function LoadPlayComplete(e:LoaderEvent)
		{
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			this.swfPlay = LoaderMax.getContent(Main.SWF_PLAY).rawContent as Play;
			
			this.swfLogo.init();
			this.swfPlay.init();
		}
		
		//************//
		// LOAD STATS //
		//************//
		public function LoadStats()
		{
			this.RemoveSWFFiles();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadStatsComplete });
		
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_STATS + ".swf", { name: Main.SWF_STATS, container: this }));
			loader.load();
		}
		
		private function LoadStatsComplete(e:LoaderEvent)
		{
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			this.swfStats = LoaderMax.getContent(Main.SWF_STATS).rawContent as Stats;
			
			this.swfStats.init();
			this.swfStats.init();
		}
		
		//***********//
		// LOAD HELP //
		//***********//
		public function LoadHelp()
		{
			this.RemoveSWFFiles();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadHelpComplete });
		
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_HELP + ".swf", { name: Main.SWF_HELP, container: this }));
			loader.load();
		}
		
		private function LoadHelpComplete(e:LoaderEvent)
		{
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			this.swfHelp = LoaderMax.getContent(Main.SWF_HELP).rawContent as Help;
			
			this.swfLogo.init();
			this.swfHelp.init();
		}
		
		//******************//
		// REMOVE SWF FILES //
		//******************//
		private function RemoveSWFFiles()
		{
			for (var i = (this.numChildren - 1); i >= 0; i--) 			
			{ 
 				this.removeChildAt(i); 
 			}
		}
	}
	
}
