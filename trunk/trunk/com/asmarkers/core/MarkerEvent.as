/*
 * BubbleMarkerEvent.as
 *
 * Author: 
 *    Fabio R. Panettieri
 *    fpanettieri@gisworking.com
 *
 * Copyright (c) 2008 Spatial Networks, Inc.
 * All Rights Reserved
 *
 */

package com.asmarkers.core
{
	import flash.events.Event;
	
	public class MarkerEvent extends Event
	{
		public static const MOUSE_OVER:String = 'mouseOverEvent';
		public static const MOUSE_OUT:String = 'mouseOutEvent';
		public static const CLICK:String = 'clickEvent';
		
		public var state:String;
		
		public function MarkerEvent(marker:AbstractMarker, type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.state = state; 
		}
		
	}
}