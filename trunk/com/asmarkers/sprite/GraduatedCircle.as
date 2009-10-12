package com.asmarkers.sprite
{
    import com.asmarkers.state.IIconState;
    import com.asmarkers.state.MarkerState;
    
    import flash.utils.setTimeout;
    import flash.utils.clearTimeout;
    
    public class GraduatedCircle extends Bubble
    {
        protected var _radius:Number;
        protected var _anchorX:Number;
        protected var _anchorY:Number;
        
        override public function configure(config:Object):void
        {
            super.configure(config);
            var cfg:Object = config ? config : {};
            _radius = cfg.radius ? cfg.radius : 10;
        }
        
        override public function draw():void
        {
        	graphics.clear();
        	
        	with(graphics){
        		if(_borderWidth){
	            	lineStyle(_borderWidth, _borderColor, _borderAlpha);
	         	}
	                
        		// Draw circle
                beginFill(_backgroundColor, _backgroundAlpha);
                drawCircle(0, 0, _radius);
                endFill();
    		}
        	
        }
        
    }
}

