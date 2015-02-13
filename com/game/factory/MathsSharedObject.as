package com.game.factory {
	import flash.net.SharedObject;
	
	public class MathsSharedObject {

		// Constant values
		private static const MATHS_LOCAL_DATA:String = "mathsLocalData";
		
		// Singleton variables
		private static var instance:MathsSharedObject;
		private static var isOkayToCreate:Boolean = false;
		
		// Data variables
		private var sharedObject:SharedObject;
		
		public function MathsSharedObject() {
			if (!isOkayToCreate) 
 				throw new Error(this + " is a Singleton. Access using getInstance()"); 

			sharedObject = SharedObject.getLocal(MathsSharedObject.MATHS_LOCAL_DATA); 
 			sharedObject.flush();
		}

		//*********************//
		// SINGLETON FUNCTIONS //
		//*********************//
		public static function getInstance():MathsSharedObject 
 		{ 
 			if (!instance) 
 			{ 
 				isOkayToCreate = true; 
 				instance = new MathsSharedObject(); 
 				isOkayToCreate = false; 
 			} 
 			 
 			return instance; 
 		} 
		
		//********************//
		// ADDITION FUNCTIONS //
		//********************//
		public function SetAdditionLevelData(level:Number, time:Number)
		{
			if (time < this.GetAdditionLevelData(level))
				this.sharedObject.data["addition_level" + level] = time;
		}
		
		public function GetAdditionLevelData(level:Number):Number
		{
			return this.sharedObject.data["addition_level" + level];
		}
		
		//***********************//
		// SUBTRACTION FUNCTIONS //
		//***********************//
		public function SetSubtractionLevelData(level:Number, time:Number)
		{
			if (time < this.GetSubtractionLevelData(level))
				this.sharedObject.data["subtraction_level" + level] = time;
		}
		
		public function GetSubtractionLevelData(level:Number):Number
		{
			return this.sharedObject.data["subtraction_level" + level];
		}
	}
}
