package com.game.scenes {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	
	public class Bucket extends MovieClip {
		
		public var bucket_mc:MovieClip;
		public var bucketPlaceholder_mc:MovieClip;
		
		public function Bucket() {
			/* DO NOT PUT ANYTHING IN HERE */
		}
		
		public function Init()
		{
			trace("BUCKET SWF LOADED");
			
			this.bucket_mc.addEventListener(MouseEvent.MOUSE_DOWN, StartDrag);
			this.bucket_mc.addEventListener(MouseEvent.MOUSE_UP, StopDrag);
			this.bucket_mc.addEventListener(MouseEvent.RELEASE_OUTSIDE, StopDrag);
		}
		
		private function StartDrag(e:MouseEvent)
		{
			var target:MovieClip = e.target as MovieClip;
			
			var rect:Rectangle = new Rectangle(this.bucketPlaceholder_mc.x, this.bucketPlaceholder_mc.y,
												this.bucketPlaceholder_mc.width, this.bucketPlaceholder_mc.height);
			
			target.startDrag(false, rect);
		}
		
		private function StopDrag(e:MouseEvent)
		{
			var target:MovieClip = e.target as MovieClip;
			
			target.stopDrag();
		}
	}
}
