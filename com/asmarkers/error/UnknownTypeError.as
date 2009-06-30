/**
 * UnknownTypeError.as
 *
 * This error is thrown when you ask a factory
 * an unknown type
 *
 * Author:
 *    Fabio R. Panettieri
 *    frenzo.panettieri@gmail.com
 *
 * Date:
 *    17/06/2009
 *
 */

package com.asmarkers.error
{
    public class UnknownTypeError extends Error
    {
        public function UnknownTypeError(message:String) 
        {
            super("Unknown type: " + message);
        }
    }
}

