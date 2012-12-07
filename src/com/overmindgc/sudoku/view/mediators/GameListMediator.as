package com.overmindgc.sudoku.view.mediators
{
	import com.overmindgc.sudoku.controller.events.GameListEvent;
	import com.overmindgc.sudoku.controller.events.GameWinEvent;
	import com.overmindgc.sudoku.view.GameListView;
	import com.overmindgc.sudoku.view.GameWindow;
	
	import flash.events.MouseEvent;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class GameListMediator extends Mediator
	{
		[Inject]
		public var gameListView:GameListView;
		
		private var gameWin:GameWindow;
		
		public function GameListMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			//监听根据数据生成列表事件
			eventMap.mapListener(eventDispatcher,GameListEvent.GENER_GAMELIST,generGameList_Handler,GameListEvent);
			eventMap.mapListener(gameListView.imgClose,MouseEvent.CLICK,closeGameListWin_Handler,MouseEvent);
			
			eventMap.mapListener(gameListView,GameWinEvent.STARTGAME,startGame_Handler,GameWinEvent);
		}
		
		private function generGameList_Handler(event:GameListEvent):void
		{
			var gameType:String = event.gameType;
			var gameData:XMLList = event.data as XMLList;
			gameListView.getGameListData(gameType,gameData);
		}
		
		private function closeGameListWin_Handler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(gameListView);
			mediatorMap.removeMediatorByView(gameListView);
		}
		
		private function startGame_Handler(event:GameWinEvent):void
		{
			if(!gameWin)
			{
				gameWin = new GameWindow();
			}
			
			PopUpManager.addPopUp(gameWin,gameListView,true);
			PopUpManager.centerPopUp(gameWin);
			mediatorMap.createMediator(gameWin);
			gameWin.gameXml = event.data;
		}
	}
}