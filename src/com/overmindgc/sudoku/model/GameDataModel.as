package com.overmindgc.sudoku.model
{
	import com.overmindgc.lib.Consts;
	import com.overmindgc.sudoku.controller.events.GameListEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class GameDataModel extends Actor
	{
		public var easyXmlList:XMLList;
		
		public var normalXmlList:XMLList;
		
		public var hardXmlList:XMLList;
		
		/**
		 * 取得游戏数据
		 * */
		public function getGameDataByType(gameType:String):void
		{
			switch(gameType)
			{
				case Consts.easyMode :
				{
					if(easyXmlList)
					{
						eventDispatcher.dispatchEvent(new GameListEvent(GameListEvent.GENER_GAMELIST,gameType,easyXmlList));
						trace("发送了游戏数据");
					}
					break;
				}
					
				case Consts.normalMode :
				{
					if(normalXmlList)
					{
						eventDispatcher.dispatchEvent(new GameListEvent(GameListEvent.GENER_GAMELIST,gameType,normalXmlList));
					}
					break;
				}
					
				case Consts.hardMode :
				{
					if(hardXmlList)
					{
						eventDispatcher.dispatchEvent(new GameListEvent(GameListEvent.GENER_GAMELIST,gameType,hardXmlList));
					}
					break;
				}
					
				default : {}
			}
		}

	}
}