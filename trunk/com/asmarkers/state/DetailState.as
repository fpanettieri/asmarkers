/*
 * DetailState.as
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    18/06/2009
 *      
 */
 
package com.asmarkers.state
{
	import com.asmarkers.core.Marker;
	import com.asmarkers.event.MarkerEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class DetailState extends MarkerState
	{
		public function DetailState(marker:Marker)
		{
			super(marker);
			_marker.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, false);
		}
		
		public function mouseOutHandler(evt:Event):void
		{
			_marker.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			_marker.changeState(MarkerState.ICON);
		}

	}
}