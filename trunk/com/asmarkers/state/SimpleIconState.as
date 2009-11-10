/**
 * SimpleIconState.as
 *
 * Author:
 *    Luis A. Floreani
 *    lucholaf@gmail.com
 *
 * Date:
 *    9/11/2009
 *      
 */

package com.asmarkers.state
{
    import com.asmarkers.core.Marker;
    import com.asmarkers.event.MarkerEvent;

    import flash.events.Event;
    import flash.events.MouseEvent;

    
    public class SimpleIconState extends MarkerState implements IIconState
    {
        public function SimpleIconState(marker:Marker)
        {
            super(marker);
            _marker.addEventListener(MouseEvent.CLICK, mouseClickHandler, false, 0, true);
        }
        
        private function mouseClickHandler(evt:Event):void
        {
            _marker.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
            _marker.dispatchEvent(new MarkerEvent(_marker, MarkerState.SIMPLE_ICON, MarkerEvent.CLICK));
        }
    }
}

