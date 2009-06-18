/*
 * Marker.as
 *
 * ASMarkers main class
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    17/06/2009
 *      
 */
 
package com.asmarkers.core
{
    import com.asmarkers.data.MarkerData;
    import com.asmarkers.event.MarkerEvent;
    
    import com.asmarkers.sprite.MarkerSprite;
    import com.asmarkers.sprite.SpriteFactory;
    
    import com.asmarkers.state.MarkerState;
    import com.asmarkers.state.StateFactory;
    
    public class Marker extends AbstractMarker
    {
        protected var _state:MarkerState;
        protected var _sprite:MarkerSprite;
        protected var _data:MarkerData;
        
        public function Marker(config:Object = null)
        {
        	configure(config);
        }
        
        public function configure(config:Object = null):void
        {
        	// Safe configuration initialization
        	var cfg:Object = config ? config : {};
        	
        	// Add the marker to the configuration
        	cfg.marker = this;
        	
            _sprite = SpriteFactory.create(cfg.sprite ? cfg.sprite : MarkerSprite.SQUARED_BUBBLE);
            _sprite.configure(cfg);
            addChild(_sprite);
        	
        	// Set default state
        	changeState(cfg.state ? cfg.state : MarkerState.ICON);
        }
        
        public function changeState(state:String):void
        {
        	_state = StateFactory.create(state, this);
        	dispatchEvent(new MarkerEvent(this, MarkerEvent.STATE_CHANGE));
        }
        
        public function get state():MarkerState
        {
			return _state;
        }
                        
    }
}
