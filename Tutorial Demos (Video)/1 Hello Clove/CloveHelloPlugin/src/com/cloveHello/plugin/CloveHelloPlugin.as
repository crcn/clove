package com.cloveHello.plugin
{
	import com.spice.clove.plugin.ClovePlugin;
	import com.spice.clove.plugin.control.IPluginController;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	public class CloveHelloPlugin extends ClovePlugin
	{
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
        
        /**
		 */
		 
		public function CloveHelloPlugin()
		{
			super({});
		}
		
		//--------------------------------------------------------------------------
   	    //
        //  Public Methods
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		
		override public function initialize(controller:IPluginController):void
		{
			Alert.show("Hello Clove!","Hello",4,null,onClose);
			
			
		}
		
		
		//--------------------------------------------------------------------------
   	    //
        //  Private Methods
        //
        //--------------------------------------------------------------------------
        
        /**
		 */
		
		private function onClose(event:CloseEvent):void
		{
			this.complete();
		}

	}
}