package com.hashapps.navigator;
import com.hashapps.navigator.events.ViewNavigatorEvent;
import com.hashapps.navigator.transitions.ViewSlideTransition;
import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import com.eclecticdesignstudio.motion.Actuate;
import com.eclecticdesignstudio.motion.easing.Elastic;

/**
 * ...
 * @author HashApps
 */

class MobileNavigator extends Sprite
{
	private var _w:Float;
	private var _h:Float;
	
	private var views:Array<View>;
	
	private var _firstView:Dynamic;
	
	private var _defaultTransition:IViewTransition;
	
	private var _poppedViewReturnedObject:Dynamic;
	
	
	public function new(firstView:Dynamic) 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
		this._firstView = firstView;
		
		_defaultTransition = new ViewSlideTransition(this);
	}
	
	private function init(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		_w = Lib.stage.stageWidth;
		_h = Lib.stage.stageHeight;
		
		var newView = cast( Type.createInstance(_firstView, []), View);
		newView.width = _w;
		newView.height = _h;
		newView.navigator = this;
		
		addChild(newView);
		newView.dispatchEvent(new ViewNavigatorEvent(ViewNavigatorEvent.VIEW_ACTIVATED, ViewNavigatorAction.NONE, null, newView));
		
		views = new Array<View>();
		views.push(newView);
		
	}
	
	public function pushView(view:Dynamic, context:Dynamic = null, transition:IViewTransition = null)
	{
		
		
		var oldView = views[views.length - 1];
		var newView = cast( Type.createInstance(view, []), View);
		views.push(newView);

		newView.width = _w;
		newView.height = _h;
		newView.navigator = this;
		newView.context = context;
		
		//addChild(newView);
		
		
		applyTransition(transition != null ? transition : _defaultTransition, oldView, newView, ViewNavigatorAction.PUSH);
		
		
		dispatchEvent(new ViewNavigatorEvent(ViewNavigatorEvent.VIEW_CHANGING, ViewNavigatorAction.PUSH, oldView, newView));
		
	}
	
	public function popView(transition:IViewTransition = null):Void 
	{
		if (views.length < 2)
			return;

		var oldView = views[views.length - 1];
		
		var newView = views[views.length - 2];
		newView.width = _w;
		newView.height = _h;
		newView.navigator = this;
		
		pop(oldView, newView, transition);
		
	}
	
	private function pop(hideView:View, showView:View, transition:IViewTransition = null):Void
	{
		views.pop();

		// Getting popped view return object
		_poppedViewReturnedObject = hideView.viewReturnObject;


		// Applying transition
		applyTransition(transition != null ? transition : _defaultTransition, hideView, showView, ViewNavigatorAction.POP);


		// Destroying hidden view reference
		if (hideView != null && hideView.destructionPolicy == ViewDestructionPolicy.AUTO)
		{
			hideView.navigator = null;
			hideView = null;
		}
		
		dispatchEvent(new ViewNavigatorEvent(ViewNavigatorEvent.VIEW_CHANGING, ViewNavigatorAction.PUSH, hideView, showView));
	}
	
	public function popToFirstView(transition:IViewTransition = null):View
	{
		if (views.length > 1)
		{
			var hideView:View = views[views.length -1];

			var showView:View = views[0];

			//if (!_parent.dispatchEvent(new ViewNavigatorEvent(ViewNavigatorEvent.VIEW_CHANGING, ViewNavigatorAction.POP_TO_FIRST, hideView, showView)))
			//	return null;

			// Removing views except the bottom and the top one
			if (views.length > 2)
				views.splice(1, views.length - 2);

			// Poping top view to have nice transition
			pop(hideView, showView, transition);

			return hideView;
		}
		return null;
	}
	
	private function applyTransition(transition:IViewTransition, hideView:View, showView:View, action:String):Void
	{
		transition.play(hideView, showView, action);
	}
		
	public function get_width():Float 
	{
		return _w;
	}
	
	
	public function get_height():Float 
	{
		return _h;
	}
	
	private function get_poppedViewReturnedObject():Dynamic 
	{
		return _poppedViewReturnedObject;
	}
	
	private function set_poppedViewReturnedObject(value:Dynamic):Dynamic 
	{
		return _poppedViewReturnedObject = value;
	}
	
	public var poppedViewReturnedObject(get_poppedViewReturnedObject, set_poppedViewReturnedObject):Dynamic;
	
	
}