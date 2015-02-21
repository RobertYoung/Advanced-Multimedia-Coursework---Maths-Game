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
	import com.greensock.TimelineMax;
	import com.greensock.TimelineLite;
	import com.greensock.TweenMax;
	import com.game.elements.Coin;
	import flash.utils.*;
	import com.game.elements.*;
	import com.game.factory.MathsSharedObject;
	
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
		public var onePence_mc:OnePence;
		public var twoPence_mc:TwoPence;
		public var fivePence_mc:FivePence;
		public var tenPence_mc:TenPence;
		public var twentyPence_mc:TwentyPence;
		public var fiftyPence_mc:FiftyPence;
		public var onePound_mc:OnePound;
		public var twoPound_mc:TwoPound;
		public var submit_mc:MovieClip;
		public var level_txt:TextField;
		
		// Number variables
		private var amountOnCounter:Number = 0;
		private var numberToMake:Number = 0;
		private var levelNumber:Number = 1;
		
		// Tween variables
		private var canTween:TimelineMax;
		private var bottleTween:TimelineMax;
		private var boxTween:TimelineMax;
		
		// Timer variables
		private var timer:Timer;
		
		// Coin variables
		public var coinArray:Array = new Array();
		
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
			this.StartTimer();
		}
		
		//***************//
		// CAN FUNCTIONS //
		//***************//
		private function CreateCan()
		{
			this.can = new Can();
			
			this.can.x = 1500;
			this.can.y = 497;
			this.can.name = Money.ELEMENT_CAN;
			this.SetPrice(this.can);
			
			this.main.addChild(this.can);
			
			this.ShowCan();
		}
		
		private function ShowCan()
		{
			this.canTween = new TimelineMax();
			this.canTween.append(new TweenMax(this.can, 1, { x: 790, onReverseComplete: this.RemoveCan } ));
			this.canTween.play();
		}
		
		private function HideCan()
		{
			if (this.canTween != null)
				this.canTween.reverse();
		}
		
		private function RemoveCan()
		{
			if (!this.canTween._active)
				this.can.parent.removeChild(this.can);
		}
		
		//******************//
		// BOTTLE FUNCTIONS //
		//******************//
		private function CreateBottle()
		{
			this.bottle = new Bottle();
			
			this.bottle.x = 1500;
			this.bottle.y = 530;
			this.bottle.name = Money.ELEMENT_BOTTLE;
			this.SetPrice(this.bottle);
			
			this.main.addChild(this.bottle);
			
			this.ShowBottle();
		}
		
		private function ShowBottle()
		{
			this.bottleTween = new TimelineMax();
			this.bottleTween.append(new TweenMax(this.bottle, 1, { x: 956, onReverseComplete: this.RemoveBottle } ));
			this.bottleTween.play();
		}
		
		private function HideBottle()
		{
			if (this.bottleTween != null)
				this.bottleTween.reverse();
		}
		
		private function RemoveBottle()
		{
			if (!this.bottleTween._active)
				this.bottle.parent.removeChild(this.bottle);
		}
		
		//***************//
		// BOX FUNCTIONS //
		//***************//
		private function CreateBox()
		{
			this.box = new Box();
			
			this.box.x = 1500;
			this.box.y = 655;
			this.box.name = Money.ELEMENT_BOX
			this.SetPrice(this.box);
			
			this.main.addChild(this.box);
			
			this.ShowBox();
		}
		
		private function ShowBox()
		{
			this.boxTween = new TimelineMax();
			this.boxTween.append(new TweenMax(this.box, 1, { x: 780, onReverseComplete: this.RemoveBox } ));
			this.boxTween.play();
		}
		
		private function HideBox()
		{
			if (this.boxTween != null)
				this.boxTween.reverse();
		}
		
		private function RemoveBox()
		{
			if (!this.boxTween._active)
				this.box.parent.removeChild(this.box);
		}
		
		//*******************//
		// PRODUCT FUNCTIONS //
		//*******************//
		private function SetPrice(product:MovieClip)
		{
			var price:Number = this.game.GenerateRandomNumber(50, 1000);
			
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
		}
		
		private function RemoveProducts()
		{			
			this.HideCan();
			this.HideBottle();
			this.HideBox();
		}
		
		private function RemoveCoins()
		{
			for (var index = this.coinArray.length - 1; index >= 0; index--)
			{
				var coin:Coin = this.coinArray[index] as Coin;
				coin.RemoveFromScreenTween();
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
		}
		
		public function DecreaseAmountOnCounter(amount:Number)
		{
			this.amountOnCounter -= amount;
		}
		
		//***********************//
		// CHECK MONEY FUNCTIONS //
		//***********************//
		private function CheckMoney(e:MouseEvent = null)
		{
			if (this.amountOnCounter == this.numberToMake)
			{
				this.SaveScore();
				
				if (this.levelNumber == 5)
				{
					var correctAlertview:CompleteAlertview = new CompleteAlertview("You have bought all your items successfully!", this.main.LoadPlayFromMouseEvent);
					
					this.main.addChild(correctAlertview);
				}else{
					this.IncrementLevel();
					this.RemoveProducts();
					this.ResetNumberToMake();
					this.CreateProducts();
					this.RemoveCoins();
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
		
		//*****************//
		// TIMER FUNCTIONS //
		//*****************//
		private function StartTimer()
		{
			this.timer = new Timer(10);
			this.timer.start();
		}
		
		private function GetTime():Number
		{
			return this.timer.currentCount / 100;
		}
		
		//*****************//
		// SCORE FUNCTIONS //
		//*****************//
		private function SaveScore()
		{
			MathsSharedObject.getInstance().SetMoneyLevelData(this.levelNumber, this.GetTime());
			this.StartTimer();
		}
		
		//*******************//
 		// CLASS INFORMATION //
		//*******************//
		function GetClass(object:Object):Class { 
			return getDefinitionByName(getQualifiedClassName(object)) as Class;
 		} 
	}	
}
