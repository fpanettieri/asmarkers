/**
 * SquaredSprite.as
 *
 * A marker that displays an image in the icon state
 *
 *
 * Configurable attributes
 *
 * width
 *     Number
 *     Marker initial width
 *     Default: 20
 *
 * height
 *     Number
 *     Marker initial height
 *     Default: 20
 *
 * tailWidth
 *     Number
 *     Indicates the width of the marker tail
 *     Default: 5
 *
 * tailHeight
 *     Number
 *     Indicates the height of the marker tail
 *     Default: 8
 *
 * backgroundColor
 *     uint
 *     Background color in hexagesimal format
 *     Default: 0xF17A26
 *
 * backgroundAlpha
 *     Number
 *     Background transparency, between 0 and 1
 *     Default: 1
 *
 * borderColor
 *     uint
 *     Border color in hexagesimal format
 *     Default.: 0xFFFFFF
 *
 * borderAlpha
 *     Number
 *     Border transparency, between 0 and 1
 *     Default: 1
 *
 * borderWidth
 *     Number
 *     Used to determine how thick the line will be
 *     Default: 1
 *
 * tweenDuration
 *     Number
 *     Indicates how much long should the transition effect be
 *     Default: 0.5
 *
 * offset
 *     Point
 *     Indicates how should be the image displaced
 *     Default: new Pixel(0,0)
 *
 * image
 *     Bitmap
 *     The image that should be displayed
 *     Default: Emtpy image
 *
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    04/08/2009
 *
 */

package com.asmarkers.sprite
{
    import com.asmarkers.state.IIconState;
    import com.asmarkers.state.MarkerState;
    
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout; 
    
    public class CircleBubbleSprite extends BubbleSprite
    {
        protected var _radius:Number;
        protected var _anchorX:Number;
        protected var _anchorY:Number;
        protected var _bubbleMargin:Number;
        protected var _showBubble:Boolean = false;
        
        private var _timeout:uint;
        
        override public function configure(config:Object):void
        {
            super.configure(config);
                
            // Safe initialization
            var cfg:Object = config ? config : {};
            
            _radius = cfg.radius ? cfg.radius : 10;
            _bubbleMargin = cfg.bubbleMargin ? cfg.bubbleMargin : 5;
        }
        
        override public function draw():void
        {
        	graphics.clear();
        	
        	with(graphics){
        		// Set bubble style
	            lineStyle(_borderWidth, _borderColor, _borderAlpha);
	                
        		// Draw circle
                beginFill(_backgroundColor, _backgroundAlpha);
                drawCircle(0, 0, _radius);
                endFill();
    		}
        	
        	if(_showBubble){
        	
	        	// Marker
	        	_anchorX = 0;
	        	_anchorY = -_radius - _bubbleMargin;
	        	
	            // Set marker content bbox
	            _left = _anchorX - _width / 2;
	            _bottom = _anchorY - _tailHeight;
	            _right = _anchorX + _width / 2;
	            _top = _anchorY - _height - _tailHeight;
	            
	            with(graphics){

	                // Set bubble style
	                lineStyle(_borderWidth, _borderColor, _borderAlpha); 
	                
	                // Draw bubble
	                beginFill(_backgroundColor, _backgroundAlpha);
	                moveTo(_left, _bottom);
					lineTo(_left, _top);
					
					lineTo(_right, _top);
					lineTo(_right, _bottom);
					
					lineTo(_anchorX + _tailWidth / 2, _bottom);
					lineTo(_anchorX, _anchorY);
					lineTo(_anchorX - _tailWidth / 2, _bottom);
	                
	                endFill();
	            }
	            
	            _format.draw(_left, _bottom, _right, _top);
	            
	            // Avoid bug on fast state changes
	            _timeout = setTimeout(function():void{_format.visible = true}, 150);
	        } else {
	        	_format.visible = false;
	        	if(_timeout){
	        		clearTimeout(_timeout);
	        		_timeout = NaN;
	        	}
	        }
        }
        
        override public function changeState(state:MarkerState):void
        {
        	if(state is IIconState){
        		_showBubble = false;
        	} else {
        		_showBubble = true;
        	}
        		
            _format.changeState(state);
        }
        
    }
}

