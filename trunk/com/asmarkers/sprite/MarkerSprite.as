/**
 * MarkerSprite.as
 *
 * Sprite base class
 * Defines the methods that must be implemented by child clases
 * 
 * format
 *     String
 *     Used to determine which format should be used
 *     Default: DataFormatter.SMART
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
    import com.asmarkers.format.FormatterFactory;
    import com.asmarkers.format.DataFormatter;
    import com.asmarkers.state.MarkerState;
    
    import flash.display.Sprite;
    
    public class MarkerSprite extends Sprite
    {
        public static const SQUARED_BUBBLE:String = "squared bubble";
        
        protected var _format:DataFormatter;
        
        public function configure(config:Object):void
        {
            // Safe initialization
            var cfg:Object = config ? config : {};

            if(_format == null){
                _format = FormatterFactory.create(cfg.format ? cfg.format : DataFormatter.SMART);
                _format.configure(cfg);
                _format.mouseEnabled = false;
                _format.mouseChildren = false;
                addChild(_format);
            }
        }
        
        public function draw():void
        {
            throw new AbstractClassError("MarkerSprite");
        }
        
        public function changeState(state:MarkerState):void
        {
            throw new AbstractClassError("MarkerSprite");
        }
    }
}

