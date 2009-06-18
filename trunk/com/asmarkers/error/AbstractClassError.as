/*
 * AbstractClassError.as
 *
 * This error is thrown when you try to make an instance 
 * of an abstract class
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
	public class AbstractClassError extends Error
	{
		public function AbstractClassError(message:String) 
		{
			super("Cannot instantiate abstract class: " + message);
		}
	}
}