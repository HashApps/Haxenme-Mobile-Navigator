package com.hashapps.navigator;

/**
 * ...
 * @author HashApps
 */

interface IViewTransition 
{

	function setNavigator(value:MobileNavigator):Void;

	function setTransitionDuration(value:Float):Void;

	function play(hideView:View, showView:View, action:String):Void;
	
}