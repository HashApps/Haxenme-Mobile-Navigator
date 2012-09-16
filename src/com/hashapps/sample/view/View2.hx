package com.hashapps.sample.view;
import com.hashapps.navigator.events.ViewNavigatorEvent;
import com.hashapps.navigator.View;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.text.TextField;
import nme.text.TextFormat;

/**
 * ...
 * @author HashApps
 */

class View2 extends View
{

	public function new() 
	{
		super();
		
		var label = new TextField();
		var tf = new TextFormat();
		tf.size = 40;
		
		label.text = "View 2";
		label.setTextFormat(tf , 0, label.text.length);
		
		addChild(label);
		
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(ViewNavigatorEvent.VIEW_ACTIVATED, onActivate);
	}
	
	private function onActivate(e:ViewNavigatorEvent):Void 
	{
		trace("view 2 activated");
	}
	
	private function onClick(e:MouseEvent):Void 
	{
		trace("clicked");
		popView();
	}
}