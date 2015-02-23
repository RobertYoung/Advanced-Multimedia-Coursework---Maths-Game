package com.game.elements {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.game.scenes.Money;
	import com.game.scenes.Main;
	import flash.utils.*;
	import com.greensock.TweenMax;
	import fl.transitions.Tween;
	import com.greensock.easing.*;
	import com.game.factory.Game;
	
	public class Coin extends MovieClip {

		// Value variables
		private var value:Number;
		
		// Position variables
		private var nX:Number;
		private var nY:Number;
		
		// Game variables
		private var main:Main;
		
		// Tween variables
		private var tween:TweenMax;
		private var removeTween:TweenMax;
		
		public function Coin() {
			this.addEventListener(Event.ADDED_TO_STAGE, this.Init);
			this.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragFromMoneyHolder);
		}
		
		//***************//
		// INITILIZATION //
		//***************//
		private function Init(e:Event = null)
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.mouseChildren = false;
			this.nX = this.x;
			this.nY = this.y;
		}
		
		//*****************//
		// EVENT LISTENERS //
		//*****************//
		private function AddStartDragFromMoneyHolder()
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragFromMoneyHolder);
		}
		
		private function RemoveStartDragFromMoneyHolder()
		{
			this.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragFromMoneyHolder);
		}
		
		private function AddStopDragFromMoneyHolder()
		{
			this.addEventListener(MouseEvent.MOUSE_UP, this.StopDragFromMoneyHolder);
			this.addEventListener(MouseEvent.RELEASE_OUTSIDE, this.StopDragFromMoneyHolder);
		}
		
		private function RemoveStopDragFromMoneyHolder()
		{
			this.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragFromMoneyHolder);
			this.removeEventListener(MouseEvent.RELEASE_OUTSIDE, this.StopDragFromMoneyHolder);
		}
		
		private function AddStartDragFromCounter()
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, this.StartDragFromCounter);
		}
		
		private function RemoveStartDragFromCounter()
		{
			this.removeEventListener(MouseEvent.MOUSE_DOWN, this.StartDragFromCounter);
		}
		
		private function AddStopDragFromCounter()
		{
			this.addEventListener(MouseEvent.MOUSE_UP, this.StopDragFromCounter);
			this.addEventListener(MouseEvent.RELEASE_OUTSIDE, this.StopDragFromCounter);
		}
		
		private function RemoveStopDragFromCounter()
		{
			this.removeEventListener(MouseEvent.MOUSE_UP, this.StopDragFromCounter);
			this.removeEventListener(MouseEvent.RELEASE_OUTSIDE, this.StopDragFromCounter);
		}
		
		//*****************//
		// VALUE FUNCTIONS //
		//*****************//
		public function SetValue(setValue:Number)
		{
			this.value = setValue;
		}
		
		public function GetValue():Number
		{
			return this.value;
		}
		
		//****************//
		// DRAG FUNCTIONS //
		//****************//
		private function StartDragFromMoneyHolder(e:MouseEvent = null)
		{
			this.startDrag();
			this.RemoveStartDragFromMoneyHolder();
			this.AddStopDragFromMoneyHolder();
		}
		
		private function StopDragFromMoneyHolder(e:MouseEvent = null)
		{
			this.RemoveStopDragFromMoneyHolder();
			this.stopDrag();
			
			if (this.dropTarget == null)
			{
				this.AnimateBackToMoneyHolder();
				this.AddStartDragFromMoneyHolder();
			}else if (this.dropTarget.parent.name == Money.ELEMENT_COUNTER){
				this.CreateNewMoney();
				this.AddStartDragFromCounter();
				this.main.swfMoney.IncreaseAmountOnCounter(this.value);
				this.main.swfMoney.coinArray.push(this);
			}else{
				this.AnimateBackToMoneyHolder();
				this.AddStartDragFromMoneyHolder();
			}
		}
		
		private function StartDragFromCounter(e:MouseEvent = null)
		{
			this.startDrag();
			this.RemoveStartDragFromCounter();
			this.AddStopDragFromCounter();
		}
		
		private function StopDragFromCounter(e:MouseEvent = null)
		{
			this.stopDrag();
			this.RemoveStopDragFromCounter();
			
			if (this.dropTarget.parent.name != Money.ELEMENT_COUNTER)
			{
				this.DeleteMoney();
				this.main.swfMoney.DecreaseAmountOnCounter(this.value);
				this.main.swfMoney.coinArray.splice(this.main.swfMoney.coinArray.indexOf(this), 1);
			}else{
				this.AddStartDragFromCounter();
			}
		}
		
		//*********************//
		// ANIMATION FUNCTIONS //
		//*********************//
		private function AnimateBackToMoneyHolder()
		{
			tween = new TweenMax(this, 1, { x: this.nX, y: this.nY, ease: Elastic.easeOut });
			tween.play();
		}
		
		public function RemoveFromScreenTween()
		{
			this.removeTween = new TweenMax(this, 1, { y: -400 });
			this.removeTween.play();
			this.main.swfMoney.DecreaseAmountOnCounter(this.value);
			this.main.swfMoney.coinArray.splice(this.main.swfMoney.coinArray.indexOf(this), 1);
		}
		
		//***************************//
		// CREATE & DELETE FUNCTIONS //
		//***************************//
		private function CreateNewMoney()
		{
			var MoneyClass:Class = GetClass();
			var newMoney = new MoneyClass();
			
			newMoney.x = this.nX;
			newMoney.y = this.nY;
			newMoney.name = this.name;
			newMoney.scaleX = this.scaleX;
			newMoney.scaleY = this.scaleY;
			newMoney.scaleZ = this.scaleZ;

			this.main.addChild(newMoney);
			this.main.BringCursorToFront();
		}
		
		private function DeleteMoney()
		{
			this.parent.removeChild(this);
		}
		
		//*******************//
 		// CLASS INFORMATION //
		//*******************//
		function GetClass():Class { 
			return getDefinitionByName(getQualifiedClassName(this)) as Class;
 		} 
	}
}
