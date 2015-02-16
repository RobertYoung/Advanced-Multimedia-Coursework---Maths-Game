package com.game.elements {
	
	import flash.display.MovieClip;
	import com.game.factory.MathsSharedObject;
	import com.game.elements.*;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Point;
	
	public class MathsGraph extends MovieClip {
		
		// Data variables
		private var mathsData:MathsSharedObject;
		
		// Level data variables
		private var additionData:Array;
		private var subtractionData:Array;
		private var multiplicationData:Array;
		private var divisionData:Array;
		
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

		// Subtraction mark variables
		private var subtractionLevel1Mark:Mark;
		private var subtractionLevel2Mark:Mark;
		private var subtractionLevel3Mark:Mark;
		private var subtractionLevel4Mark:Mark;
		private var subtractionLevel5Mark:Mark;
		private var subtractionLine:Shape = new Shape();;
		
		// Multiplication mark variables
		private var multiplicationLevel1Mark:Mark;
		private var multiplicationLevel2Mark:Mark;
		private var multiplicationLevel3Mark:Mark;
		private var multiplicationLevel4Mark:Mark;
		private var multiplicationLevel5Mark:Mark;
		private var multiplicationLine:Shape = new Shape();;
		
		// Division mark variables
		private var divisionLevel1Mark:Mark;
		private var divisionLevel2Mark:Mark;
		private var divisionLevel3Mark:Mark;
		private var divisionLevel4Mark:Mark;
		private var divisionLevel5Mark:Mark;
		private var divisionLine:Shape = new Shape();
		
		public function MathsGraph() {
			this.mathsData = MathsSharedObject.getInstance();
			this.GetData();
		}
		
		private function GetData()
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
		}
		
		//********************//
		// ADDITION FUNCTIONS //
		//********************//
		public function DisplayAdditionStats()
		{
			this.DisplayMarkers("addition");
			this.DrawLineFromMarkers("addition");
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
			this.DisplayMarkers("subtraction");
			this.DrawLineFromMarkers("subtraction");
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
			this.DisplayMarkers("multiplication");
			this.DrawLineFromMarkers("multiplication");
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
			this.DisplayMarkers("division");
			this.DrawLineFromMarkers("division");
		}
		
		public function HideDivisionStats()
		{
			this.HideMarkers("division");
			this.HideLineFromMarkers("division");
		}
		
		//******************//
		// MARKER FUNCTIONS //
		//******************//
		private function DisplayMarkers(level:String)
		{
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
				
				
				//mark.x = 0;
				mark.x = this["level" + i + "_mc"].x;
				mark.y = yPos; 
				
				var point:Point = this.localToGlobal(new Point(mark.x, mark.y));
				mark.x = point.x;
				mark.y = point.y;
				//this["level" + i + "_mc"].addChild(mark);
				//trace(point);
				this.stage.addChild(mark);
			}
		}
		
		private function HideMarkers(level:String)
		{
			for (var i = 1; i <= 5; i++)
			{
				var mark:Mark = this[level + "Level" + i + "Mark"] as Mark;
				
				mark.parent.removeChild(mark);
			}
		}
		
		//****************//
		// LINE FUNCTIONS //
		//****************//
		private function DrawLineFromMarkers(level:String)
		{			
			var line:Shape = this[level + "Line"];
			
			line.graphics.lineStyle(2);
			line.graphics.moveTo(this[level + "Level1Mark"].x, this[level + "Level1Mark"].y);
			
			for (var i = 2; i <= 5; i++)
			{
				line.graphics.lineTo(this[level + "Level" + i + "Mark"].x, this[level + "Level" + i + "Mark"].y);
			}
			
			this.stage.addChild(line);
		}
		
		private function HideLineFromMarkers(level:String)
		{
			var line:Shape = this[level + "Line"];
			
			line.parent.removeChild(line);
		}
	}
}
