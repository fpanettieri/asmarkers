/**
 * Marker.as
 *
 * ASMarkers main class
 *
 * Configuration parameters
 *
 * sprite
 *     String
 *     Used to determine which sprite should be used
 *     Default: MarkerSprite.SQUARED_BUBBLE
 * 
 * state
 *     String
 *     Used to determine which state should be used to initialize the marker
 *     Default: MarkerState.ICON
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
        
        public function configure(config:Object = null):void
        {
            // Safe configuration initialization
            var cfg:Object = config ? config : {};
            
            // Add the marker to the configuration
            cfg.marker = this;
            
            _sprite = SpriteFactory.create(cfg.sprite ? cfg.sprite : MarkerSprite.CIRCLE);
            _sprite.configure(cfg);
            addChild(_sprite);
            
            // Set default state
            changeState(cfg.state ? cfg.state : MarkerState.ICON);
        }
        
        public function changeState(state:String):void
        {
            _state = StateFactory.create(state, this);
            _sprite.changeState(_state);
            dispatchEvent(new MarkerEvent(this, state, MarkerEvent.STATE_CHANGE));
        }
        
        public function get state():MarkerState
        {
            return _state;
        }
        
        public function get sprite():MarkerSprite
        {
            return _sprite;
        }
                        
    }
}

