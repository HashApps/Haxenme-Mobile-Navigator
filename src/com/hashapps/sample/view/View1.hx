package com.hashapps.sample.view;
import com.hashapps.navigator.View;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.text.TextField;
import nme.text.TextFieldType;
import nme.text.TextFormat;
import com.hashapps.navigator.events.ViewNavigatorEvent;

/**
 * ...
 * @author HashApps
 */

class View1 extends View
{

	public function new() 
	{
		super();
		
		var label = new TextField();
		var tf = new TextFormat();
		tf.size = 40;
		
		label.text = "View 1";
		label.setTextFormat(tf , 0, label.text.length);
		
		label.selectable = false;
		
		addChild(label);
		
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(ViewNavigatorEvent.VIEW_ACTIVATED, onActivate);
	}
	
	private function onActivate(e:ViewNavigatorEvent):Void 
	{
		trace("view 1 activated");
	}
	
	private function onClick(e:MouseEvent):Void 
	{
		trace("clicked");
		navigator.pushView(View2);
	}
	
}