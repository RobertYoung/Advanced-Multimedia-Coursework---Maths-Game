﻿package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.events.LoaderEvent;
	import flash.events.MouseEvent;
	import com.game.factory.Game;
	import com.game.elements.*;
	import flash.events.Event;
	import com.game.elements.ProgressMeter;
	import com.game.elements.Wave;
	import com.game.elements.Mark;
	import flash.ui.*;
	import flash.media.SoundChannel;
	
	public class Main extends MovieClip {

		//***********//
		// SWF FILES //
		//***********//
		public static const SWF_MAIN:String = "main";
		public static const SWF_SPLASHSCREEN:String = "splashscreen";
		public static const SWF_LOGO:String = "logo";
		public static const SWF_BACK_BUTTON:String = "back_button";
		public static const SWF_MENU:String = "menu";
		public static const SWF_PLAY:String = "play";
		public static const SWF_STATS:String = "stats";
		public static const SWF_SCORES:String = "scores";
		public static const SWF_HELP:String = "help";
		public static const SWF_HEADER_ADDITION:String = "header_addition";
		public static const SWF_HEADER_SUBTRACTION:String = "header_subtraction";
		public static const SWF_HEADER_MULTIPLICATION:String = "header_multiplication";
		public static const SWF_HEADER_DIVIDE:String = "header_divide";
		public static const SWF_MONEY:String = "money";
		public static const SWF_BUCKET:String = "bucket";
		public static const SWF_WATER:String = "water";
		public static const SWF_CURSOR:String = "cursor";
		
		//***************//
		// SWF VARIABLES //
		//***************//
		public var swfMain:Main;
		public var swfSplashScreen:SplashScreen;
		public var swfLogo:Logo;
		public var swfBackButton:BackButton;
		public var swfMenu:Menu;
		public var swfPlay:Play;
		public var swfStats:Stats;
		public var swfScores:Scores;
		public var swfHelp:Help;
		public var swfHeaderAddition:HeaderAddition;
		public var swfHeaderSubtraction:HeaderSubtraction;
		public var swfHeaderMultiplication:HeaderMultiplication;
		public var swfHeaderDivide:HeaderDivide;
		public var swfMoney:Money;
		public var swfBucket:Bucket;
		public var swfWater:Water;
		public var swfCursor:Cursor;
		
		//***************//
		// GAME ELEMENTS //
		//***************//
		public static const ELEMENT_INCORRECT_ALERTVIEW:String = "incorrect_alertview";
		public static const ELEMENT_COMPLETE_ALERTVIEW:String = "complete_alertview";
		public static const ELEMENT_RAINDROP:String = "raindrop";
		
		//***********************//
		// ELEMENTS IN SWF FILES //
		//***********************//
		public var background_mc:TileBackground;
		
		//*********//
		// LOADING //
		//*********//
		var loader:LoaderMax;
		
		//****************//
		// GAME VARIABLES //
		//****************//
		public var game:Game;
		
		//*****************//
		// SOUND VARIABLES //
		//*****************//
		public var themeMusic:ThemeMusic;
		public var themeMusicChannel:SoundChannel = new SoundChannel();
		
		public function Main() {
			this.LoadSplashScreen();
			this.LoadCursor();
			this.PlayThemeMusic();
		}
		
		//***********//
		// LOAD MENU //
		//***********//
		public function LoadSplashScreen()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadSplashScreenComplete });
			
			loader.append(new SWFLoader(Main.SWF_SPLASHSCREEN + ".swf", { name: Main.SWF_SPLASHSCREEN, container: this }));
			loader.load();
		}
		
		private function LoadSplashScreenComplete(e:LoaderEvent)
		{
			this.swfSplashScreen = LoaderMax.getContent(Main.SWF_SPLASHSCREEN).rawContent as SplashScreen;

			this.swfSplashScreen.Init();
			
			this.BringCursorToFront();
		}
		
		public function LoadSplashScreenFromMouseEvent(e:MouseEvent)
		{
			this.LoadSplashScreen();
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
			
			this.BringCursorToFront();
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
			this.BringCursorToFront();
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
			loader.append(new SWFLoader(Main.SWF_STATS + ".swf", { name: Main.SWF_STATS, container: this }));
			loader.load();
		}
		
		private function LoadStatsComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfStats = LoaderMax.getContent(Main.SWF_STATS).rawContent as Stats;
			
			this.swfBackButton.Init();
			this.swfStats.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadMenuFromMouseEvent);
			this.BringCursorToFront();
		}
		
		public function LoadStatsFromMouseEvent(e:MouseEvent)
		{
			this.LoadStats();
		}
		
		//*************//
		// LOAD SCORES //
		//*************//
		public function LoadScores()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadScoresComplete });
		
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_SCORES + ".swf", { name: Main.SWF_SCORES, container: this }));
			loader.load();
		}
		
		private function LoadScoresComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfScores = LoaderMax.getContent(Main.SWF_SCORES).rawContent as Scores;
			
			this.swfBackButton.Init();
			this.swfScores.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadMenuFromMouseEvent);
			this.BringCursorToFront();
		}
		
		public function LoadScoresFromMouseEvent(e:MouseEvent)
		{
			this.LoadScores();
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
			this.BringCursorToFront();
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
		
			loader.append(new SWFLoader(Main.SWF_HEADER_ADDITION + ".swf", { name: Main.SWF_HEADER_ADDITION, container: this }));
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
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
			this.BringCursorToFront();
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
		
			loader.append(new SWFLoader(Main.SWF_HEADER_SUBTRACTION + ".swf", { name: Main.SWF_HEADER_SUBTRACTION, container: this }));
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
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
			this.BringCursorToFront();
		}
		
		public function LoadSubtractionFromMouseEvent(e:MouseEvent)
		{
			this.LoadSubtraction();
		}
		
		//*********************//
		// LOAD MULTIPLICATION //
		//*********************//
		public function LoadMultiplication()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadMultiplicationComplete });
		
			loader.append(new SWFLoader(Main.SWF_HEADER_MULTIPLICATION + ".swf", { name: Main.SWF_HEADER_MULTIPLICATION, container: this }));
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_WATER + ".swf", { name: Main.SWF_WATER, container: this }));
			loader.append(new SWFLoader(Main.SWF_BUCKET + ".swf", { name: Main.SWF_BUCKET, container: this }));
			loader.load();
		}
		
		private function LoadMultiplicationComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfHeaderMultiplication = LoaderMax.getContent(Main.SWF_HEADER_MULTIPLICATION).rawContent as HeaderMultiplication;
			this.swfWater = LoaderMax.getContent(Main.SWF_WATER).rawContent as Water;
			this.swfBucket = LoaderMax.getContent(Main.SWF_BUCKET).rawContent as Bucket;
			
			this.CreateNewGame();
			
			this.swfBackButton.Init();
			this.swfHeaderMultiplication.Init();
			this.swfWater.Init();
			this.swfBucket.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadPlayFromMouseEvent);
			this.BringCursorToFront();
		}
		
		public function LoadMultiplicationFromMouseEvent(e:MouseEvent)
		{
			this.LoadMultiplication();
		}
		
		//*************//
		// LOAD DIVIDE //
		//*************//
		public function LoadDivide()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadDivideComplete });
		
			loader.append(new SWFLoader(Main.SWF_HEADER_DIVIDE + ".swf", { name: Main.SWF_HEADER_DIVIDE, container: this }));
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.append(new SWFLoader(Main.SWF_WATER + ".swf", { name: Main.SWF_WATER, container: this }));
			loader.append(new SWFLoader(Main.SWF_BUCKET + ".swf", { name: Main.SWF_BUCKET, container: this }));
			loader.load();
		}
		
		private function LoadDivideComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfHeaderDivide = LoaderMax.getContent(Main.SWF_HEADER_DIVIDE).rawContent as HeaderDivide;
			this.swfWater = LoaderMax.getContent(Main.SWF_WATER).rawContent as Water;
			this.swfBucket = LoaderMax.getContent(Main.SWF_BUCKET).rawContent as Bucket;
			
			this.CreateNewGame();
			
			this.swfBackButton.Init();
			this.swfHeaderDivide.Init();
			this.swfWater.Init();
			this.swfBucket.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadPlayFromMouseEvent);
			this.BringCursorToFront();
		}
		
		public function LoadDivideFromMouseEvent(e:MouseEvent)
		{
			this.LoadDivide();
		}
		
		//************//
		// LOAD MONEY //
		//************//
		public function LoadMoney()
		{
			this.RemoveAllFromStage();
			
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadMoneyComplete });
	
			loader.append(new SWFLoader(Main.SWF_MONEY + ".swf", { name: Main.SWF_MONEY, container: this }));
			loader.append(new SWFLoader(Main.SWF_BACK_BUTTON + ".swf", { name: Main.SWF_BACK_BUTTON, container: this }));
			loader.load();
		}
		
		private function LoadMoneyComplete(e:LoaderEvent)
		{
			this.swfBackButton = LoaderMax.getContent(Main.SWF_BACK_BUTTON).rawContent as BackButton;
			this.swfMoney = LoaderMax.getContent(Main.SWF_MONEY).rawContent as Money;
			
			this.CreateNewGame();
			
			this.swfBackButton.Init();
			this.swfMoney.Init();
			
			this.swfBackButton.SetBackButtonOnMouseUp(this.LoadPlayFromMouseEvent);
			this.BringCursorToFront();
		}
		
		public function LoadMoneyFromMouseEvent(e:MouseEvent)
		{
			this.LoadMoney();
		}
		
		//******************//
		// CURSOR FUNCTIONS //
		//******************//
		private function LoadCursor()
		{
			loader = new LoaderMax({ name: "mainQueue", onComplete: LoadCursorComplete });
		
			loader.append(new SWFLoader(Main.SWF_CURSOR + ".swf", { name: Main.SWF_CURSOR, container: this }));
			loader.load();
		}
		
		private function LoadCursorComplete(e:LoaderEvent)
		{
			this.swfCursor = LoaderMax.getContent(Main.SWF_CURSOR).rawContent as Cursor;
		
			this.swfCursor.Init();
			this.BringCursorToFront();
		}
		
		private function LoadCursorFromMouseEvent(e:MouseEvent)
		{
			this.LoadCursor();
		}
		
		public function BringCursorToFront()
		{
			if (this.swfCursor != null)
				this.setChildIndex(this.swfCursor.parent, this.numChildren - 1);
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
				
				if (this.getChildAt(i).name == "background_mc")
					continue;
				
				if (this.getChildAt(i).name == "cursor_mc")
					continue;
				
				if (this.getChildAt(i).name == Main.SWF_CURSOR)
					continue;

 				this.removeChildAt(i); 
 			}
		}
		
		public function RemoveAlertviews(e:Event = null)
		{
			if (this.game.InErrorState())
			{
				for (var i = 0; i < this.numChildren; i++)
				{
					if (this.getChildAt(i).name == Main.ELEMENT_INCORRECT_ALERTVIEW ||
						this.getChildAt(i).name == Main.ELEMENT_COMPLETE_ALERTVIEW)
					{
						this.removeChildAt(i);
					}
				}
			}
		}
		
		//**********************//
		// BACKGROUND FUNCTIONS //
		//**********************//
		private function ShowBackground()
		{
			this.background_mc.visible = true;
		}
		
		private function HideBackground()
		{
			this.background_mc.visible = false;
		}
		
		//*****************//
		// MUSIC FUNCTIONS //
		//*****************//
		public function PlayThemeMusic()
		{
			if (this.themeMusic == null)
				this.themeMusic = new ThemeMusic();
			
			this.themeMusicChannel.stop();
			this.themeMusicChannel = this.themeMusic.play(0, 99999999);
		}
		
		public function StopThemeMusic()
		{
			this.themeMusicChannel.stop();
		}
	}
}
