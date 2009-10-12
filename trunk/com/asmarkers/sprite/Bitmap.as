package com.asmarkers.sprite
{
    import com.asmarkers.state.MarkerState;
    import com.asmarkers.state.IIconState;
    
    import flash.display.Bitmap;
    import flash.geom.Point; 
    
    public class Bitmap extends Bubble
    {
        protected var _offset:Point;
        protected var _image:flash.display.Bitmap;
        protected var _anchorX:Number;
        protected var _anchorY:Number;
        protected var _bubbleMargin:Number;
        protected var _showBubble:Boolean = false;
        
        override public function configure(config:Object):void
        {
            super.configure(config);
                
            // Safe initialization
            var cfg:Object = config ? config : {};
            
            _offset = cfg.offset ? cfg.offset : new Point(0,0);
            _image = cfg.image ? cfg.image : new flash.display.Bitmap();
            _bubbleMargin = cfg.bubbleMargin ? cfg.bubbleMargin : 5;
            
            _image.x = _offset.x * -1; 
            _image.y = _offset.y * -1;
            addChild(_image);
        }
        
        override public function draw():void
        {
        	graphics.clear();
        	
        	if(_width > 10 && _height > 10){
	        	
	        	// Marker
	        	_anchorX = (_image.width + _image.x) / 2;
	        	_anchorY = _image.y - _bubbleMargin;
	        	
	            // Set marker content bbox
	            _left = _anchorX - _width / 2;
	            _bottom = _anchorY - _tailHeight;
	            _right = _anchorX + _width / 2;
	            _top = _anchorY - _height - _tailHeight;
	            
	            with(graphics){
	
	                // Set bubble style
	                lineStyle(_borderWidth, _borderColor, _borderAlpha); 
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
	         }
        }
        
        /*override public function changeState(state:MarkerState):void
        {
        	if(state is IIconState){
        		_showBubble = false;
        	} else {
        		_showBubble = true;
        	}
        		
            _format.changeState(state);
        }*/
        
    }
}

