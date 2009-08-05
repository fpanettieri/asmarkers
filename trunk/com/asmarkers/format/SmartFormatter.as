/**
 * SmartFormat.as
 *
 * This class attemp to display the data in 
 * a way similar to Yahoo smart markers
 * 
 * Configuration parameters
 * 
 * minWidth
 *     Number
 *     Minimum valid width
 * 
 * minHeight
 *     Number
 *     Minimum valid height
 * 
 * maxWidth
 *     Number
 *     Maximum valid width
 * 
 * maxHeight
 *     Number
 *     Maximum valid height
 *
 * padding
 *     Number
 *     In pixels, how much space should be left in each side of the marker
 *     Default: 4
 * 
 * horizontalGap
 *     Number
 *     In pixels, space between the image and the marker text
 *     Default: 10
 * 
 * imagePadding
 *     Number
 *     A special padding, used only in the image
 *     Default: 5
 * 
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    22/06/2009
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
        
        override public function configure(config:Object):void
        {
            super.configure(config);

            // Safe initialization           
            var cfg:Object = config ? config : {}; 
            
            _maxWidth = cfg.maxWidth;
            _maxHeight = cfg.maxHeight;
            
            _minWidth = cfg.minWidth;
            _minHeight = cfg.minHeight;
            
            _text.defaultTextFormat = new TextFormat(_fontFamily, _fontSize, _fontColor, _bold, _italic, _underline);
            
            _padding = cfg.padding ? cfg.padding : 4;
            _horizontalGap = cfg.horizontalGap ? cfg.horizontalGap : 10;
            _imagePadding = cfg.imagePadding ? cfg.imagePadding : 5;
        }
        
        override public function draw(left:Number, bottom:Number, right:Number, top:Number):void
        {
            // Adjust position
            _text.x = left + _padding;
            _text.y = top + _padding;
            
            if(_image && _image.visible && _image.content){
                _image.x = right - _image.content.width - _padding - _imagePadding;
                _image.y = top + _padding + _imagePadding;
                
                // Get current scale
                var scale:Number = (bottom - top - 2 * (_padding + _imagePadding)) / _image.content.height;
                if(scale < 0.2){
                    scale = 0;
                }
                _image.scaleX = scale;
                _image.scaleY = scale;
                
                _text.width = _image.x - _imagePadding - _horizontalGap;
                
            } else {
                _text.width = right - left - 2 * _padding;
            }
            
            _text.height = bottom - top - 2 * _padding;
            
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
