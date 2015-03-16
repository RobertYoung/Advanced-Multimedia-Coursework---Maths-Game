package com.game.elements {
	
	import flash.display.MovieClip;
	import com.game.factory.MathsSharedObject;
	import com.game.elements.*;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Point;
	import com.game.scenes.Stats;
	import com.greensock.TimelineMax;
	import com.greensock.TimelineLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import com.game.scenes.Main;
	import flash.events.Event;
	
	public class MathsGraph extends MovieClip {

		// Game variables
		private var main:Main;
		
		// Data variables
		private var mathsData:MathsSharedObject;
		
		// Level data variables
		private var additionData:Array;
		private var subtractionData:Array;
		private var multiplicationData:Array;
		private var divisionData:Array;
		private var moneyData:Array;
		
		// Elements in movieclip
		public var level1_mc:MovieClip;
		public var level2_mc:MovieClip;
		public var level3_mc:MovieClip;
		public var level4_mc:MovieClip;
		public var level5_mc:MovieClip;
		
		// Graph variables
		private var maxValue:Number = 50;
		
		// Addition mark variables
		private var additionLevel1Mark:Mark;
		private var additionLevel2Mark:Mark;
		private var additionLevel3Mark:Mark;
		private var additionLevel4Mark:Mark;
		private var additionLevel5Mark:Mark;
		private var additionLine:Shape = new Shape();
		private var additionTween:TimelineMax = new TimelineMax();

		// Subtraction mark variables
		private var subtractionLevel1Mark:Mark;
		private var subtractionLevel2Mark:Mark;
		private var subtractionLevel3Mark:Mark;
		private var subtractionLevel4Mark:Mark;
		private var subtractionLevel5Mark:Mark;
		private var subtractionLine:Shape = new Shape();
		private var subtractionTween:TimelineMax = new TimelineMax();
		
		// Multiplication mark variables
		private var multiplicationLevel1Mark:Mark;
		private var multiplicationLevel2Mark:Mark;
		private var multiplicationLevel3Mark:Mark;
		private var multiplicationLevel4Mark:Mark;
		private var multiplicationLevel5Mark:Mark;
		private var multiplicationLine:Shape = new Shape();
		private var multiplicationTween:TimelineMax = new TimelineMax();
		
		// Division mark variables
		private var divisionLevel1Mark:Mark;
		private var divisionLevel2Mark:Mark;
		private var divisionLevel3Mark:Mark;
		private var divisionLevel4Mark:Mark;
		private var divisionLevel5Mark:Mark;
		private var divisionLine:Shape = new Shape();
		private var divisionTween:TimelineMax = new TimelineMax();
		
		// Money mark variables
		private var moneyLevel1Mark:Mark;
		private var moneyLevel2Mark:Mark;
		private var moneyLevel3Mark:Mark;
		private var moneyLevel4Mark:Mark;
		private var moneyLevel5Mark:Mark;
		private var moneyLine:Shape = new Shape();
		private var moneyTween:TimelineMax = new TimelineMax();
		
		public function MathsGraph() {
			this.mathsData = MathsSharedObject.getInstance();
			this.GetData();
			
			this.addEventListener(Event.ADDED_TO_STAGE, this.AddedToStage);
		}
		
		//******//
		// INIT //
		//******//
		private function AddedToStage(e:Event)
		{
			this.main = this.stage.getChildAt(0) as Main;
		}
		
		public function GetData()
		{
			this.additionData = new Array();
			
			// Get addition
			for (var add = 1; add <= 5; add++)
			{
				this.additionData.push(this.mathsData.GetAdditionLevelData(add));
			}
			
			this.subtractionData = new Array();
			
			// Get subtraction
			for (var sub = 1; sub <= 5; sub++)
			{
				this.subtractionData.push(this.mathsData.GetSubtractionLevelData(sub));
			}
			
			this.multiplicationData = new Array();
			
			// Get multiplication
			for (var mul = 1; mul <= 5; mul++)
			{
				this.multiplicationData.push(this.mathsData.GetMultiplicationLevelData(mul));
			}
			
			this.divisionData = new Array();
			
			// Get division
			for (var div = 1; div <= 5; div++)
			{
				this.divisionData.push(this.mathsData.GetDivisionLevelData(div));
			}
			
			this.moneyData = new Array();
			
			// Get money
			for (var mon = 1; mon <= 5; mon++)
			{
				this.moneyData.push(this.mathsData.GetMoneyLevelData(mon));
			}
		}
		
		//********************//
		// ADDITION FUNCTIONS //
		//********************//
		public function DisplayAdditionStats()
		{
			this.additionTween = new TimelineMax();
			this.DisplayMarkers("addition", Stats.ADDITION_COLOUR);
		}
		
		public function HideAdditionStats()
		{
			this.HideMarkers("addition");
			this.HideLineFromMarkers("addition");
		}
		
		//***********************//
		// SUBTRACTION FUNCTIONS //
		//***********************//
		public function DisplaySubtractionStats()
		{
			this.subtractionTween = new TimelineMax();
			this.DisplayMarkers("subtraction", Stats.SUBTRACTION_COLOUR);
		}
		
		public function HideSubtractionStats()
		{
			this.HideMarkers("subtraction");
			this.HideLineFromMarkers("subtraction");
		}
		
		//**************************//
		// MULTIPLICATION FUNCTIONS //
		//**************************//
		public function DisplayMultiplicationStats()
		{
			this.multiplicationTween = new TimelineMax();
			this.DisplayMarkers("multiplication", Stats.MULTIPLICATION_COLOUR);
		}
		
		public function HideMultiplicationStats()
		{
			this.HideMarkers("multiplication");
			this.HideLineFromMarkers("multiplication");
		}
		
		//********************//
		// DIVISION FUNCTIONS //
		//********************//
		public function DisplayDivisionStats()
		{
			this.divisionTween = new TimelineMax();
			this.DisplayMarkers("division", Stats.DIVISION_COLOUR);
		}
		
		public function HideDivisionStats()
		{
			this.HideMarkers("division");
			this.HideLineFromMarkers("division");
		}
		
		//*****************//
		// MONEY FUNCTIONS //
		//*****************//
		public function DisplayMoneyStats()
		{
			this.moneyTween = new TimelineMax();
			this.DisplayMarkers("money", Stats.MONEY_COLOUR);
		}
		
		public function HideMoneyStats()
		{
			this.HideMarkers("money");
			this.HideLineFromMarkers("money");
		}
		
		//******************//
		// MARKER FUNCTIONS //
		//******************//
		private function DisplayMarkers(level:String, colour:int)
		{
			var timeline:TimelineMax = this[level + "Tween"];
			
			for (var i = 1; i <= 5; i++)
			{
				var data:Number = this[level + "Data"][i - 1];
				var percent:Number = data / this.maxValue;
				var yPos:Number;

				if (percent > 1)
					yPos = -this["level" + i + "_mc"].height;
				else
					yPos = -(this["level" + i + "_mc"].height * percent);
				
				this[level + "Level" + i + "Mark"] = new Mark();
				
				var mark = this[level + "Level" + i + "Mark"];
				
				mark.x = this["level" + i + "_mc"].x;
				mark.y = yPos; 
				
				var point:Point = this.localToGlobal(new Point(mark.x, mark.y));
				
				mark.x = point.x;
				mark.y = -100;
				
				this.main.addChild(mark);
				
				timeline.append(new TweenMax(mark, 0.2, { y: point.y, ease: Bounce.easeInOut } ));
			}
			
			timeline.addCallback(this.DrawLineFromMarkers, null, [ level, colour ] );
			timeline.play();
		}
		
		private function HideMarkers(level:String)
		{
			var tween:TimelineMax = this[level + "Tween"];
			
			tween.reverse();
		}
		
		//****************//
		// LINE FUNCTIONS //
		//****************//
		private function DrawLineFromMarkers(level:String, colour:int)
		{			
			var line:Shape = this[level + "Line"];
			
			line.graphics.lineStyle(2, colour);
			line.graphics.moveTo(this[level + "Level1Mark"].x, this[level + "Level1Mark"].y);
			
			for (var i = 2; i <= 5; i++)
			{
				line.graphics.lineTo(this[level + "Level" + i + "Mark"].x, this[level + "Level" + i + "Mark"].y);
			}
			
			this.main.addChild(line);
		}
		
		private function HideLineFromMarkers(level:String)
		{
			try{
				var line:Shape = this[level + "Line"];
				
				if (line != null)
					line.parent.removeChild(line);
			}catch(e:Error){
				
			}
		}
	}
}
