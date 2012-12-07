package com.overmindgc.sudoku.view.mediators
{
	import com.overmindgc.lib.Consts;
	import com.overmindgc.sudoku.controller.events.GameListEvent;
	import com.overmindgc.sudoku.view.GameListView;
	import com.overmindgc.sudoku.view.SudokuView;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class GameMainMediator extends Mediator
	{
		[Inject]
		public var mainView:SudokuView;
		
		private var gameListView:GameListView;
		
		public function GameMainMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(mainView.btnEasy,MouseEvent.CLICK,openEasyGameList_Handler,MouseEvent);
			eventMap.mapListener(mainView.btnNormal,MouseEvent.CLICK,openNormalGameList_Handler,MouseEvent);
			eventMap.mapListener(mainView.btnHard,MouseEvent.CLICK,openHardGameList_Handler,MouseEvent);
		}
		
		private function openEasyGameList_Handler(event:MouseEvent):void
		{
			popUpGameListView();
			eventDispatcher.dispatchEvent(new GameListEvent(GameListEvent.OPEN_GAME_LIST,Consts.easyMode));
		}
		
		private function openNormalGameList_Handler(event:MouseEvent):void
		{
			popUpGameListView();
			eventDispatcher.dispatchEvent(new GameListEvent(GameListEvent.OPEN_GAME_LIST,Consts.normalMode));
		}
		
		private function openHardGameList_Handler(event:MouseEvent):void
		{
			popUpGameListView();
			dispatch(new GameListEvent(GameListEvent.OPEN_GAME_LIST,Consts.hardMode));
		}
		
		private function popUpGameListView():void
		{
			if(!gameListView)
			{
				gameListView = new GameListView();
			}
			PopUpManager.addPopUp(gameListView,DisplayObject(FlexGlobals.topLevelApplication),true);
			PopUpManager.centerPopUp(gameListView);
			mediatorMap.createMediator(gameListView);
		}
	}
}