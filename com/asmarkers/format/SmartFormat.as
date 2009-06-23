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
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.rpc.soap.LoadEvent;
	
    public class SmartFormat extends MarkerFormat
    {
    	
    	protected var _text:TextField;
    	protected var _media:Loader;
    	
    	protected var _maxWidth:Number;
    	protected var _maxHeight:Number;
    	protected var _padding:Number;
    	protected var _mediaPadding:Number;
    	
    	public function SmartFormat()
    	{
    		super();
    		_text = new TextField;
            _text.defaultTextFormat = new TextFormat('Arial', 10, 0xFFFFFF, true, null, null, null, '_blank');;
            _text.mouseEnabled = false;
            _text.selectable = false;
            
    		addChild(_text);
    	}
    	
    	override public function configure(cfg:Object):void
    	{
    		super.configure(cfg);
    		
    		_maxWidth = cfg.maxWidth;
    		_maxHeight = cfg.maxHeight;
    		
    		_padding = cfg.padding ? cfg.padding : 2;
    		_mediaPadding = cfg.mediaPadding ? cfg.mediaPadding : 5;
    		
    		loadContent();
    	}
    	
		override public function draw(minX:Number, minY:Number, maxX:Number, maxY:Number):void
		{
			// Adjust position
			_text.x = minX + _padding;
            _text.y = minY + _padding;
            
            if(_media.visible){
	            _media.x = maxX - _media.content.width - _padding - _mediaPadding;
				_media.y = minY + _padding + _mediaPadding;
				_media.height = maxY - minY - 2 * (_padding + _mediaPadding);
				
				_text.width = _media.x - _mediaPadding;
				
            } else {
            	_text.width = maxX - _padding;
            }
			_text.height = maxY - minY - 2 * _padding;
			
		}
		
		override public function changeState(state:MarkerState):void
		{
			if(_data != null){

				var data:SmartData = _data as SmartData;
				_media.visible = false;
				
				if(state is IconState){
					_text.text = data.id;
					
	        	} else if (state is TooltipState){
	        		_text.text = data.tooltip;
	        		
	        	} else if (state is DetailState){
	        		_text.text = data.detail;
	        		_media.visible = true;
	        	}
	        	
	        	adjustSize();
	  		}
		}
		
		private function adjustSize():void
		{
			_width = _text.textWidth + 4 + _padding * 2;
			_height = _text.textHeight + 4 + _padding * 2;
			
			// Adjust size to media
			if(_media && _media.visible){
				_width = _width + _media.content.width + 2 * _mediaPadding;
				
				var mh:Number = _media.content.height + 2 * _mediaPadding;
				_height = _height > mh ? _height : mh;
			} 
			
			// Adjust to the limits
            if(!isNaN(_maxWidth) && _maxWidth < width - _padding){
				_width = _maxWidth;            	
            }
            
            if(!isNaN(_maxHeight) && _maxHeight < height - _padding){
				_height = _maxHeight;            	
            }
		}
		
		private function loadContent():void
		{
			var data:SmartData = _data as SmartData;
    		if(data.media != null && data.media != ""){
    			try{
					_media = new Loader();
		    		_media.load(new URLRequest(data.media));
					_media.mouseEnabled = false;
					_media.mouseChildren = false;
		    		addChild(_media);
		    	} catch(e:Error){
		    		_media = null;
		    	}
    		}
		}
		
    }
}
