/*
 * AbstractMarker.as
 *
 * ASMarkers base class
 * It provides an abstraction over real markers that can be used
 * to interact with other projects and/or libraries
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    17/06/2009
 *      
 */

package com.asmarkers.core
{
	import flash.display.Sprite;
	
    public class AbstractMarker extends Sprite
    {
        public function AbstractMarker()
        {
            throw new Error("Cannot instantiate abstract class");
        }
    }
}
