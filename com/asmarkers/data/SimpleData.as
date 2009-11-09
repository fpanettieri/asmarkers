/**
 * SimpleData.as
 *
 * This class holds all the information needed
 * in a "smart marker" as the ones used on Yahoo maps
 *
 * It has 1 attributes
 *
 *   text
 *     String
 *     some title for the marker
 *   
 * Author:
 *    Luis A. Floreani
 *    lucholaf@gmail.com
 *
 * Date:
 *    9/11/2009
 *      
 */

package com.asmarkers.data
{
    public class SimpleData extends MarkerData
    {
        public var tooltip:String;
        
        public function SimpleData(text:String)
        {
            this.tooltip = text;
        }
    }
}

