package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.game.factory.AppearanceSettings;
	import com.greensock.TimelineMax;
	import flash.geom.ColorTransform;
	
	public class Play extends MovieClip {
		
		// Elements in this SWF
		public var addition_mc:MovieClip;
		public var subtraction_mc:MovieClip;
		public var multiplication_mc:MovieClip;
		public var division_mc:MovieClip;
		public var money_mc:MovieClip;
		
		// Tween variables
		private var addition_mcTween:TimelineMax;
		private var subtraction_mcTween:TimelineMax;
		private var multiplication_mcTween:TimelineMax;
		private var division_mcTween:TimelineMax;
		private var money_mcTween:TimelineMax;
		
		// Game variables
		private var main:Main;
		
		public function Play() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.main = this.stage.getChildAt(0) as Main;
			
			this.addition_mcTween = new TimelineMax({ name: "mainQueue" });
			this.subtraction_mcTween = new TimelineMax({ name: "mainQueue" });
			this.multiplication_mcTween = new TimelineMax({ name: "mainQueue" });
			this.division_mcTween = new TimelineMax({ name: "mainQueue" });
			this.money_mcTween = new TimelineMax({ name: "mainQueue" });
			
			this.addition_mc.mouseChildren = false;
			this.subtraction_mc.mouseChildren = false;
			this.multiplication_mc.mouseChildren = false;
			this.division_mc.mouseChildren = false;
			this.money_mc.mouseChildren = false;
			
			this.addition_mc.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadAdditionFromMouseEvent);
			this.subtraction_mc.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadSubtractionFromMouseEvent);
			this.multiplication_mc.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadMultiplicationFromMouseEvent);
			this.division_mc.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadDivideFromMouseEvent);
			this.money_mc.addEventListener(MouseEvent.MOUSE_UP, this.main.LoadMoneyFromMouseEvent);
			
			this.addition_mc.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.subtraction_mc.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.multiplication_mc.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.division_mc.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			this.money_mc.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			
			this.SetColour(this.addition_mc);
			this.SetColour(this.subtraction_mc);
			this.SetColour(this.multiplication_mc);
			this.SetColour(this.division_mc);
			this.SetColour(this.money_mc);
		}
		
		//***********************//
		// MOUSE EVENT FUNCTIONS //
		//***********************//
		private function OnMouseOver(e:MouseEvent)
		{
			var button:MovieClip = e.target as MovieClip;
			var tween:TimelineMax = this[button.name + "Tween"] as TimelineMax;
			
			button.removeEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			button.addEventListener(MouseEvent.MOUSE_OUT, this.OnMouseOut);
			
			tween.append(AppearanceSettings.ButtonTween(button));
			
			tween.play();
		}
		
		private function OnMouseOut(e:MouseEvent)
		{
			var button:MovieClip = e.target as MovieClip;
			var tween:TimelineMax = this[button.name + "Tween"] as TimelineMax;
			
			button.removeEventListener(MouseEvent.MOUSE_OUT, this.OnMouseOut);
			button.addEventListener(MouseEvent.MOUSE_OVER, this.OnMouseOver);
			
			tween.reverse();
		}
		
		//******************//
		// COLOUR FUNCTIONS //
		//******************//
		private function SetColour(button:MovieClip)
		{
			var myColorTransform:ColorTransform = new ColorTransform();
			myColorTransform.color = AppearanceSettings.DefaultColour();
			
			var bg:MovieClip = button["button_mc"]["background_mc"] as MovieClip;
			bg.transform.colorTransform = myColorTransform;
		}
	}
}
