
```
<?xml version="1.0" encoding="utf-8"?>
<mx:Application 
	xmlns:mx="http://www.adobe.com/2006/mxml" 
	layout="absolute" 
	xmlns:flex="com.modestmaps.flex.*"
	width="100%" height="100%"
	creationComplete="onCreationComplete()">
	
<mx:Script>
<![CDATA[
    import com.asmarkers.format.MarkerFormatter;
    import com.asmarkers.data.MarkerData;
    import com.asmarkers.data.SmartData;
    import com.asmarkers.core.Marker;
    import com.modestmaps.geo.Location;
		
    private function onCreationComplete():void
    {
        // Create the marker
        var marker:Marker = new Marker();
		
        // Data associated to the marker
        var data:MarkerData = new SmartData(
            '100',	                        // Id
            'This is my first marker!',         // Tooltip
            'Content\ngoes here\nif you like',  // Detail
            'img/osm_logo.png'                  // Image
        );

        // Now tell the marker some specific configuration
        marker.configure({
            data:data,                         // Marker data
            format: MarkerFormatter.SMART,     // How should be the data displayed
            backgroundColor: 0x5271E7,         // 
            fontColor: xE0E0E0,                // These three are easy
            fontSize: 12                       //
        });
        flexMap.map.putMarker(new Location(0,0), marker);	
    }
]]>
</mx:Script>

    <flex:MapComponent id="flexMap" provider="OPEN_STREET_MAP" width="100%" height="100%"/>
</mx:Application>
```