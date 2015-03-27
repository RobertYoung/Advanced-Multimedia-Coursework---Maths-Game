package com.game.elements {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import com.game.scenes.Main;
	import flash.events.MouseEvent;
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	import com.game.factory.MathsWebService;
	
	public class CompleteAlertview extends MovieClip {
		
		// Elements on alertview
		public var description_txt:TextField;
		public var next_btn:MovieClip;
		public var name_txt:TextField;
		public var save_mc:MovieClip;
		
		// Game variables
		private var main:Main;

		// Score variables
		private var levelName:String;
		private var totalScore:Number;
		
		// Tween variables
		private var nextTween:TimelineMax;
		private var saveTween:TimelineMax;
		
		// Function variables
		private var nextFunction:Function;
		
		public function CompleteAlertview(setDescription:String, setNextButtonFunction:Function, setLevelName:String = "", setTotalScore:Number = 0) {
			this.SetDescription(setDescription);
			this.SetNextButtonFunction(setNextButtonFunction);
			
			this.levelName = setLevelName;
			this.totalScore = setTotalScore;
			
			this.addEventListener(Event.ADDED_TO_STAGE, AddedToStage);
			this.save_mc.addEventListener(MouseEvent.MOUSE_UP, this.SaveScore);
		}
		
		//****************//
		// ADDED TO STAGE //
		//****************//
		private function AddedToStage(e:Event)
		{
			this.main = this.stage.getChildAt(0) as Main;
			this.x = this.stage.stageWidth / 2;
			this.y = this.stage.stageHeight / 2;
			this.name = Main.ELEMENT_COMPLETE_ALERTVIEW;
			this.main.BringCursorToFront();
			this.ButtonTweens();
		}
		
		//***********************//
		// DESCRIPTION FUNCTIONS //
		//***********************//
		public function SetDescription(setDescription:String)
		{
			this.description_txt.text = setDescription;
		}
		
		//***********************//
		// NEXT BUTTON FUNCTIONS //
		//***********************//
		public function SetNextButtonFunction(setFunction:Function)
		{
			this.nextFunction = setFunction;
			this.next_btn.addEventListener(MouseEvent.MOUSE_UP, NextMouseUp);
		}
		
		private function ButtonTweens()
		{
			if (this.nextTween == null)
			{
				this.nextTween = new TimelineMax();
				this.nextTween.append(new TweenMax(this.next_btn, 1, {glowFilter: {color:0x000000, alpha:1, blurX:20, blurY:20, strength:1}}));
				this.nextTween.repeat(-1);
				this.nextTween.yoyo(true);
				this.nextTween.play();
			}
			
			if (this.saveTween == null)
			{
				this.saveTween = new TimelineMax();
				this.saveTween.append(new TweenMax(this.save_mc, 1, {glowFilter: {color:0x000000, alpha:1, blurX:20, blurY:20, strength:1}}));
				this.saveTween.repeat(-1);
				this.saveTween.yoyo(true);
				this.saveTween.play();
			}
		}
		
		//***********************//
		// SAVE BUTTON FUNCTIONS //
		//***********************//
		public function SaveScore(e:MouseEvent = null)
		{
			trace("level: " + this.levelName, " score: " + this.totalScore + " name: " + this.name_txt.text);

			if (this.name_txt.text.length == 0)
			{
				this.name_txt.text = "Please enter your name here";
				return;
			}
			
			var webService:MathsWebService = new MathsWebService();
			
			webService.SaveScore(this.levelName, this.totalScore, this.name_txt.text);
			
			this.nextFunction(null);
		}
		
		//***********************//
		// NEXT BUTTON FUNCTIONS //
		//***********************//
		public function NextMouseUp(e:MouseEvent = null)
		{
			if (this.name_txt.text.length > 0)
			{
				this.SaveScore();
			}else{
				this.nextFunction(null);
			}
		}
	}
}
