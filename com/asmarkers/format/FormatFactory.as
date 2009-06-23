/*
 * FormatFactory.as
 *
 * Implementation of the factory method pattern
 * http://en.wikipedia.org/wiki/Factory_method_pattern
 * 
 * Used to create MarkerFormat subclasses
 * New classes should be added to the factory
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    23/06/2009
 *      
 */
 
package com.asmarkers.format
{
	import com.asmarkers.error.UnknownTypeError;
	
    public class FormatFactory
    {
	   	public static function create(type:String):MarkerFormat
    	{
    		var format:MarkerFormat;
    		
			var t:String = type.toLowerCase();
			if(t == MarkerFormat.PLAIN){
				format = new PlainFormat();
				
			} else if(t == MarkerFormat.SMART){
				format = new SmartFormat();
				
			} else {
				throw new UnknownTypeError(type);
			}
			
			return format;
    	}
    }
}
