package com.sni.maphlex.markers.bubble
{
	import com.eclecticdesignstudio.utils.tween.GTweener;
	
	import flash.events.Event;
	
	public class DetailState extends BubbleMarkerState
	{
		public function DetailState(marker:BubbleMarker)
		{
			super(marker);
			GTweener.addTween (_marker, 0.5, { width: _marker.openWidth, height: _marker.openHeight }, {changeListener: draw} );
		}
		
		override public function draw(e:Event = null):void
		{
			_marker.idField.text = "Detailwq 2r lib24ñ 24htg24hg24hg4o202hg0g248gh42p9gh42p9gp9gb2p9gb24p9gb24gbñ24gb24gb24gb24gb2g\nr3hn3p9hg35p9n35hp93n39phn\ng429hg23p94gb24g9pb42g\ng2p49gb24p9gb942g";
            _marker.idField.width = _marker.width - 12;
            _marker.idField.height = _marker.height - 12;
            
            _marker.idField.x = 6;
            _marker.idField.y = (-_marker.height) - 6;
		}
		
		override public function mouseOut():void
		{
			_marker.state = new IconState(_marker);
		}

	}
}