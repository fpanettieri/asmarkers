/**
 * TooltipState.as
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
    
    public class TooltipState extends MarkerState
    {
        public function TooltipState(marker:Marker)
        {
            super(marker);
            _marker.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, false);
            _marker.addEventListener(MouseEvent.CLICK, clickHandler, false, 0, false);
        }
        
        private function mouseOutHandler(evt:Event):void
        {
            removeEventListeners();
            _marker.changeState(MarkerState.ICON);
        }
        
        private function clickHandler(evt:Event):void
        {
            removeEventListeners();
			_marker.dispatchEvent(new MarkerEvent(_marker, MarkerState.TOOLTIP, MarkerEvent.CLICK));
            _marker.changeState(MarkerState.DETAIL);
        }
        
        private function removeEventListeners():void
        {
            _marker.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
            _marker.removeEventListener(MouseEvent.CLICK, clickHandler);    
        }
    }
}

