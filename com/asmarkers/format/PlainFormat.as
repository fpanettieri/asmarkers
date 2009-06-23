/*
 * SmartFormat.as
 *
 * This class attemp to display the data in 
 * a way similar to Yahoo smart markers
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    18/06/2009
 *      
 */

package com.asmarkers.format
{
	import com.asmarkers.data.SmartData;
	import com.asmarkers.state.DetailState;
	import com.asmarkers.state.IconState;
	import com.asmarkers.state.MarkerState;
	import com.asmarkers.state.TooltipState;
	
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
    public class PlainFormat extends MarkerFormat
    {
    	
    	protected var _text:TextField;
    	
    	protected var _maxWidth:Number;
    	protected var _maxHeight:Number;
    	protected var _padding:Number;
    	
    	public function PlainFormat()
    	{
    		super();
    		_text = new TextField;
            _text.defaultTextFormat = new TextFormat('Arial', 10, 0xFFFFFF, true, null, null, null, '_blank');
            _text.selectable = false;
            _text.mouseEnabled = false;
    		addChild(_text);
    	}
    	
    	override public function configure(cfg:Object):void
    	{
    		super.configure(cfg);
    		
    		_maxWidth = cfg.maxWidth;
    		_maxHeight = cfg.maxHeight;
    		
    		_padding = cfg.padding ? cfg.padding : 2;
    	}
    	
		override public function draw(minX:Number, minY:Number, maxX:Number, maxY:Number):void
		{
			_text.x = minX + _padding;
            _text.y = minY + _padding;
            
			_text.width =  maxX - minX - 2 * _padding;
			_text.height = maxY - minY - 2 * _padding;
		}
		
		override public function changeState(state:MarkerState):void
		{
			if(_data != null){
				var data:SmartData = _data as SmartData;
				
				if(state is IconState){
					_text.text = data.id;
	        	} else if (state is TooltipState){
	        		_text.text = data.tooltip;
	        	} else if (state is DetailState){
	        		_text.text = data.detail;
	        	}
	        	
	        	adjustSize();
	  		}
		}
		
		private function adjustSize():void
		{
			_width = _text.textWidth + 4 + _padding * 2;
			_height = _text.textHeight + 4 + _padding * 2;
			
            if(!isNaN(_maxWidth) && _maxWidth < width - _padding){
				_width = _maxWidth;            	
            }
            
            if(!isNaN(_maxHeight) && _maxHeight < height - _padding){
				_height = _maxHeight;            	
            }
		}
		
    }
}
