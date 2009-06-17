package com.sni.maphlex.markers.bubble
{
	import com.eclecticdesignstudio.utils.tween.GTweener;
	
	import flash.events.Event;
	
	public class IconState extends BubbleMarkerState
	{
		public function IconState(marker:BubbleMarker)
		{
			super(marker);
			GTweener.addTween (_marker, 0.5, { width: _marker.closedWidth, height: _marker.closedHeight }, {changeListener: draw} );
		}
				
		override public function draw(e:Event = null):void
		{
			_marker.idField.text = "8";
			_marker.idField.width = _marker.width - 6;
            _marker.idField.height = _marker.height - 6;
            
            _marker.idField.x = 6;
            _marker.idField.y = (-_marker.height) - 6;
		}
		
		override public function mouseOver():void
		{
			_marker.state = new TooltipState(_marker);
		}
	}
}