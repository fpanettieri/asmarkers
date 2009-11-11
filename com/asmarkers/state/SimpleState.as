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

    
    public class SimpleState extends MarkerState implements IIconState
    {
        public function SimpleState(marker:Marker)
        {
            super(marker);
        }
    }
}

