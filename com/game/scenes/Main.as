package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.events.LoaderEvent;
	import flash.events.MouseEvent;
	import com.game.factory.Game;
	import com.game.elements.Raindrop;
	
	
	public class Main extends MovieClip {

		//***********//
		// SWF FILES //
		//***********//
		public static const SWF_MAIN:String = "main";
		public static const SWF_LOGO:String = "logo";
		public static const SWF_BACK_BUTTON:String = "back_button";
		public static const SWF_MENU:String = "menu";
		public static const SWF_PLAY:String = "play";
		public static const SWF_STATS:String = "stats";
		public static const SWF_HELP:String = "help";
		public static const SWF_HEADER_ADDITION:String = "header_addition";
		public static const SWF_HEADER_SUBTRACTION:String = "header_subtraction";
		public static const SWF_BUCKET:String = "bucket";
		public static const SWF_WATER:String = "water";
		
		//***************//
		// SWF VARIABLES //
		//***************//
		public var swfMain:Main;
		public var swfLogo:Logo;
		public var swfBackButton:BackButton;
		public var swfMenu:Menu;
		public var swfPlay:Play;
		public var swfStats:Stats;
		public var swfHelp:Help;
		public var swfHeaderAddition:HeaderAddition;
		public var swfHeaderSubtraction:HeaderSubtraction;
		public var swfBucket:Bucket;
		public var swfWater:Water;
		
		//***************//
		// GAME ELEMENTS //
		//***************//
		public static const ELEMENT_INCORRECT_ALERTVIEW:String = "incorrect_alertview";
		public static const ELEMENT_COMPLETE_ALERTVIEW:String = "complete_alertview";
		public static const ELEMENT_RAINDROP:String = "raindrop";
		
		//*********//
		// LOADING //
		//*********//
		var loader:LoaderMax;
		
		//****************//
		// GAME VARIABLES //
		//****************//
		public var game:Game;
		
		public function Main() {
			this.LoadMenu();
		}
		
		//***********//
		// LOAD MENU //
		//***********//
		public function LoadMenu()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadMenuComplete });
			
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_MENU + ".swf", { name: Main.SWF_MENU, container: this }));
			loader.load();
		}
		
		private function LoadMenuComplete(e:LoaderEvent)
		{
			this.swfMenu = LoaderMax.getContent(Main.SWF_MENU).rawContent as Menu;
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			
			this.swfMenu.Init();
			this.swfLogo.Init();
		}
		
		public function LoadMenuFromMouseEvent(e:MouseEvent)
		{
			this.LoadMenu();
		}
		
		//***********//
		// LOAD PLAY //
		//***********//
		public function LoadPlay()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadPlayComplete });
			
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_PLAY + ".swf", { name: Main.SWF_PLAY, container: this }));
			loader.load();
		}
		
		private function LoadPlayComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			this.swfPlay = LoaderMax.getContent(Main.SWF_PLAY).rawContent as Play;
			
			this.swfBackButton.Init();
			this.swfLogo.Init();
			this.swfPlay.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadMenuFromMouseEvent);
		}
		
		public function LoadPlayFromMouseEvent(e:MouseEvent)
		{
			this.LoadPlay();
		}
		
		//************//
		// LOAD STATS //
		//************//
		public function LoadStats()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadStatsComplete });
		
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_STATS + ".swf", { name: Main.SWF_STATS, container: this }));
			loader.load();
		}
		
		private function LoadStatsComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			this.swfStats = LoaderMax.getContent(Main.SWF_STATS).rawContent as Stats;
			
			this.swfBackButton.Init();
			this.swfLogo.Init();
			this.swfStats.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadMenuFromMouseEvent);
		}
		
		public function LoadStatsFromMouseEvent(e:MouseEvent)
		{
			this.LoadStats();
		}
		
		//***********//
		// LOAD HELP //
		//***********//
		public function LoadHelp()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadHelpComplete });
		
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_LOGO + ".swf", { name: Main.SWF_LOGO, container: this }));
			loader.append(new SWFLoader(Main.SWF_HELP + ".swf", { name: Main.SWF_HELP, container: this }));
			loader.load();
		}
		
		private function LoadHelpComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfLogo = LoaderMax.getContent(Main.SWF_LOGO).rawContent as Logo;
			this.swfHelp = LoaderMax.getContent(Main.SWF_HELP).rawContent as Help;
			
			this.swfBackButton.Init();
			this.swfLogo.Init();
			this.swfHelp.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadMenuFromMouseEvent);
		}
		
		public function LoadHelpFromMouseEvent(e:MouseEvent)
		{
			this.LoadHelp();
		}
		
		//***************//
		// LOAD ADDITION //
		//***************//
		public function LoadAddition()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadAdditionComplete });
		
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_HEADER_ADDITION + ".swf", { name: Main.SWF_HEADER_ADDITION, container: this }));
			loader.append(new SWFLoader(Main.SWF_WATER + ".swf", { name: Main.SWF_WATER, container: this }));
			loader.append(new SWFLoader(Main.SWF_BUCKET + ".swf", { name: Main.SWF_BUCKET, container: this }));
			loader.load();
		}
		
		private function LoadAdditionComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfHeaderAddition = LoaderMax.getContent(Main.SWF_HEADER_ADDITION).rawContent as HeaderAddition;
			this.swfWater = LoaderMax.getContent(Main.SWF_WATER).rawContent as Water;
			this.swfBucket = LoaderMax.getContent(Main.SWF_BUCKET).rawContent as Bucket;
			
			this.CreateNewGame();
			
			this.swfBackButton.Init();
			this.swfHeaderAddition.Init();
			this.swfWater.Init();
			this.swfBucket.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadPlayFromMouseEvent);
		}
		
		public function LoadAdditionFromMouseEvent(e:MouseEvent)
		{
			this.LoadAddition();
		}
		
		//******************//
		// LOAD SUBTRACTION //
		//******************//
		public function LoadSubtraction()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadSubtractionComplete });
		
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_HEADER_SUBTRACTION + ".swf", { name: Main.SWF_HEADER_SUBTRACTION, container: this }));
			loader.append(new SWFLoader(Main.SWF_WATER + ".swf", { name: Main.SWF_WATER, container: this }));
			loader.append(new SWFLoader(Main.SWF_BUCKET + ".swf", { name: Main.SWF_BUCKET, container: this }));
			loader.load();
		}
		
		private function LoadSubtractionComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfHeaderSubtraction = LoaderMax.getContent(Main.SWF_HEADER_SUBTRACTION).rawContent as HeaderSubtraction;
			this.swfWater = LoaderMax.getContent(Main.SWF_WATER).rawContent as Water;
			this.swfBucket = LoaderMax.getContent(Main.SWF_BUCKET).rawContent as Bucket;
			
			this.CreateNewGame();
			
			this.swfBackButton.Init();
			this.swfHeaderSubtraction.Init();
			this.swfWater.Init();
			this.swfBucket.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadPlayFromMouseEvent);
		}
		
		public function LoadSubtractionFromMouseEvent(e:MouseEvent)
		{
			this.LoadSubtraction();
		}
		
		//****************//
		// GAME FUNCTIONS //
		//****************//
		private function CreateNewGame()
		{
			this.game = new Game(this);
		}
		
		//******************//
		// REMOVE SWF FILES //
		//******************//
		private function RemoveAllFromStage()
		{
			if (this.game != null)
				this.game.StopTimer();
			
			for (var i = (this.numChildren - 1); i >= 0; i--) 			
			{ 
				if (this.getChildAt(i).name == Main.ELEMENT_RAINDROP)
				{
					var raindrop:Raindrop = this.getChildAt(i) as Raindrop;
					
					raindrop.tween.kill();
				}

 				this.removeChildAt(i); 
 			}
		}
	}
	
}
