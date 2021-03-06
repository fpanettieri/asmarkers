package com.asmarkers.sprite
{
    import com.asmarkers.event.FormatterEvent;
    import com.asmarkers.state.MarkerState;
    import com.eclecticdesignstudio.utils.tween.GTweener;
    
    import flash.events.Event;
    
    public class Bubble extends MarkerSprite
    {
    	protected var _left:Number;
    	protected var _bottom:Number;
    	protected var _right:Number;
    	protected var _top:Number;
    	
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
        
        // Tween duration
        protected var _tweenDuration:Number;
        
        override public function configure(config:Object):void
        {
            super.configure(config);
                
            // Safe initialization
            var cfg:Object = config ? config : {};
            
            _width = cfg.width ? cfg.width : 20;
            _height = cfg.height ? cfg.height : 20;
            
            _tailWidth = cfg.tailWidth ? cfg.tailWidth : 5;
            _tailHeight = cfg.tailHeight ? cfg.tailHeight : 8;
            
            _borderColor = cfg.borderColor != null ? cfg.borderColor : 0x000000;
            _borderAlpha = cfg.borderAlpha != null ? cfg.borderAlpha : 1;
            _borderWidth = cfg.borderWidth != null ? cfg.borderWidth : 1;
            
            _backgroundColor = cfg.backgroundColor != null ? cfg.backgroundColor : 0xF17A26;
            _backgroundAlpha = cfg.backgroundAlpha != null ? cfg.backgroundAlpha : 1;
            
            _tweenDuration = cfg.tweenDuration != null ? cfg.tweenDuration : 0.5;
            
            // Events
            _format.addEventListener(FormatterEvent.RESIZE, onFormatterResize, false, 0, false);
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

        protected function onFormatterResize(evt:FormatterEvent):void
        {
            resize(_format.width, _format.height);
        }
        
        override public function changeState(state:MarkerState):void
        {
            _format.changeState(state);
        }
        
        protected function changeHandler(evt:Event):void
        {
            draw();
        }
        
    }
}

