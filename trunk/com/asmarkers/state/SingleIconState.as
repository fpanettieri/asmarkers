/**
 * IconState.as
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
    
    public class SingleIconState extends MarkerState implements IIconState
    {
        public function SingleIconState(marker:Marker)
        {
            super(marker);
            _marker.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, true);
        }
        
        private function mouseOverHandler(evt:Event):void
        {
            _marker.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
            _marker.changeState(MarkerState.SINGLE_TOOLTIP);
        }
    }
}

