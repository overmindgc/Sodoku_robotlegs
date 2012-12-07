package com.overmindgc.sudoku.view.mediators
{
	import com.overmindgc.sudoku.controller.events.GameWinEvent;
	import com.overmindgc.sudoku.view.GameCompleteWin;
	import com.overmindgc.sudoku.view.GameWindow;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class GameWinMediator extends Mediator
	{
		[Inject]
		public var gameWin:GameWindow;
		
		private var completeWin:GameCompleteWin;
		
		override public function onRegister():void
		{
			eventMap.mapListener(gameWin,GameWinEvent.ABANDONGAME,abandonAndCloseWin_Handler,GameWinEvent);
			
			eventMap.mapListener(gameWin,GameWinEvent.COMPLETEGAME,openCompleteWin_Handler,GameWinEvent);
			
			//监听完成窗口发出的事件
			eventMap.mapListener(eventDispatcher,GameWinEvent.BACKTOGAMELIST,backToGameList_Handler,GameWinEvent);
			eventMap.mapListener(eventDispatcher,GameWinEvent.RESTARTGAME,restartGame_Handler,GameWinEvent);
		}
		
		private function abandonAndCloseWin_Handler(event:GameWinEvent):void
		{
			PopUpManager.removePopUp(gameWin);
			mediatorMap.removeMediatorByView(gameWin);
		}
		
		private function openCompleteWin_Handler(event:GameWinEvent):void
		{
			if(!completeWin)
			{
				completeWin = new GameCompleteWin();
			}
			
			gameWin.timer.stop();
			
			completeWin.timeStr = gameWin.timeStr;
			PopUpManager.addPopUp(completeWin,gameWin,true);
			PopUpManager.centerPopUp(completeWin);
			mediatorMap.createMediator(completeWin);
		}
		
		private function backToGameList_Handler(event:GameWinEvent):void
		{
			gameWin.reset();
			gameWin.close();
		}
		
		private function restartGame_Handler(event:GameWinEvent):void
		{
			gameWin.reset();
		}
	}
}