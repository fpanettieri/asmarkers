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
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
    public class SmartFormat extends MarkerFormat
    {
    	
    	protected var _text:TextField;
    	protected var _image:Loader;
    	
    	protected var _minWidth:Number;
    	protected var _minHeight:Number;
    	protected var _maxWidth:Number;
    	protected var _maxHeight:Number;
    	
    	protected var _horizontalGap:Number;
    	
    	protected var _padding:Number;
    	protected var _imagePadding:Number;
    	
    	public function SmartFormat()
    	{
    		super();
    		_text = new TextField;
            _text.defaultTextFormat = new TextFormat('Arial', 10, 0xFFFFFF, true, null, null, null, '_blank');;
            _text.selectable = false;
            _text.mouseEnabled = false;
    		addChild(_text);
    	}
    	
    	override public function configure(cfg:Object):void
    	{
    		super.configure(cfg);
    		
    		_maxWidth = cfg.maxWidth;
    		_maxHeight = cfg.maxHeight;
    		
    		_minWidth = cfg.minWidth;
    		_minHeight = cfg.minHeight;
    		
    		_padding = cfg.padding ? cfg.padding : 2;
    		_horizontalGap = cfg.horizontalGap ? cfg.horizontalGap : 10;
    		_imagePadding = cfg.imagePadding ? cfg.imagePadding : 5;
    		
    		loadContent();
    	}
    	
		override public function draw(minX:Number, minY:Number, maxX:Number, maxY:Number):void
		{
			// Adjust position
			_text.x = minX + _padding;
            _text.y = minY + _padding;
            
            if(_image && _image.visible && _image.content){
	            _image.x = maxX - _image.content.width - _padding - _imagePadding;
				_image.y = minY + _padding + _imagePadding;
				
				// Get current scale
				var scale:Number = (maxY - minY - 2 * (_padding + _imagePadding)) / _image.content.height;
				if(scale < 0.2){
					scale = 0;
				}
				_image.scaleX = scale;
				_image.scaleY = scale;	
				
				_text.width = _image.x - _imagePadding - _horizontalGap;
				
            } else {
            	_text.width = maxX - _padding;
            }
            
            _text.height = maxY - minY - 2 * _padding;
			
		}
		
		override public function changeState(state:MarkerState):void
		{
			if(_data != null){

				var data:SmartData = _data as SmartData;
				_image.visible = false;
				
				if(state is IconState){
					_text.text = data.id;
					
	        	} else if (state is TooltipState){
	        		_text.text = data.tooltip;
	        		
	        	} else if (state is DetailState){
	        		_text.text = data.detail;
	        		_image.visible = true;
	        	}
	        	
	        	adjustSize();
	  		}
		}
		
		private function adjustSize():void
		{
			_width = _text.textWidth + 4 + _padding * 2;
			_height = _text.textHeight + 4 + _padding * 2;
			
			// Adjust size to media
			if(_image.visible && _image.content){
				_width = _width + _image.content.width + 2 * _imagePadding + _horizontalGap;
				
				var mh:Number = _image.content.height + 2 * _imagePadding;
				_height = _height > mh ? _height : mh;
			} 
			
			// Adjusting width
            if(!isNaN(_maxWidth) && _maxWidth < _width - 2 * _padding){
				_width = _maxWidth;
				            	
            } else if(!isNaN(_minWidth) && _minWidth > _width ){
            	_width = _minWidth;
            }
            
            // Adjusting height
            if(!isNaN(_maxHeight) && _maxHeight < _height - 2 * _padding){
				_height = _maxHeight;
				
            } else if(!isNaN(_minHeight) && _minHeight > _height) {
            	_height = _minHeight;
            }
		}
		
		private function loadContent():void
		{
			var data:SmartData = _data as SmartData;
    		if(data.media != null && data.media != ""){
    			_image = new Loader();
	    		_image.load(new URLRequest(data.media));
    			addChild(_image);
    		}
		}
		
		private function scaleImage(scale:Number):void
		{
			
		}
		
    }
}
