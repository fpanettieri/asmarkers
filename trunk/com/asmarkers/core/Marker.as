/*
 * Marker.as
 *
 * Marker implementation
 * 
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
    import com.asmarkers.event.MarkerEvent;
    import com.asmarkers.sprite.MarkerSprite;
    import com.asmarkers.sprite.SpriteFactory;
    import com.asmarkers.state.MarkerState;
    import com.asmarkers.state.StateFactory;
    
    public class Marker extends AbstractMarker
    {
        protected var _state:MarkerState;
        protected var _sprite:MarkerSprite;
        
        public function Marker()
        {
        	configure();
        }
        
        public function configure(config:Object = null):void
        {
        	// Safe configuration initialization
        	var cfg:Object = config ? config : {};
        	
        	// Add the marker to the configuration
        	cfg.marker = this;
        	
            _sprite = SpriteFactory.create(cfg.sprite ? cfg.sprite : "squared");
            _sprite.configure(cfg);
            addChild(_sprite);
        	
        	// Set default state
        	changeState(StateFactory.create(cfg.state ? cfg.state : "icon", this));
        }
        
        public function changeState(state:MarkerState):void
        {
        	_state = state;
        	dispatchEvent(new MarkerEvent(this, MarkerEvent.STATE_CHANGE));
        }
        
        public function get state():MarkerState
        {
			return _state;
        }
                        
    }
}
