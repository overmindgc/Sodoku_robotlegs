package com.overmindgc.sudoku.controller.events
{
	import flash.events.Event;
	
	public class GameListEvent extends Event
	{
		/**打开游戏列表事件*/
		public static const OPEN_GAME_LIST:String = "openGameList";
		/**读取游戏数据事件*/
		public static const GET_GAME_DATA:String = "getGameData";
		/**生成游戏列表事件*/
		public static const GENER_GAMELIST:String = "generGameList";
		
		/**游戏难度类型*/
		public var gameType:String;
		
		public var data:*;
		
		public function GameListEvent(type:String, gameType:String, data:*=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.gameType = gameType;
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new GameListEvent(type,gameType,data,bubbles,cancelable);
		}
		
		
	}
}
