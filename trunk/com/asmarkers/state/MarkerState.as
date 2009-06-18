package com.asmarkers.state
{
	import com.asmarkers.core.Marker;
	import com.asmarkers.error.AbstractClassError;
	
	import flash.events.EventDispatcher;
	
	public class MarkerState
	{
		protected var _marker:Marker;
		
		public function MarkerState(marker:Marker)
		{
			_marker = marker;
		}
	}
}