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
    
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    public class SingleDetailState extends MarkerState
    {
    	private var _active_marker:Marker = null; 
    	
        public function SingleDetailState(marker:Marker)
        {
            super(marker);
            
            // Only one marker can be in detail state
            if(_active_marker != null && _active_marker != marker){
            	_active_marker.changeState(MarkerState.SINGLE_ICON);
            }
            _active_marker = marker;
            
            _marker.addEventListener(MouseEvent.CLICK, mouseClickHandler, false, 0, true);
        }
        
        public function mouseClickHandler(evt:Event):void
        {
            _marker.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
            _marker.changeState(MarkerState.SINGLE_ICON);
        }

    }
}

