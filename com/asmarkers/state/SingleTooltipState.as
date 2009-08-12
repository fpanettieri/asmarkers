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
    
    public class SingleTooltipState extends MarkerState
    {
        public function SingleTooltipState(marker:Marker)
        {
            super(marker);
            _marker.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, true);
            _marker.addEventListener(MouseEvent.CLICK, clickHandler, false, 0, true);
        }
        
        private function mouseOutHandler(evt:Event):void
        {
            removeEventListeners();
            _marker.changeState(MarkerState.SINGLE_ICON);
        }
        
        private function clickHandler(evt:Event):void
        {
            removeEventListeners();
			_marker.dispatchEvent(new MarkerEvent(_marker, MarkerState.SINGLE_TOOLTIP, MarkerEvent.CLICK));
            _marker.changeState(MarkerState.SINGLE_DETAIL);
        }
        
        private function removeEventListeners():void
        {
            _marker.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
            _marker.removeEventListener(MouseEvent.CLICK, clickHandler);    
        }
    }
}

