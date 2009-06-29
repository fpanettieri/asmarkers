/*
 * DataFormatter.as
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
    
    import flash.display.Sprite;
    
    public class DataFormatter extends Sprite
    {
        public static const PLAIN:String = "plain";
        public static const SMART:String = "smart";
        
        protected var _data:MarkerData;
        protected var _width:Number;
        protected var _height:Number;
        
        public function DataFormatter()
        {
            _width = 0;
            _height = 0;
        }
        
        public function configure(cfg:Object):void
        {
            _data = cfg.data ? cfg.data : null;
        }
        
        public function draw(minX:Number, minY:Number, width:Number, height:Number):void
        {
            throw new AbstractClassError("DataFormatter");
        }
        
        public function changeState(state:MarkerState):void
        {
            throw new AbstractClassError("DataFormatter");
        }
        
        override public function get width():Number
        {
            return _width;
        }
        
        override public function get height():Number
        {
            return _height;
        }
    }
}

