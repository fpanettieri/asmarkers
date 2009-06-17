package com.sni.maphlex.markers.bubble
{
	import com.eclecticdesignstudio.utils.tween.GTweener;
	
	import flash.events.Event;
	
	public class TooltipState extends BubbleMarkerState
	{
		public function TooltipState(marker:BubbleMarker)
		{
			super(marker);
			GTweener.addTween (_marker, 0.5, { width: _marker.openWidth, height: _marker.closedHeight }, {changeListener: draw} );
		}
		
		override public function draw(e:Event=null):void
		{	
			_marker.idField.text = "Tooltip";
			_marker.idField.width = _marker.width - 6;
            _marker.idField.height = _marker.height - 6;
            
            _marker.idField.x = 6;
            _marker.idField.y = (-_marker.height) - 6;
		}
		
		override public function mouseOut():void
		{
			_marker.state = new IconState(_marker);
		}
		
		override public function click():void
		{
			_marker.state = new DetailState(_marker);
		}

	}
}