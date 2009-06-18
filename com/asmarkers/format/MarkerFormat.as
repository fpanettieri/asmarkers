/*
 * MarkerFormat.as
 *
 * The responsability of this class is to 
 * handle the display of marker data on screen
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
	import com.asmarkers.data.MarkerData;
	import com.asmarkers.error.AbstractClassError;
	import com.asmarkers.state.MarkerState;
	
    public class MarkerFormat
    {
    	public static const PLAIN:String = "plain";
    	public static const HORIZONTAL:String = "horizontal";
    	public static const VERTICAL:String = "vertical";
    	public static const SMART:String = "smart";
    	
    	protected var _data:MarkerData;
    	protected var _width:Number;
    	protected var _height:Number;
    	
    	public function MarkerFormat()
    	{
    		_width = 20;
    		_height = 20;
    	}
    	
    	public function configure(cfg:Object):void
		{
			_data = cfg.data ? cfg.data : null;
		}
    	
		public function draw():void
		{
			throw new AbstractClassError("MarkerFormat");
		}
		
		public function changeState(state:MarkerState):void
		{
			throw new AbstractClassError("MarkerFormat");
		}
		
		public function get width():Number
		{
			return _width;
		}
		
		public function get height():Number
		{
			return _height;
		}
    }
}
