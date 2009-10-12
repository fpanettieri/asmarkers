package com.asmarkers.sprite
{
    import com.asmarkers.event.FormatterEvent;
    import com.asmarkers.state.MarkerState;
    import com.eclecticdesignstudio.utils.tween.GTweener;
    
    import flash.events.Event;
    
    public class Squared extends Bubble
    {
        override public function draw():void
        {
            // Set marker content bbox
            _left = 0;
            _top = -_height - _tailHeight;
            _right = _width;  
            _bottom = -_tailHeight;
            
            with(this.graphics){
                clear();
                
                lineStyle(_borderWidth, _borderColor, _borderAlpha); 
                beginFill(_backgroundColor, _backgroundAlpha);
                
                lineTo(_left, _top);
                lineTo(_right, _top);
                lineTo(_right, _bottom);
                lineTo(_tailWidth, _bottom);
                
                endFill();
            }
            
            _format.draw(_left, _bottom, _right, _top);
        }
    }
}

