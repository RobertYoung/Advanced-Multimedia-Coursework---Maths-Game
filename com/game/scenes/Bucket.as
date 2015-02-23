package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import com.greensock.TweenMax;
	
	
	public class Bucket extends MovieClip {
		
		// Elements in SWF file
		public var bucket_mc:MovieClip;
		public var bucketPlaceholder_mc:MovieClip;
		
		// Tween variables
		private var tween:TweenMax;
		
		public function Bucket() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			this.bucket_mc.addEventListener(MouseEvent.MOUSE_DOWN, StartDrag);
			this.bucket_mc.addEventListener(MouseEvent.MOUSE_UP, StopDrag);
			this.bucket_mc.addEventListener(MouseEvent.RELEASE_OUTSIDE, StopDrag);
			this.bucket_mc.addEventListener(MouseEvent.ROLL_OVER, MouseOver);
		}
		
		private function StartDrag(e:MouseEvent)
		{
			var rect:Rectangle = new Rectangle(this.bucketPlaceholder_mc.x, this.bucketPlaceholder_mc.y,
												this.bucketPlaceholder_mc.width, this.bucketPlaceholder_mc.height);
			
			bucket_mc.startDrag(false, rect);
		}
		
		public function StopDrag(e:MouseEvent = null)
		{
			bucket_mc.stopDrag();
		}
		
		private function MouseOver(e:MouseEvent)
		{
			if (this.tween == null)
			{
				this.tween = new TweenMax(this.bucket_mc, 0.2, { scaleX: 1.2, scaleY: 1.2 });
			}
			
			this.bucket_mc.removeEventListener(MouseEvent.ROLL_OVER, MouseOver);
			this.bucket_mc.addEventListener(MouseEvent.ROLL_OUT, MouseOut);
			this.tween.play();
		}
		
		private function MouseOut(e:MouseEvent)
		{
			this.bucket_mc.addEventListener(MouseEvent.ROLL_OVER, MouseOver);
			this.bucket_mc.removeEventListener(MouseEvent.ROLL_OUT, MouseOut);
			this.tween.reverse();
		}
	}
}
