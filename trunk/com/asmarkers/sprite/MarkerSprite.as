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

package com.sni.maphlex.markers.bubble
{
    import flash.display.Sprite;
    import flash.utils.Dictionary;
    
    public class MarkerSprite extends Sprite
    {
    	public function configure(config:Object):void
    	{
    		throw new AbstractError("MarkerSprite");
    	}
    	
        public function draw():void
        {
        	throw new AbstractError("MarkerSprite");
        }
    }
}
