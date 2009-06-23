/*
 * SmartData.as
 *
 * This class holds all the information needed
 * in a "smart marker" as the ones used on Yahoo maps
 *
 * It has 4 attributes
 *
 *   id
 *     unique identifier of the marker
 *   
 *   title
 *     Short description of the data represented byt he marker
 *     
 *   content
 *     Preview of the data asociated with that marker
 *
 *   image (Optional)
 *     An thumbnail image related to that marker
 * 
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    18/06/2009
 *      
 */

package com.asmarkers.data
{
	import flash.utils.ByteArray;
	
    public class SmartData extends MarkerData
    {
    	public var id:String;
    	public var tooltip:String;
    	public var detail:String;
		public var media:String;
		
		public function SmartData(id:String, tooltip:String, detail:String, media:String=null)
		{
			this.id = id;
			this.tooltip = tooltip;
			this.detail = detail;
			this.media = media; 	
		}
    }
}
