package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import fl.transitions.Tween;
	import com.greensock.TimelineMax;
	import fl.motion.Color;
	
	
	public class ProgressMeter extends MovieClip {
		
		// Number variables
		private var currentNumber:Number;
		private var numberToMake:Number;
		
		// Elements on movieclip
		public var progressFill_mc:MovieClip;
		
		// Tweens
		private var fillTween:TimelineMax;
		
		public function ProgressMeter(current:Number = 0, toMake:Number = 0) {
			this.SetCurrentNumber(current);
			this.SetNumberToMake(toMake);
			
			this.addEventListener(Event.ADDED_TO_STAGE, this.AddedToStage);
		}
		
		//********//
		// EVENTS //
		//********//
		private function AddedToStage(e:Event)
		{
			this.x = 350;
			this.y = 50;
		}
		
		//**************************//
		// CURRENT NUMBER FUNCTIONS //
		//**************************//
		public function SetCurrentNumber(current:Number)
		{
			this.currentNumber = current;
			this.UpdateFill();
		}
		
		//**************************//
		// NUMBER TO MAKE FUNCTIONS //
		//**************************//
		public function SetNumberToMake(toMake:Number)
		{
			this.numberToMake = toMake;
			this.UpdateFill();
		}
		
		//****************//
		// FILL FUNCTIONS //
		//****************//
		private function UpdateFill()
		{
			var percentage:Number = (this.currentNumber / this.numberToMake);
			var newX:Number = 360 * percentage;
			
			if (percentage > 1)
			{
				this.FillTween(360);
				this.OverFill();
			}else if (percentage == 1)
			{
				this.FillTween(360);
				this.CorrectFill();
				this.ResetFill();
			}else{
				this.FillTween(newX);
			}
			
			this.PlayFillTween();
		}
		
		private function FillTween(newX:Number)
		{
			this.fillTween = new TimelineMax();
			this.fillTween.append(new TweenMax(this.progressFill_mc, 1, { x: newX }));
		}
		
		private function OverFill()
		{
			this.fillTween.append(new TweenMax(this.progressFill_mc, 1, { colorTransform:{tint:0xff0000, tintAmount: 1} }));
		}
		
		private function CorrectFill()
		{
			this.fillTween.append(new TweenMax(this.progressFill_mc, 1, { colorTransform:{tint:0x00ff00, tintAmount: 1} }));
		}
		
		private function ResetFill()
		{
			this.fillTween.append(new TweenMax(this.progressFill_mc, 1, { colorTransform:{tint:0x00CCFF, tintAmount: 1}, x: 0 }));
		}
		
		private function PlayFillTween()
		{
			this.fillTween.play();
		}
	}
}
