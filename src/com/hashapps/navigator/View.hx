package com.hashapps.navigator;
import nme.display.Sprite;

/**
 * ...
 * @author HashApps
 */

class View extends Sprite
{

	private var _navigator:MobileNavigator;
	
	private var _viewReturnObject:Dynamic;
	
	private var _context:Dynamic;
	
	private var _destructionPolicy:String = ViewDestructionPolicy.AUTO;
	
	
	public function new() 
	{
		super();	
	}
	
	private function get_navigator():MobileNavigator 
	{
		return _navigator;
	}
	
	private function set_navigator(value:MobileNavigator):MobileNavigator 
	{
		return _navigator = value;
	}
	
	public var navigator(get_navigator, set_navigator):MobileNavigator;
	
	private function get_viewReturnObject():Dynamic 
	{
		return _viewReturnObject;
	}
	
	private function set_viewReturnObject(value:Dynamic):Dynamic 
	{
		return _viewReturnObject = value;
	}
	
	public var viewReturnObject(get_viewReturnObject, set_viewReturnObject):Dynamic;
	
	private function get_context():Dynamic 
	{
		return _context;
	}
	
	private function set_context(value:Dynamic):Dynamic 
	{
		return _context = value;
	}
	
	public var context(get_context, set_context):Dynamic;
	
	private function get_destructionPolicy():String 
	{
		return _destructionPolicy;
	}
	
	private function set_destructionPolicy(value:String):String 
	{
		return _destructionPolicy = value;
	}
	
	public var destructionPolicy(get_destructionPolicy, set_destructionPolicy):String;
	
	
	public function popView():Void
	{
		navigator.popView();
	}
}