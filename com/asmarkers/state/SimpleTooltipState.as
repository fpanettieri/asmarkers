/**
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
    
    public class SimpleTooltipState extends MarkerState implements IToolTipState
    {
        public function SimpleTooltipState(marker:Marker)
        {
            super(marker);
            
            _marker.addEventListener(MouseEvent.CLICK, mouseClickHandler, false, 0, true);
            _marker.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, true);
        }
        
        public function mouseClickHandler(evt:Event):void
        {
            _marker.dispatchEvent(new MarkerEvent(_marker, MarkerState.SIMPLE_TOOLTIP, MarkerEvent.CLICK));
        }

        private function mouseOutHandler(evt:Event):void
        {
            _marker.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
            _marker.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
            _marker.changeState(MarkerState.SIMPLE_ICON);
        }

    }
}

