package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import com.game.elements.Can;
	import com.game.elements.Bottle;
	import com.game.elements.Box;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import com.game.elements.IncorrectAlertview;
	import com.game.elements.CompleteAlertview;
	
	public class Money extends MovieClip {

		public static const ELEMENT_COUNTER:String = "counter_mc";
		public static const ELEMENT_CAN:String = "can_mc";
		public static const ELEMENT_BOTTLE:String = "bottle_mc";
		public static const ELEMENT_BOX:String = "box_mc";
		
		// Game variables
		private var main:Main;
		private var game:Game;
		
		// Products
		private var can:Can;
		private var bottle:Bottle;
		private var box:Box;
		
		// Element on SWF file
		public var counter_mc:MovieClip;
		public var onePence_mc:MovieClip;
		public var twoPence_mc:MovieClip;
		public var fivePence_mc:MovieClip;
		public var tenPence_mc:MovieClip;
		public var twentyPence_mc:MovieClip;
		public var fiftyPence_mc:MovieClip;
		public var onePound_mc:MovieClip;
		public var twoPound_mc:MovieClip;
		public var submit_mc:MovieClip;
		public var level_txt:TextField;
		
		// Number variables
		private var amountOnCounter:Number = 0;
		private var numberToMake:Number = 0;
		private var levelNumber:Number = 1;
		
		public function Money() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			
			this.submit_mc.mouseChildren = false;
			this.submit_mc.addEventListener(MouseEvent.MOUSE_UP, CheckMoney);
			
			this.CreateProducts();
		}
		
		//*******************//
		// PRODUCT FUNCTIONS //
		//*******************//
		private function CreateCan()
		{
			this.can = new Can();
			
			this.can.x = 790;
			this.can.y = 497;
			this.can.name = Money.ELEMENT_CAN;
			this.SetPrice(this.can);
			
			this.main.addChild(this.can);
			trace("CAN");
		}
		
		private function CreateBottle()
		{
			this.bottle = new Bottle();
			
			this.bottle.x = 956;
			this.bottle.y = 530;
			this.bottle.name = Money.ELEMENT_BOTTLE;
			this.SetPrice(this.bottle);
			
			this.main.addChild(this.bottle);
			trace("BOTTLE");
		}
		
		private function CreateBox()
		{
			this.box = new Box();
			
			this.box.x = 780;
			this.box.y = 655;
			this.box.name = Money.ELEMENT_BOX
			this.SetPrice(this.box);
			
			this.main.addChild(this.box);
			trace("BOX");
		}
		
		private function SetPrice(product:MovieClip)
		{
			var price:Number = this.game.GenerateRandomNumber(50, 50);
			
			product["price_txt"].text = this.PenceToPounds(price);
			
			this.IncreaseNumberToMake(price);
		}
		
		private function CreateProducts()
		{
			var numberOfProducts:Number = 0;
			
			switch (this.levelNumber)
			{
				case 1:
					numberOfProducts = 1;
				break;
				case 2:
					numberOfProducts = 1;
				break;
				case 3:
					numberOfProducts = 2;
				break;
				case 4:
					numberOfProducts = 2;
				break;
				case 5:
					numberOfProducts = 3;
				break;
			}
			
			var productsCreated:Array = new Array();
			
			for (var i = 1; i <= numberOfProducts; i++)
			{
				var randomNum:Number;
				var randomNumFound:Boolean = false;
				
				while (!randomNumFound)
				{
					randomNum = this.game.GenerateRandomNumber(1, 3);
					
					if (productsCreated.indexOf(randomNum) == -1)
						randomNumFound = true;
				}				

				switch (randomNum)
				{
					case 1:
						this.CreateCan();
						productsCreated.push(1);
					break;
					case 2:
						this.CreateBottle();
						productsCreated.push(2);
					break;
					case 3:
						this.CreateBox();
						productsCreated.push(3);
					break;
				}
			}
			
			trace("Number to make: " + this.numberToMake);
		}
		
		private function RemoveProducts()
		{			
			for (var i = (this.main.numChildren - 1); i >= 0; i--)
			{
				trace(this.main.getChildAt(i).name);
				
				if (this.main.getChildAt(i).name == Money.ELEMENT_CAN ||
					this.main.getChildAt(i).name == Money.ELEMENT_BOTTLE ||
					this.main.getChildAt(i).name == Money.ELEMENT_BOX)
				{
					trace("REMOVED: " + this.main.getChildAt(i).name);
					this.main.removeChildAt(i);
				}
			}
		}
		
		//*****************//
		// MONEY FUNCTIONS //
		//*****************//
		public function PenceToPounds(pence:Number):String
		{
			trace(pence);
			var pounds:int = pence / 100;
			pence = pence % 100;
			
			if (pounds == 0)
				return pence + "p";

			if (pence < 10)
				return "£" + pounds + ".0" + pence;
			
			return "£" + pounds + "." + pence;
		}
		
		//*****************************//
		// AMOUNT ON COUNTER FUNCTIONS //
		//*****************************//
		public function IncreaseAmountOnCounter(amount:Number)
		{
			this.amountOnCounter += amount;
			trace(this.amountOnCounter);
		}
		
		public function DecreaseAmountOnCounter(amount:Number)
		{
			this.amountOnCounter -= amount;
			trace(this.amountOnCounter);
		}
		
		//***********************//
		// CHECK MONEY FUNCTIONS //
		//***********************//
		private function CheckMoney(e:MouseEvent = null)
		{
			if (this.amountOnCounter == this.numberToMake)
			{
				if (this.levelNumber == 5)
				{
					var correctAlertview:CompleteAlertview = new CompleteAlertview("You have bought all your items successfully!", this.main.LoadPlayFromMouseEvent);
					
					this.main.addChild(correctAlertview);
				}else{
					this.IncrementLevel();
					this.RemoveProducts();
					this.ResetNumberToMake();
					this.CreateProducts();
				}
			}else{
				var incorrectAlertview:IncorrectAlertview = new IncorrectAlertview("Oh no!", "The amount of change on the counter is incorrect", this.main.RemoveAlertviews);
				
				this.main.addChild(incorrectAlertview);
			}
		}
		
		//*****************//
		// LEVEL FUNCTIONS //
		//*****************//
		private function SetLevel(level:Number)
		{
			this.levelNumber = level;
			this.level_txt.text = "Level " + level;
		}
		
		private function IncrementLevel()
		{
			this.SetLevel(this.levelNumber + 1);
		}
		
		//**************************//
		// NUMBER TO MAKE FUNCTIONS //
		//**************************//
		private function IncreaseNumberToMake(number:Number)
		{
			this.numberToMake += number;
		}
		
		private function ResetNumberToMake()
		{
			this.numberToMake = 0;
		}
	}	
}
