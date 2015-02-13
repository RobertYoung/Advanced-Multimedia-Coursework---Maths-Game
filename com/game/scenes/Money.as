﻿package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import com.game.elements.Can;
	import com.game.elements.Bottle;
	import com.game.elements.Box;
	
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
		
		public function Money() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			
			this.CreateCan();
			this.CreateBottle();
			this.CreateBox();
		}
		
		//*******************//
		// PRODUCT FUNCTIONS //
		//*******************//
		private function CreateCan()
		{
			this.can = new Can();
			
			this.can.x = 200;
			this.can.y = 400;
			this.SetPrice(this.can, 210);
			
			this.main.addChild(this.can);
		}
		
		private function CreateBottle()
		{
			this.bottle = new Bottle();
			
			this.bottle.x = 300;
			this.bottle.y = 400;
			this.SetPrice(this.bottle, 99);
			
			this.main.addChild(this.bottle);
		}
		
		private function CreateBox()
		{
			this.box = new Box();
			
			this.box.x = 200;
			this.box.y = 600;
			this.SetPrice(this.box, 481);
			
			this.main.addChild(this.box);
		}
		
		private function SetPrice(product:MovieClip, price:Number)
		{
			product["price_txt"].text = this.PenceToPounds(price);
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
	}	
}
