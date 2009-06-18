/*
 * Marker.as
 *
 * Marker implementation
 * It provides an abstraction over real markers that can be used
 * to interact with other libraries
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
    import com.asmarkers.sprite.SpriteFactory;
    
    import flash.events.MouseEvent;
    
    public class Marker extends AbstractMarker
    {
        public var state:BubbleMarkerState;
        public var sprite:BubbleSprite;
        
        public function Marker()
        {
        	/* Bind events */
            addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
        	addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
        	addEventListener(MouseEvent.CLICK, click);
        }
        
        public function configure(config:Object):void
        {
            sprite = SpriteFactory.create(config.sprite ? config.sprite : "squared");
            sprite.configure(config);
            addChild(sprite);
        	
        	/* set default state */
        	state = new IconState(this);
        	draw();
        }
        
        public function set textFormat(textFormat:TextFormat):void
        {
        	_textFormat = textFormat; 
        	idField.setTextFormat(_textFormat);
        }
        
        override public function set height(height:Number):void
        {
        	sprite.height = height;
        }
        
        override public function get height():Number
        {
			return sprite.height;        	
        }
        
        override public function set width(width:Number):void
        {
        	sprite.width = width;
        }
        
        override public function get width():Number
        {
			return sprite.width;        	
        }
        
        protected function draw():void
        {
        	sprite.draw();
        }
        
        protected function mouseOver(event:MouseEvent):void
        {
        	state.mouseOver();
        }
        
        protected function mouseOut(event:MouseEvent):void
        {
        	state.mouseOut();
        }
        
        protected function click(event:MouseEvent):void
        {
        	state.click();
        }
                
    }
}
