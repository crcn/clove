package com.adobe.ac
{   
	import com.spice.vanilla.core.recycle.IDisposable;
	

	public class ObserveValue extends Observer implements IDisposable
	{
		
		private var isValueInitialized : Boolean = false;
		private var _handler : Function;
		private var _source : Object;
		private var _value : Object;
 		
		override public function get handler() : Function
		{
			return _handler;
		}
 	
		public function set handler( value : Function ) : void
		{
			_handler = value;
			if( value != null )
			{
				isHandlerInitialized = true;
				if( isHandlerInitialized && isSourceInitialized && isValueInitialized )
				{
					callHandler();
				}
			}
		}
		
		/*
		 */
		
		public function dispose():void
		{
			
			this._source = undefined;
			this._handler = undefined;
			this._value = undefined;
		}
  
		override public function get source() : Object
		{
			return _source;
		}
 	
		public function set source( value : Object ) : void
		{
			_source = value; 
			isSourceInitialized = true;    	
			if( isHandlerInitialized && isSourceInitialized && isValueInitialized )
			{
				callHandler();
			}
		}
  
		public function get value() : Object
		{
			return _value;
		}
 	
		public function set value( _value : Object ) : void
		{			
			this._value = _value;
			isValueInitialized = true;
			if( isHandlerInitialized && isSourceInitialized && isValueInitialized )
			{
				callHandler();
			}	
		} 
		
		override protected function callHandler() : void
		{
			if( source != value ) return;
			
			try
			{
				handler.call();
			}
			catch( e : Error )
			{
				delay( e );
			}
		}		
	}
}