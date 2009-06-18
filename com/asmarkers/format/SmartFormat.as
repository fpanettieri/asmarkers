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
	import com.asmarkers.state.DetailState;
	import com.asmarkers.state.IconState;
	import com.asmarkers.state.MarkerState;
	import com.asmarkers.state.TooltipState;
	
    public class SmartFormat extends MarkerFormat
    {
    	override public function configure(cfg:Object):void
    	{
    		super.configure(cfg);
    	}
    	
		override public function draw():void
		{
			
		}
		
		override public function changeState(state:MarkerState):void
		{
			if(state is IconState){
        		_width = 20;
        		_height = 20;
        	} else if (state is TooltipState){
        		_width = 150;
        		_height = 20;
        	} else if (state is DetailState){
        		_width = 150;
        		_height = 200;
        	}
		}
    }
}
