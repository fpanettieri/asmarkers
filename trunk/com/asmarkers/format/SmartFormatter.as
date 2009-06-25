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
	import com.asmarkers.event.FormatterEvent;
	import com.asmarkers.state.DetailState;
	import com.asmarkers.state.IconState;
	import com.asmarkers.state.MarkerState;
	import com.asmarkers.state.TooltipState;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
    public class SmartFormatter extends TextFormatter
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
    	
    	protected var _imageLoaded:Boolean;
    	
    	public function SmartFormatter()
    	{
    		super();
    		_text = new TextField;
            _text.selectable = false;
            _text.mouseEnabled = false;
            _text.width = 0;
            _text.height = 0;
    		addChild(_text);
    		
    		_image = new Loader();
    		_image.width = 0;
    		_image.height = 0;
    		_image.mouseEnabled = false;
    		_image.mouseChildren = false;
    		_imageLoaded = false;
    		addChild(_image);
    		
    		configureListeners(_image.contentLoaderInfo);
    	}
    	
    	override public function configure(cfg:Object):void
    	{
    		super.configure(cfg);
    		
    		_maxWidth = cfg.maxWidth;
    		_maxHeight = cfg.maxHeight;
    		
    		_minWidth = cfg.minWidth;
    		_minHeight = cfg.minHeight;
    		
    		_text.defaultTextFormat = new TextFormat(_fontFamily, _fontSize, _fontColor, _bold, _italic, _underline);
    		
    		_padding = cfg.padding ? cfg.padding : 4;
    		_horizontalGap = cfg.horizontalGap ? cfg.horizontalGap : 10;
    		_imagePadding = cfg.imagePadding ? cfg.imagePadding : 5;
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
	        		loadImage();
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
				
				var imgh:Number = _image.content.height + 2 * (_imagePadding + _padding);
				_height = _height > imgh ? _height : imgh;
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
            
            dispatchEvent(new FormatterEvent(FormatterEvent.RESIZE));
		}
		
		private function loadImage():void
		{
			var data:SmartData = _data as SmartData;
    		if(!_imageLoaded && data.media != null && data.media != ""){
	    		_image.load(new URLRequest(data.media));
    		}
		}
		
		private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, completeHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            dispatcher.addEventListener(Event.UNLOAD, unLoadHandler);
        }

        private function completeHandler(event:Event):void {
        	_imageLoaded = true;
        	adjustSize();
        }

        private function ioErrorHandler(event:IOErrorEvent):void {
            _imageLoaded = false;
        	adjustSize();
        }

        private function unLoadHandler(event:Event):void {
        	_imageLoaded = false;
        	adjustSize();
        }
		
    }
}
