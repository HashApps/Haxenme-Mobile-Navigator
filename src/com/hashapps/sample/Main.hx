package com.hashapps.sample;

import com.hashapps.sample.view.View1;
import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import com.hashapps.navigator.MobileNavigator;

/**
 * ...
 * @author HashApps
 */

class Main extends Sprite 
{
	
	public function new() 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) 
	{
		var nav = new MobileNavigator(View1);
		addChild(nav);
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
