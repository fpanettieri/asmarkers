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
    import com.asmarkers.sprite.MarkerSprite;
    import com.asmarkers.sprite.SpriteFactory;
    import com.asmarkers.state.MarkerState;
    import com.asmarkers.state.StateFactory;
    
    public class Marker extends AbstractMarker
    {
        protected var _state:MarkerState;
        protected var _sprite:MarkerSprite;
        
        public function configure(config:Object):void
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
        	draw();
        }
        
        public function changeState(state:MarkerState):void
        {
        	_state = state;
        }
        
        override public function set height(height:Number):void
        {
        	_sprite.height = height;
        }
        
        override public function get height():Number
        {
			return _sprite.height;        	
        }
        
        override public function set width(width:Number):void
        {
        	_sprite.width = width;
        }
        
        override public function get width():Number
        {
			return _sprite.width;        	
        }
        
        public function get state():MarkerState
        {
			return _state;
        }
        
        protected function draw():void
        {
        	_sprite.draw();
        }
                        
    }
}
