package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.TweenMax;
	import com.greensock.TimelineMax;
	
	
	public class ConfirmationView extends MovieClip {

		// Elements on SWF
		public var no_mc:MovieClip;
		public var yes_mc:MovieClip;

		// View functions
		private var yesFunction:Function;
		
		// Tweens
		private var viewTween:TweenMax;
		private var noTimeline:TimelineMax;
		private var yesTimeline:TimelineMax;
		
		public function ConfirmationView(setYesFunction:Function) {
			this.addEventListener(Event.ADDED_TO_STAGE, Init);
			
			this.yesFunction = setYesFunction;
		}
		
		//******//
		// INIT //
		//******//
		private function Init(e:Event)
		{
			this.alpha = 0;
			
			this.viewTween = new TweenMax(this, 0.6, { alpha: 1, onReverseComplete: RemoveView });
			this.viewTween.play();
			
			this.x = this.stage.stageWidth / 2;
			this.y = this.stage.stageHeight / 2;
			
			this.no_mc.mouseChildren = false;
			this.yes_mc.mouseChildren = false;
			
			this.no_mc.addEventListener(MouseEvent.MOUSE_UP, CloseView);
			this.yes_mc.addEventListener(MouseEvent.MOUSE_UP, yesFunction);
			this.yes_mc.addEventListener(MouseEvent.MOUSE_UP, CloseView);
			
			this.SetupButtonAnimation("no");
			this.SetupButtonAnimation("yes");
		}
		
		//******************//
		// BUTTON ANIMATION //
		//******************//
		private function SetupButtonAnimation(btnName:String)
		{
			var button:MovieClip = this[btnName + "_mc"];
			var timeline:TimelineMax = this[btnName + "Timeline"];
			
			if (timeline == null)
				timeline = new TimelineMax();
			
			timeline.append(new TweenMax(button, 0.25, { rotation: -10 }));
			timeline.append(new TweenMax(button, 0.25, { rotation: 10 }));
			timeline.append(new TweenMax(button, 0.25, { rotation: 0 }));

			timeline.pause();
			
			this[btnName + "Timeline"] = timeline;
			
			button.addEventListener(MouseEvent.MOUSE_OVER, ButtonPlay);
			button.addEventListener(MouseEvent.MOUSE_OUT, ButtonReverse);
		}
		
		private function ButtonPlay(e:MouseEvent)
		{
			var btn:MovieClip = e.target as MovieClip;
			var test = btn.name.replace("_mc", "") + "Timeline";
			var timeline:TimelineMax = this[test] as TimelineMax;
			
			timeline.play();
		}
		
		private function ButtonReverse(e:MouseEvent)
		{
			var btn:MovieClip = e.target as MovieClip;
			var timeline:TimelineMax = this[btn.name.replace("_mc", "") + "Timeline"];
			
			timeline.reverse();
		}
		
		//*****************//
		// CLOSE FUNCTIONS //
		//*****************//
		private function CloseView(e:MouseEvent = null)
		{
			this.viewTween.reverse();
		}
		
		private function RemoveView()
		{
			this.parent.removeChild(this);
		}
	}
	
}
