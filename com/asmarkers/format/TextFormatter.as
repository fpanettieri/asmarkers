/*
 * TextFormat.as
 *
 * Parent class of formats that have text
 *
 * Parameters
 * 
 * font 
 *   The name of a font for text as a string.
 *
 * size 
 *   A number that indicates the point size.
 * 
 * color 
 *   The color of text using this text format. 
 *   A number containing three 8-bit RGB components; 
 *   Ex.: 0xFF0000 is red, 0x00FF00 is green.
 *
 * bold
 *   A Boolean value that indicates whether the text is boldface.
 * 
 * italic
 *   A Boolean value that indicates whether the text is italicized.
 *
 * underline
 *   A Boolean value that indicates whether the text is underlined.
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
	
    public class TextFormatter extends MarkerFormatter
    {
    	protected var _fontFamily:String;
    	protected var _fontSize:Number;
    	protected var _fontColor:uint;
    	protected var _bold:Boolean;
    	protected var _italic:Boolean;
    	protected var _underline:Boolean;
    	
    	override public function configure(cfg:Object):void
		{
			super.configure(cfg);
    		_fontFamily = cfg.fontFamily ? cfg.fontFamily : "Arial"; 
    		_fontSize = cfg.fontSize ? cfg.fontSize : 10;
    		_fontColor = cfg.fontColor ? cfg.fontColor : 0xFFFFFF; 
    		_bold = cfg.bold ? cfg.bold : false; 
    		_italic = cfg.italic ? cfg.italic : false; 
		}
    }
}
