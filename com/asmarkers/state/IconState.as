/*
 * IconState.as
 *
 * 
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
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class IconState extends MarkerState
	{
		public function IconState(marker:Marker)
		{
			super(marker);
			_marker.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, false);
		}
		
		private function mouseOverHandler(evt:Event):void
		{
			_marker.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			_marker.changeState(MarkerState.TOOLTIP);
		}
	}
}