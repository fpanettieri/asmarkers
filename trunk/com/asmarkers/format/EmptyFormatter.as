package com.asmarkers.format
{
	import com.asmarkers.event.FormatterEvent;
	import com.asmarkers.state.MarkerState;
	
    public class EmptyFormatter extends DataFormatter
    {
        override public function draw(minX:Number, minY:Number, width:Number, height:Number):void {}
        override public function changeState(state:MarkerState):void 
        {
        	dispatchEvent(new FormatterEvent(FormatterEvent.RESIZE));
        }
    }
}

