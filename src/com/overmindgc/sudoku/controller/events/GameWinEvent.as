package com.overmindgc.sudoku.controller.events
{
	import flash.events.Event;
	
	public class GameWinEvent extends Event
	{
		public static const STARTGAME:String = "startGame";
		
		public static const PAUSEGAME:String = "pauseGame";
		
		public static const COMPLETEGAME:String = "completeGame";
		
		public static const RESTARTGAME:String = "restartGame";
		
		public static const BACKTOGAMELIST:String = "backToGameList";
		
		public static const ABANDONGAME:String = "abandonGame";
		
		/**打开选择数字面板*/
		public static const OPENSELECTNUM:String = "openSelectNum";
		/**选择完数字处理*/
		public static const SELECTNUM:String = "selectNum";
		
		
		public var data:*;
		
		public function GameWinEvent(type:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new GameWinEvent(type,data,bubbles,cancelable);
		}
	}
}