/**
 * PlainFormat.as
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
 *     Default: 2
 * 
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
    import com.asmarkers.state.IDetailState;
    import com.asmarkers.state.IIconState;
    import com.asmarkers.state.IToolTipState;
    import com.asmarkers.state.MarkerState;
    
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    public class PlainFormatter extends TextFormatter
    {
        protected var _text:TextField;
        
        protected var _maxWidth:Number;
        protected var _maxHeight:Number;
        protected var _minWidth:Number;
        protected var _minHeight:Number;
        
        protected var _padding:Number;
        
        public function PlainFormatter()
        {
            super();
            _text = new TextField;
            _text.selectable = false;
            _text.mouseEnabled = false;
            _text.width = 0;
            _text.height = 0;
            addChild(_text);
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
            
            _padding = cfg.padding ? cfg.padding : 2;
            
            _text.defaultTextFormat = new TextFormat(_fontFamily, _fontSize, _fontColor, _bold, _italic, _underline);
        }
        
        override public function draw(left:Number, bottom:Number, right:Number, top:Number):void
        {
            _text.x = left + _padding;
            _text.y = top + _padding;
            
            _text.width =  right - left - 2 * _padding;
            _text.height = bottom - top - 2 * _padding;
        }
        
        override public function changeState(state:MarkerState):void
        {
            if(_data != null){
                var data:Object = _data as Object;
                
                if(state is IIconState){
                   	_text.text = data.hasOwnProperty("id") ? data.id : "";
                } else if (state is IToolTipState){
                    _text.text = data.hasOwnProperty("tooltip") ? data.tooltip : "";
                } else if (state is IDetailState){
                    _text.text = data.hasOwnProperty("detail") ? data.detail : "";
                }
                
                adjustSize();
              }
        }
        
        private function adjustSize():void
        {
            _width = _text.textWidth + 4 + _padding * 2;
            _height = _text.textHeight + 4 + _padding * 2;
            
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
        
    }
}

