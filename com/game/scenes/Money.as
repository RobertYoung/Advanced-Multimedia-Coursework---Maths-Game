package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import com.game.elements.Can;
	import com.game.elements.Bottle;
	import com.game.elements.Box;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	
	public class Money extends MovieClip {

		public static const ELEMENT_COUNTER:String = "counter_mc";
		
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
			this.SetPrice(this.can);
			
			this.main.addChild(this.can);
		}
		
		private function CreateBottle()
		{
			this.bottle = new Bottle();
			
			this.bottle.x = 956;
			this.bottle.y = 530;
			this.SetPrice(this.bottle);
			
			this.main.addChild(this.bottle);
		}
		
		private function CreateBox()
		{
			this.box = new Box();
			
			this.box.x = 780;
			this.box.y = 655;
			this.SetPrice(this.box);
			
			this.main.addChild(this.box);
		}
		
		private function SetPrice(product:MovieClip)
		{
			var price:Number = this.game.GenerateRandomNumber(50, 500);
			
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
			
			for (var i = 1; i <= numberOfProducts; i++)
			{
				var randomNum:Number = this.game.GenerateRandomNumber(1, 3);

				switch (randomNum)
				{
					case 1:
						this.CreateCan();
					break;
					case 2:
						this.CreateBottle();
					break;
					case 3:
						this.CreateBox();
					break;
				}
			}
		}
		
		//*****************//
		// MONEY FUNCTIONS //
		//*****************//
		public function PenceToPounds(pence:Number):String
		{
			var pounds:int = pence / 100;
			pence = pence % 100;
			
			if (pounds == 0)
				return pence + "p";
			
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
				trace("Win!");
				this.IncrementLevel();
			}else{
				trace("Lose!");
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
			trace(this.numberToMake);
		}
	}	
}
