package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import com.greensock.TweenMax;
	import flash.geom.ColorTransform;
	import com.greensock.TweenMax;
	import com.greensock.plugins.BevelFilterPlugin;
	import flash.events.MouseEvent;
	import com.game.factory.MathsWebService;
	import com.game.elements.LoadingScreen;
	
	
	public class Scores extends MovieClip {

		// Static variables
		public static const ADDITION:String = "addition";
		public static const SUBTRACTION:String = "subtraction";
		public static const MULTIPLICATION:String = "multiplication";
		public static const DIVISION:String = "division";
		public static const MONEY:String = "money";
		public static const DEFAULT_NAME:String = "---------";
		public static const DEFAULT_SCORE:String = "0.00 seconds";
		
		// Elements on SWF file
		public var name1_txt:TextField;
		public var name2_txt:TextField;
		public var name3_txt:TextField;
		public var name4_txt:TextField;
		public var name5_txt:TextField;
		
		public var score1_txt:TextField;
		public var score2_txt:TextField;
		public var score3_txt:TextField;
		public var score4_txt:TextField;
		public var score5_txt:TextField;
		
		public var addition_mc:MovieClip;
		public var subtraction_mc:MovieClip;
		public var multiplication_mc:MovieClip;
		public var division_mc:MovieClip;
		public var money_mc:MovieClip
		
		// Button tweens
		private var additionTween:TweenMax;
		private var subtractionTween:TweenMax;
		private var multiplicationTween:TweenMax;
		private var divisionTween:TweenMax;
		private var moneyTween:TweenMax
		
		// Constant values
		public static const ADDITION_COLOUR = 0x0099FF;
		public static const SUBTRACTION_COLOUR = 0xFF3300;
		public static const MULTIPLICATION_COLOUR = 0xFFCC33;
		public static const DIVISION_COLOUR = 0xCC66FF;
		public static const MONEY_COLOUR = 0x00CC00;
		
		// Web service
		private var webService:MathsWebService;
		
		// Scores variables
		private var currentScores:String;
		
		// Loading variables
		private var loadingScreen:LoadingScreen;
		
		public function Scores() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		//***********//
		// INITILIZE //
		//***********//
		public function Init()
		{
			this.webService = new MathsWebService();	
			
			this.SetDefaults();
			
			this.addition_mc.mouseChildren = false;
			this.subtraction_mc.mouseChildren = false;
			this.multiplication_mc.mouseChildren = false;
			this.division_mc.mouseChildren = false;
			this.money_mc.mouseChildren = false;
			
			this.SetButtonColour("addition", Stats.ADDITION_COLOUR);
			this.SetButtonColour("subtraction", Stats.SUBTRACTION_COLOUR);
			this.SetButtonColour("multiplication", Stats.MULTIPLICATION_COLOUR);
			this.SetButtonColour("division", Stats.DIVISION_COLOUR);
			this.SetButtonColour("money", Stats.MONEY_COLOUR);
			
			this.BevelTween("addition");
			this.BevelTween("subtraction");
			this.BevelTween("multiplication");
			this.BevelTween("division");
			this.BevelTween("money");
			
			this.addition_mc.addEventListener(MouseEvent.MOUSE_UP, this.SwitchToAddition);
			this.subtraction_mc.addEventListener(MouseEvent.MOUSE_UP, this.SwitchToSubtraction);
			this.multiplication_mc.addEventListener(MouseEvent.MOUSE_UP, this.SwitchToMultiplication);
			this.division_mc.addEventListener(MouseEvent.MOUSE_UP, this.SwitchToDivision);
			this.money_mc.addEventListener(MouseEvent.MOUSE_UP, this.SwitchToMoney);
			
			this.SwitchToAddition();
		}
		
		//**********//
		// DEFAULTS //
		//**********//
		private function SetDefaults()
		{
			for (var i = 1; i <= 5; i++)
			{
				var nameTextfield:TextField = this["name" + i + "_txt"];
				var scoreTextfield:TextField = this["score" + i + "_txt"];
				
				nameTextfield.text = Scores.DEFAULT_NAME;
				scoreTextfield.text = Scores.DEFAULT_SCORE;
			}
		}
		
		//******************//
		// COLOUR FUNCITONS //
		//******************//
		private function SetButtonColour(level:String, colour:int)
		{
			var myColorTransform:ColorTransform = new ColorTransform();
			myColorTransform.color = colour;
			
			var bg:MovieClip = this[level + "_mc"]["button_mc"]["background_mc"] as MovieClip;
			bg.transform.colorTransform = myColorTransform;
		}
		
		//*********************//
		// ANIMATION FUNCITONS //
		//*********************//
		private function BevelTween(level:String)
		{
			this[level + "Tween"] = new TweenMax(this[level + "_mc"], 0.2, {bevelFilter:{blurX:20, blurY:20, distance:10, angle:45, strength:5}});
			this[level + "Tween"].play();
		}
		
		//**********//
		// ADDITION //
		//**********//
		private function SwitchToAddition(e:MouseEvent = null)
		{
			if (this.currentScores != Scores.ADDITION)
			{
				this.ShowLoadingScreen();
				this.SetDefaults();
				this.webService.GetScores(Scores.ADDITION, LoadScores);
				
				this.additionTween.reverse();
				this.subtractionTween.play();
				this.multiplicationTween.play();
				this.divisionTween.play();
				this.moneyTween.play();
				
				this.currentScores = Scores.ADDITION;	
			}
		}
		
		//*************//
		// SUBTRACTION //
		//*************//
		private function SwitchToSubtraction(e:MouseEvent = null)
		{
			if (this.currentScores != Scores.SUBTRACTION)
			{
				this.ShowLoadingScreen();
				this.SetDefaults();
				this.webService.GetScores(Scores.SUBTRACTION, LoadScores);
				
				this.additionTween.play();
				this.subtractionTween.reverse();
				this.multiplicationTween.play();
				this.divisionTween.play();
				this.moneyTween.play();
				
				this.currentScores = Scores.SUBTRACTION;	
			}
		}
		
		//****************//
		// MULTIPLICATION //
		//****************//
		private function SwitchToMultiplication(e:MouseEvent = null)
		{
			if (this.currentScores != Scores.MULTIPLICATION)
			{
				this.ShowLoadingScreen();
				this.SetDefaults();
				this.webService.GetScores(Scores.MULTIPLICATION, LoadScores);
				
				this.additionTween.play();
				this.subtractionTween.play();
				this.multiplicationTween.reverse();
				this.divisionTween.play();
				this.moneyTween.play();
				
				this.currentScores = Scores.MULTIPLICATION;	
			}
		}
		
		//**********//
		// DIVISION //
		//**********//
		private function SwitchToDivision(e:MouseEvent = null)
		{
			if (this.currentScores != Scores.DIVISION)
			{
				this.ShowLoadingScreen();
				this.SetDefaults();
				this.webService.GetScores(Scores.DIVISION, LoadScores);
				
				this.additionTween.play();
				this.subtractionTween.play();
				this.multiplicationTween.play();
				this.divisionTween.reverse();
				this.moneyTween.play();
				
				this.currentScores = Scores.DIVISION;	
			}
		}
		
		//*******//
		// MONEY //
		//*******//
		private function SwitchToMoney(e:MouseEvent = null)
		{
			if (this.currentScores != Scores.MONEY)
			{
				this.ShowLoadingScreen();
				this.SetDefaults();
				this.webService.GetScores(Scores.MONEY, LoadScores);
				
				this.additionTween.play();
				this.subtractionTween.play();
				this.multiplicationTween.play();
				this.divisionTween.play();
				this.moneyTween.reverse();
				
				this.currentScores = Scores.MONEY;	
			}
		}
		
		//*************//
		// LOAD SCORES //
		//*************//
		public function LoadScores(scores:XMLList)
		{
			var top5Scores:Array = new Array();

			for (var i = 0; i < 5; i++)
			{
				if (scores[i] != undefined)
				{
					var nameTextfield:TextField = this["name" + (i + 1) + "_txt"];
					var scoreTextfield:TextField = this["score" + (i + 1) + "_txt"];
					
					nameTextfield.text = scores[i].child(1).child(0).toString().toUpperCase();
					scoreTextfield.text = scores[i].child(3).child(0).toString() + " seconds";
				}
			}
			
			this.HideLoadingScreen();
		}
		
		//**************************//
		// LOADING SCREEN FUNCTIONS //
		//**************************//
		private function ShowLoadingScreen()
		{
			if (this.loadingScreen == null)
			{
				this.loadingScreen = new LoadingScreen();
				this.addChild(loadingScreen);
			}
			
			this.loadingScreen.visible = true;
		}
		
		private function HideLoadingScreen()
		{
			if (this.loadingScreen != null)
				this.loadingScreen.visible = false;
		}
	}
}
