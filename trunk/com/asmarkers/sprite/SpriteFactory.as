/*
 * SpriteFactory.as
 *
 * Implementation of the factory method pattern
 * http://en.wikipedia.org/wiki/Factory_method_pattern
 * 
 * Used to create MarkerSprite subclasses
 * New classes should be added to the factory
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    17/06/2009
 *      
 */
 
package com.asmarkers.sprite
{
	import com.asmarkers.error.UnknownTypeError;
	
    public class SpriteFactory
    {
	   	public static function create(type:String):MarkerSprite
    	{
    		var sprite:MarkerSprite;
    		
			var t:String = type.toLowerCase();
			if(t == MarkerSprite.SQUARED_BUBBLE){
				sprite = new SquaredBubbleSprite();
				
			} else {
				throw new UnknownTypeError(type);
			}
			
			return sprite;
    	}
    }
}
