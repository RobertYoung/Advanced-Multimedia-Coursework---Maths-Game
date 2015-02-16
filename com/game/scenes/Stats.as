package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	
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
			}else{
				this.HideAdditionStats();
				this.displayAddition = false;
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
			}else{
				this.HideSubtractionStats();
				this.displaySubtraction = false;
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
			}else{
				this.HideMultiplicationStats();
				this.displayMultiplication = false;
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
			}else{
				this.HideDivisionStats();
				this.displayDivision = false;
			}
		}
	}
}
