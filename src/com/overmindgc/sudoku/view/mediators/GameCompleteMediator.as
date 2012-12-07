package com.overmindgc.sudoku.view.mediators
{
	import com.overmindgc.sudoku.controller.events.GameWinEvent;
	import com.overmindgc.sudoku.view.GameCompleteWin;
	import com.overmindgc.sudoku.view.GameWindow;
	
	import flash.events.MouseEvent;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class GameCompleteMediator extends Mediator
	{
		[Inject]
		public var completeWin:GameCompleteWin;
		
		override public function onRegister():void
		{
			eventMap.mapListener(completeWin.btnBack,MouseEvent.CLICK,closeToGameList_Handler,MouseEvent);
			eventMap.mapListener(completeWin.btnRestart,MouseEvent.CLICK,restartGame_Handler,MouseEvent);
		}
		
		private function closeToGameList_Handler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(completeWin);
			eventDispatcher.dispatchEvent(new GameWinEvent(GameWinEvent.BACKTOGAMELIST));
			mediatorMap.removeMediatorByView(completeWin);
		}
		
		private function restartGame_Handler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(completeWin);
			eventDispatcher.dispatchEvent(new GameWinEvent(GameWinEvent.RESTARTGAME));
			mediatorMap.removeMediatorByView(completeWin);
		}
		
	}
}