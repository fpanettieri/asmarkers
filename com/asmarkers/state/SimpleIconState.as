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
    
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    public class SimpleIconState extends MarkerState implements IIconState
    {
        public function SimpleIconState(marker:Marker)
        {
            super(marker);
            _marker.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, true);
        }
        
        private function mouseOverHandler(evt:Event):void
        {
            _marker.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
            _marker.changeState(MarkerState.SIMPLE_TOOLTIP);
        }
    }
}

