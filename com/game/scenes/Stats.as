package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import com.greensock.TweenMax;
	import com.greensock.plugins.BevelFilterPlugin;
	
	public class Stats extends MovieClip {
		
		// Elements in SWF file
		public var addition_mc:MovieClip;
		public var subtraction_mc:MovieClip;
		public var multiplication_mc:MovieClip;
		public var division_mc:MovieClip;
		public var money_mc:MovieClip;
		public var graph_mc:MovieClip;
		
		// Toggle variables
		private var displayAddition:Boolean = false;
		private var displaySubtraction:Boolean = false;
		private var displayMultiplication:Boolean = false;
		private var displayDivision:Boolean = false;
		
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
		
		public function Stats() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.addition_mc.mouseChildren = false;
			this.subtraction_mc.mouseChildren = false;
			this.multiplication_mc.mouseChildren = false;
			this.division_mc.mouseChildren = false;
			this.money_mc.mouseChildren = false;
			
			this.addition_mc.addEventListener(MouseEvent.MOUSE_UP, this.ToggleAddition);
			this.subtraction_mc.addEventListener(MouseEvent.MOUSE_UP, this.ToggleSubtraction);
			this.multiplication_mc.addEventListener(MouseEvent.MOUSE_UP, this.ToggleMultiplication);
			this.division_mc.addEventListener(MouseEvent.MOUSE_UP, this.ToggleDivision);
			
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
		
		//********************//
		// ADDITION FUNCTIONS //
		//********************//
		private function DisplayAdditionStats()
		{
			this.graph_mc.DisplayAdditionStats();
		}
		
		private function HideAdditionStats()
		{
			this.graph_mc.HideAdditionStats();
		}
	
		private function ToggleAddition(e:Event)
		{
			if (displayAddition == false)
			{
				this.DisplayAdditionStats();
				this.displayAddition = true;
				
				if (this.additionTween != null)
					this.additionTween.reverse();
			}else{
				this.HideAdditionStats();
				this.displayAddition = false;
				this.BevelTween("addition");
			}
		}
		
		//***********************//
		// SUBTRACTION FUNCTIONS //
		//***********************//
		private function DisplaySubtractionStats()
		{
			this.graph_mc.DisplaySubtractionStats();
		}
		
		private function HideSubtractionStats()
		{
			this.graph_mc.HideSubtractionStats();
		}
	
		private function ToggleSubtraction(e:Event)
		{
			if (displaySubtraction == false)
			{
				this.DisplaySubtractionStats();
				this.displaySubtraction = true;
				
				if (this.subtractionTween != null)
					this.subtractionTween.reverse();
			}else{
				this.HideSubtractionStats();
				this.displaySubtraction = false;
				this.BevelTween("subtraction");
			}
		}
		
		//**************************//
		// MULTIPLICATION FUNCTIONS //
		//**************************//
		private function DisplayMultiplicationStats()
		{
			this.graph_mc.DisplayMultiplicationStats();
		}
		
		private function HideMultiplicationStats()
		{
			this.graph_mc.HideMultiplicationStats();
		}
	
		private function ToggleMultiplication(e:Event)
		{
			if (displayMultiplication == false)
			{
				this.DisplayMultiplicationStats();
				this.displayMultiplication = true;
				
				if (this.multiplicationTween != null)
					this.multiplicationTween.reverse();
			}else{
				this.HideMultiplicationStats();
				this.displayMultiplication = false;
				this.BevelTween("multiplication");
			}
		}
		
		//********************//
		// DIVISION FUNCTIONS //
		//********************//
		private function DisplayDivisionStats()
		{
			this.graph_mc.DisplayDivisionStats();
		}
		
		private function HideDivisionStats()
		{
			this.graph_mc.HideDivisionStats();
		}
	
		private function ToggleDivision(e:Event)
		{
			if (this.displayDivision == false)
			{
				this.DisplayDivisionStats();
				this.displayDivision = true;
				
				if (this.divisionTween != null)
					this.divisionTween.reverse();
			}else{
				this.HideDivisionStats();
				this.displayDivision = false;
				this.BevelTween("division");
			}
		}
		
		//*********************//
		// ANIMATION FUNCITONS //
		//*********************//
		private function BevelTween(level:String)
		{
			this[level + "Tween"] = new TweenMax(this[level + "_mc"], 0.2, {bevelFilter:{blurX:20, blurY:20, distance:10, angle:45, strength:5}});
			this[level + "Tween"].play();
		}
	}
}
