/*
 * MarkerSprite.as
 *
 * Sprite base class
 * Defines the methods that must be implemented by child clases
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
    import com.asmarkers.error.AbstractClassError;
    
    import flash.display.Sprite;
    
    public class MarkerSprite extends Sprite
    {
    	public function configure(config:Object):void
    	{
    		throw new AbstractClassError("MarkerSprite");
    	}
    	
        public function draw():void
        {
        	throw new AbstractClassError("MarkerSprite");
        }
    }
}
