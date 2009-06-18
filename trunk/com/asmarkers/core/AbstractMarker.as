/*
 * AbstractMarker.as
 *
 * ASMarkers base class
 * It provides an abstraction over real markers that can be used
 * to interact with other projects
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
    public class AbstractMarker
    {
        public function AbstractMarker()
        {
            throw new Error("Cannot instantiate abstract class");
        }
    }
}
