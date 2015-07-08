/**
 * http://wiki.developers.facebook.com/index.php/Data.defineObjectProperty
 * Feb 20/09
 */
/*
  Copyright (c) 2009, Adobe Systems Incorporated
  All rights reserved.

  Redistribution and use in source and binary forms, with or without 
  modification, are permitted provided that the following conditions are
  met:

  * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
  
  * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the 
    documentation and/or other materials provided with the distribution.
  
  * Neither the name of Adobe Systems Incorporated nor the names of its 
    contributors may be used to endorse or promote products derived from 
    this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
package com.facebook.commands.data {
	
	import com.facebook.data.InternalErrorMessages;
	import com.facebook.net.FacebookCall;
	import com.facebook.utils.FacebookDataUtils;
	import com.facebook.utils.ValidationUtils;
	import com.facebook.facebook_internal;

	use namespace facebook_internal;
	
	/**
	 * The DefineObjectProperty class represents the public  
      Facebook API known as Data.defineObjectProperty.
	 * @see http://wiki.developers.facebook.com/index.php/Data.defineObjectProperty
	 */
	public class DefineObjectProperty extends FacebookCall {

		
		public static const METHOD_NAME:String = 'data.defineObjectProperty';
		public static const SCHEMA:Array = ['obj_type', 'prop_name', 'prop_type'];
		
		public var obj_type:String;
		public var prop_name:String;
		
		/**
		 * @see com.facebook.data.data.DataPropTypeValues
		 * 
		 */
		public var prop_type:uint;
		
		public function DefineObjectProperty(obj_type:String, prop_name:String, prop_type:uint) {
			super(METHOD_NAME);
			
			if (ValidationUtils.isDataObjectTypeValid(obj_type) == false) {
				throw new RangeError(FacebookDataUtils.supplantString(InternalErrorMessages.DATA_INVALID_NAME_ERROR, {propName:obj_type}));
			}
			
			if (ValidationUtils.isDataObjectTypeValid(prop_name) == false) {
				throw new RangeError(FacebookDataUtils.supplantString(InternalErrorMessages.DATA_INVALID_NAME_ERROR, {propName:prop_name}));
			}
			
			this.prop_name = prop_name;
		}
		
		override facebook_internal function initialize():void {
			applySchema(SCHEMA, obj_type, prop_name, prop_type);
			super.facebook_internal::initialize();
		}		
	}
}