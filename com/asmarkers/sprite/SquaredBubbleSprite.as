/*
 * SquaredSprite.as
 *
 * A simple bubble marker
 * 
 * Configurable attributes
 *
 * bgColor
 *     Background color in hexagesimal format
 *     Ex.: 0xF17A26
 *
 * bgAlpha
 *     Background transparency, between 0 and 1
 *     Ex.: 0.6
 *
 * fgColor
 *     Foreground color in hexagesimal format
 *     Ex.: 0xB0E9E9
 *     
 * bgAlpha
 *     Foreground transparency, between 0 and 1
 *     Ex.: 0.6
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    17/06/2009
 *      
 */
 
package com.asmarkers.sprite
{
    import com.asmarkers.event.FormatterEvent;
    import com.asmarkers.state.MarkerState;
    import com.eclecticdesignstudio.utils.tween.GTweener;
    
    import flash.events.Event;
    
    public class SquaredBubbleSprite extends MarkerSprite
    {
        protected var _width:Number;
    	protected var _height:Number;
    	
    	protected var _borderColor:uint;
    	protected var _borderAlpha:Number;
    	protected var _borderWidth:Number;
    	
    	protected var _backgroundColor:uint;
    	protected var _backgroundAlpha:Number;
    	
    	// Used to indicate the contet where should it be placed
    	protected var _tailWidth:Number;
    	protected var _tailHeight:Number;
    	
    	protected var _minX:Number;
    	protected var _minY:Number;
    	protected var _maxX:Number;
    	protected var _maxY:Number;
    	
    	// Tween duration
    	private var _tweenDuration:Number;
    	
    	override public function configure(cfg:Object):void
    	{
    		super.configure(cfg);
    		
    		_width = cfg.width ? cfg.width : 20;
    		_height = cfg.height ? cfg.height : 20;
    		
    		_tailWidth = cfg.tailWidth ? cfg.tailWidth : 5;
    		_tailHeight = cfg.tailHeight ? cfg.tailHeight : 8;
    		
    		_borderColor = cfg.borderColor ? cfg.borderColor : 0xFFFFFF;
    		_borderAlpha = cfg.borderAlpha ? cfg.borderAlpha : 1;
    		_borderWidth = cfg.borderWidth ? cfg.borderWidth : 1;
    		
    		_backgroundColor = cfg.backgroundColor ? cfg.backgroundColor : 0xF17A26;
    		_backgroundAlpha = cfg.backgroundAlpha ? cfg.backgroundAlpha : 1;
    		
    		_tweenDuration = cfg.tweenDuration ? cfg.tweenDuration : 0.5;
    		
    		// Events
    		_format.addEventListener(FormatterEvent.RESIZE, onFormatterResize, false, 0, false);
    	}
        
        override public function draw():void
        {
        	// Set marker content bbox
        	_minX = 0;
        	_minY = -_height - _tailHeight;
        	_maxX = _width;  
        	_maxY = -_tailHeight;
        	
            with(this.graphics){
                clear();
                
                lineStyle(_borderWidth, _borderColor, _borderAlpha); 
                beginFill(_backgroundColor, _backgroundAlpha);
                
                lineTo(_minX, _minY);
                lineTo(_maxX, _minY);
                lineTo(_maxX, _maxY);
                lineTo(_tailWidth,_maxY);
                
                endFill();
            }
        	
            _format.draw(_minX, _minY, _maxX, _maxY);
        }
        
        public function resize(width:Number, height:Number):void
        {
        	GTweener.removeTweens(this);
			GTweener.addTween(this, _tweenDuration, { width: width, height: height }, {changeListener: changeHandler, completeListener: changeHandler} );
        }

        override public function set width(width:Number):void
        {
        	_width = width;
        }
        
        override public function get width():Number
        {
        	return _width;
        }
        
        override  public function set height(height:Number):void
        {
        	_height = height;
        }
        
        override  public function get height():Number
        {
        	return _height;
        }

        private function onFormatterResize(evt:FormatterEvent):void
        {
        	resize(_format.width, _format.height);
        }
        
        override public function changeState(state:MarkerState):void
		{
			_format.changeState(state);
		}
        
        private function changeHandler(evt:Event):void
        {
        	draw();
        }
        
    }
}
