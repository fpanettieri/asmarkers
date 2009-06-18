/*
 * StateFactory.as
 *
 * Implementation of the factory method pattern
 * http://en.wikipedia.org/wiki/Factory_method_pattern
 * 
 * Used to create MarkerState subclasses
 * New classes should be added to the factory
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    18/06/2009
 *      
 */
 
package com.asmarkers.state
{
	import com.asmarkers.core.Marker;
	import com.asmarkers.error.UnknownTypeError;
	
    public class StateFactory
    {
	   	public static function create(type:String, marker:Marker):MarkerState
    	{
    		var state:MarkerState;
    		
			var t:String = type.toLowerCase();
			if(t == "icon"){
				state = new IconState(marker);
				
			} else if(t == "detail"){
				state = new DetailState(marker);
				
			} else if(t == "tooltip"){
				state = new TooltipState(marker);
				
			} else {
				throw new UnknownTypeError(type);
			}
			
			return state;
    	}
    }
}
