/**
 * SquaredSprite.as
 *
 * A marker that displays an image in the icon state
 *
 * 
 * Configurable attributes
 *
 * width
 *     Number
 *     Marker initial width 
 *     Default: 20 
 * 
 * height
 *     Number
 *     Marker initial height 
 *     Default: 20
 * 
 * tailWidth
 *     Number
 *     Indicates the width of the marker tail  
 *     Default: 5
 * 
 * tailHeight
 *     Number
 *     Indicates the height of the marker tail  
 *     Default: 8
 * 
 * backgroundColor
 *     uint
 *     Background color in hexagesimal format
 *     Default: 0xF17A26
 *
 * backgroundAlpha
 *     Number
 *     Background transparency, between 0 and 1
 *     Default: 1
 *
 * borderColor
 *     uint
 *     Border color in hexagesimal format
 *     Default.: 0xFFFFFF
 *     
 * borderAlpha
 *     Number
 *     Border transparency, between 0 and 1
 *     Default: 1
 * 
 * borderWidth
 *     Number
 *     Used to determine how thick the line will be
 *     Default: 1
 * 
 * tweenDuration
 *     Number
 *     Indicates how much long should the transition effect be
 *     Default: 0.5
 * 
 * offset
 *     Point
 *     Indicates how should be the image displaced
 *     Default: new Pixel(0,0) 
 * 
 * image
 *     Bitmap
 *     The image that should be displayed
 *     Default: Emtpy image
 * 
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    04/08/2009
 *      
 */
 
package com.asmarkers.sprite
{
    import com.asmarkers.event.FormatterEvent;
    import com.asmarkers.state.MarkerState;
    import com.asmarkers.util.Util;
    import com.eclecticdesignstudio.utils.tween.GTweener;
    
    import flash.events.Event;
    import flash.display.Bitmap;
    import flash.geom.Point; 
    
    public class BitmapSprite extends MarkerSprite
    {
        protected var _offset:Point;
        protected var _image:Bitmap;
        
        override public function configure(config:Object):void
        {
            super.configure(config);
                
            // Safe initialization
            var cfg:Object = config ? config : {};
            
            _offset = cfg.offset ? cfg.offset : new Point(0,0);
            _image = cfg.image ? cfg.image : new Bitmap();
        }
        
        override public function draw():void
        {
        	
            // Set marker content bbox
            _minX = 0;
            _minY = -_height - _tailHeight;
            _maxX = _width;  
            _maxY = -_tailHeight;
            
            with(this.graphics){
            	
                clear();
                
                lineStyle(_borderWidth, _borderColor, _borderAlpha); 
                beginFill(_backgroundColor, _backgroundAlpha);
                
                lineTo(_minX, _minY);
                lineTo(_maxX, _minY);
                lineTo(_maxX, _maxY);
                lineTo(_tailWidth,_maxY);
                
                endFill();
            }
            
            _format.draw(_minX, _minY, _maxX, _maxY);
        }
        
    }
}

