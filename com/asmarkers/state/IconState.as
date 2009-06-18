package com.asmarkers.state
{
	import com.asmarkers.core.Marker;
	import com.asmarkers.event.MarkerEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class IconState extends MarkerState
	{
		public function IconState(marker:Marker)
		{
			super(marker);
			_marker.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, false);
			dispatchEvent(new MarkerEvent(_marker, MarkerEvent.STATE_CHANGE));
		}
		
		private function mouseOverHandler(evt:Event):void
		{
			_marker.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			_marker.changeState(StateFactory.create("tooltip", _marker));
		}
	}
}