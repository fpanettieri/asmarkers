package com.sni.maphlex.markers.bubble
{
	import com.eclecticdesignstudio.utils.tween.GTweener;
	
	import flash.events.Event;
	
	public class BubbleMarkerState
	{
		protected var _marker:BubbleMarker;
				
		public function BubbleMarkerState(marker:BubbleMarker)
		{
			_marker = marker;
			GTweener.removeTweens (_marker.sprite);
		}
		
		public function draw(e:Event = null):void
		{
			// Implement on child class
		}
		
		public function mouseOver():void
		{
			// Implement on child class
		}
		
		public function mouseOut():void
		{
			// Implement on child class
		}
		
		public function click():void
		{
			// Implement on child class
		}

	}
}