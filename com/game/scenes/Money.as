package com.game.scenes {
	
	import flash.display.MovieClip;
	import com.game.factory.Game;
	import com.game.elements.Can;
	
	public class Money extends MovieClip {
		
		// Game variables
		private var main:Main;
		private var game:Game;
		
		// Products
		public var can:Can;
		
		public function Money() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.game = this.main.game;
			
			this.CreateCan();
		}
		
		//*******************//
		// PRODUCT FUNCTIONS //
		//*******************//
		private function CreateCan()
		{
			this.can = new Can();
			
			this.can.x = 400;
			this.can.y = 400;
			this.SetPrice(this.can, 210);
			
			this.main.addChild(this.can);
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
