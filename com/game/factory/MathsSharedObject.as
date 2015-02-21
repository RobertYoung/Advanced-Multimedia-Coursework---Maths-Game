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
 			this.SaveData();
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
		
		//******//
		// SAVE //
		//******//
		private function SaveData()
		{
			this.sharedObject.flush();
		}
		
		public function ClearData()
		{
			this.sharedObject.clear();
			this.SaveData();
		}
		
		//********************//
		// ADDITION FUNCTIONS //
		//********************//
		public function SetAdditionLevelData(level:Number, time:Number)
		{
			if (time < this.GetAdditionLevelData(level) || isNaN(this.GetAdditionLevelData(level)))
			{
				this.sharedObject.data["addition_level" + level] = time;
				this.SaveData();
			}
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
			if (time < this.GetSubtractionLevelData(level) || isNaN(this.GetSubtractionLevelData(level)))
			{
				this.sharedObject.data["subtraction_level" + level] = time;
				this.SaveData();
			}
		}
		
		public function GetSubtractionLevelData(level:Number):Number
		{
			return this.sharedObject.data["subtraction_level" + level];
		}
		
		//**************************//
		// MULTIPLICATION FUNCTIONS //
		//**************************//
		public function SetMultiplicationLevelData(level:Number, time:Number)
		{
			if (time < this.GetMultiplicationLevelData(level) || isNaN(this.GetMultiplicationLevelData(level)))
			{
				this.sharedObject.data["multiplication_level" + level] = time;
				this.SaveData();
			}
		}
		
		public function GetMultiplicationLevelData(level:Number):Number
		{
			return this.sharedObject.data["multiplication_level" + level];
		}
		
		//********************//
		// DIVISION FUNCTIONS //
		//********************//
		public function SetDivisionLevelData(level:Number, time:Number)
		{
			if (time < this.GetDivisionLevelData(level) || isNaN(this.GetDivisionLevelData(level)))
			{
				this.sharedObject.data["division_level" + level] = time;
				this.SaveData();
			}
		}
		
		public function GetDivisionLevelData(level:Number):Number
		{
			return this.sharedObject.data["division_level" + level];
		}
		
		//*****************//
		// MONEY FUNCTIONS //
		//*****************//
		public function SetMoneyLevelData(level:Number, time:Number)
		{
			if (time < this.GetMoneyLevelData(level) || isNaN(this.GetMoneyLevelData(level)))
			{
				this.sharedObject.data["money_level" + level] = time;
				this.SaveData();
			}
		}
		
		public function GetMoneyLevelData(level:Number):Number
		{
			return this.sharedObject.data["money_level" + level];
		}
	}
}
