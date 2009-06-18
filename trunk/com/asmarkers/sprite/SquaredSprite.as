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
    import com.asmarkers.event.MarkerEvent;
    import com.asmarkers.state.DetailState;
    import com.asmarkers.state.IconState;
    import com.asmarkers.state.MarkerState;
    import com.asmarkers.state.TooltipState;
    import com.eclecticdesignstudio.utils.tween.GTweener;
    
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    import mx.controls.Alert;
    
    public class SquaredSprite extends MarkerSprite
    {
        protected var _width:Number;
    	protected var _height:Number;
    	
    	protected var bgColor:uint;
    	protected var bgAlpha:Number;
    	
    	protected var fgColor:uint;
    	protected var fgAlpha:Number;
    	
    	override public function configure(cfg:Object):void
    	{
    		super.configure(cfg);
    		_width = cfg.width ? cfg.width : 20;
    		_height = cfg.height ? cfg.height : 20;
    		
    		bgColor = cfg.bgColor ? cfg.bgColor : 0xFFFFFF;
    		bgAlpha = cfg.bgAlpha ? cfg.bgAlpha : 1;
    		
    		fgColor = cfg.fgColor ? cfg.fgColor : 0xF17A26;
    		fgAlpha = cfg.fgAlpha ? cfg.fgAlpha : 1; 
    		
    		cfg.marker.addEventListener(MarkerEvent.STATE_CHANGE, stateChangeHandler, false, 0, false);
    		draw();
    	}
        
        override public function draw():void
        {
            with(graphics){
                clear();
                
                /******** BACKGROUND **********/
                beginFill(bgColor, bgAlpha);
                moveTo(0,0);
                lineTo(0,-_height-8);
                lineTo(_width,-_height-8);
                lineTo(_width,-8);
                lineTo(5,-8);
                lineTo(0,0);
                endFill();
				/******** BACKGROUND **********/
				
				/******** FOREGROUND **********/
				beginFill(fgColor, fgAlpha);
				moveTo(1,-3);
				lineTo(1,-_height-7);
                lineTo(_width-1,-_height-7);
                lineTo(_width-1,-9);
                lineTo(4,-9);
                lineTo(1,-3);
                endFill();
                /******** FOREGROUND **********/
            }
        }

        override public function set width(width:Number):void
        {
        	_width = width;
        	draw();
        }
        
        override public function get width():Number
        {
        	return _width;
        }
        
        override  public function set height(height:Number):void
        {
        	_height = height;
        	draw();
        }
        
        override  public function get height():Number
        {
        	return _height;
        }
        
        private function stateChangeHandler(evt:MarkerEvent):void
        {
        	GTweener.removeTweens (this);
        	var state:MarkerState = evt.marker.state;

			// Notify state change to data formatter
        	_format.changeState(state);
        	
        	// Create tween efect
			GTweener.addTween (this, 0.5, { width: _format.width, height: _format.height }, {changeListener: changeHandler} );
        }
        
        private function changeHandler(evt:Event):void
        {
        	draw();
        	_format.draw();
        }
        
    }
}
