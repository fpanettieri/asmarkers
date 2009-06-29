/*
 * FormatFactory.as
 *
 * Implementation of the factory method pattern
 * http://en.wikipedia.org/wiki/Factory_method_pattern
 * 
 * Used to create DataFormatter subclasses
 * New classes should be added to the factory
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    23/06/2009
 *      
 */
 
package com.asmarkers.format
{
    import com.asmarkers.error.UnknownTypeError;
    
    public class FormatterFactory
    {
        public static function create(type:String):DataFormatter
        {
            var format:DataFormatter;
            
            var t:String = type.toLowerCase();
            if(t == DataFormatter.PLAIN){
                format = new PlainFormatter();
                
            } else if(t == DataFormatter.SMART){
                format = new SmartFormatter();
                
            } else {
                throw new UnknownTypeError(type);
            }
            
            return format;
        }
    }
}

