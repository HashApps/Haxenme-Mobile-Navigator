package com.hashapps.navigator.events;
import com.hashapps.navigator.View;
import nme.events.Event;

/**
 * ...
 * @author HashApps
 */

class ViewNavigatorEvent extends Event
{
	public static inline var  VIEW_CHANGING:String = "viewChanging";
	public static inline var  VIEW_ACTIVATED:String = "viewActivated";

	public var action:String;

	public var oldView:View;

	public var newView:View;
		
	public function new(type:String, action:String, oldView:View, newView:View, bubbles:Bool=false, cancelable:Bool=true) 
	{
			super(type, bubbles, cancelable);

			this.action = action;
			this.oldView = oldView;
			this.newView = newView;
	}
	
	override public function clone():Event
	{
		return new ViewNavigatorEvent(type, action, oldView, newView, bubbles, cancelable);
	}
}