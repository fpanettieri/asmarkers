/*
 * FormatterEvent.as
 *
 * Author: 
 *    Fabio R. Panettieri
 *    fpanettieri@gisworking.com
 *
 * Copyright (c) 2008 Spatial Networks, Inc.
 * All Rights Reserved
 *
 */

package com.asmarkers.event
{
	import com.asmarkers.core.Marker;
	
	import flash.events.Event;
	
	public class FormatterEvent extends Event
	{
		public static const RESIZE:String = 'resizeEvent';
		
		public function FormatterEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}