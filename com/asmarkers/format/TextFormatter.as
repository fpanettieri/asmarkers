/**
 * TextFormat.as
 *
 * Parent class of formats that have text
 *
 * Configuration parameters
 * 
 * font
 *   String
 *   The name of a font for text as a string.
 *   Default: Arial
 *
 * fontSize
 *   Number 
 *   A number that indicates the point size.
 *   Default: 10
 * 
 * fontColor
 *   uint
 *   The color of text using this text format. 
 *   A number containing three 8-bit RGB components; 
 *   Ex.: 0xFF0000 is red, 0x00FF00 is green.
 *   Default: 0xFFFFFF
 *
 * bold
 *   Boolean
 *   Boldface text 
 *   Default: false
 * 
 * italic
 *   Boolean
 *   Italicized.text 
 *   Default: false
 *
 * underline
 *   Boolean
 *   Underlined text
 *   Default: false
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
    import com.asmarkers.error.AbstractClassError;
    import com.asmarkers.state.MarkerState;
    
    public class TextFormatter extends DataFormatter
    {
        protected var _fontFamily:String;
        protected var _fontSize:Number;
        protected var _fontColor:uint;
        protected var _bold:Boolean;
        protected var _italic:Boolean;
        protected var _underline:Boolean;
        
        override public function configure(config:Object):void
        {
            super.configure(config);
            
            // Safe initialization
            var cfg:Object = config ? config : {};

            _fontFamily = cfg.fontFamily ? cfg.fontFamily : "Arial"; 
            _fontSize = cfg.fontSize != null ? cfg.fontSize : 10;
            _fontColor = cfg.fontColor != null ? cfg.fontColor : 0xFFFFFF; 
            _bold = cfg.bold ? cfg.bold : false; 
            _italic = cfg.italic ? cfg.italic : false;
            _underline = cfg.underline ? cfg.underline : false; 
        }
    }
}

