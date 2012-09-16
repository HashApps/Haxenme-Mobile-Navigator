package com.hashapps.navigator.transitions;

import com.hashapps.navigator.events.ViewNavigatorEvent;
import com.hashapps.navigator.IViewTransition;
import com.hashapps.navigator.MobileNavigator;
import com.hashapps.navigator.View;
import com.hashapps.navigator.ViewNavigatorAction;
import nme.display.Sprite;
import com.eclecticdesignstudio.motion.Actuate;
import nme.events.Event;

/**
 * ...
 * @author HashApps
 */

class ViewSlideTransition implements IViewTransition
{
	private var _navigator:MobileNavigator;

	private var _transitionDuration:Float = 0.7;

	public function new(navigator:MobileNavigator) 
	{
		_navigator = navigator;
	}
	
	public function play(hideView:View, showView:View, action:String):Void
		{
			Actuate.stop(hideView);
			Actuate.stop(showView);
			
			// Tweening hideView
			if (hideView != null)
			{
				Actuate.tween(hideView, 
					_transitionDuration,
					{
						x : action == ViewNavigatorAction.PUSH ? -_navigator.width : _navigator.get_width(), 
					}).onComplete(function () {
							cast(_navigator, Sprite).removeChild(hideView);
						});
					
			}

			// Tweening showView
			if (showView != null)
			{
				showView.x = action == ViewNavigatorAction.PUSH ? _navigator.width : -_navigator.get_width();
				showView.y = 0;
				
				cast(_navigator, Sprite).addChild(showView);
				Actuate.tween(showView, _transitionDuration, { x : 0 } ).onComplete(function() {
					showView.dispatchEvent(new ViewNavigatorEvent(ViewNavigatorEvent.VIEW_ACTIVATED, action, hideView, showView));
				});

				
			}
		}

		public function setNavigator(value:MobileNavigator):Void
		{
			_navigator = value;
		}
		

		
		public function setTransitionDuration(value:Float):Void
		{
			_transitionDuration = value;
		}
	
}