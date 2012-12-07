package com.overmindgc.sudoku
{
	import com.overmindgc.sudoku.controller.commands.GetGameDataCommand;
	import com.overmindgc.sudoku.controller.commands.OpenGameListCommand;
	import com.overmindgc.sudoku.controller.events.GameListEvent;
	import com.overmindgc.sudoku.model.GameDataModel;
	import com.overmindgc.sudoku.service.GameDataProxy;
	import com.overmindgc.sudoku.view.GameCompleteWin;
	import com.overmindgc.sudoku.view.GameListView;
	import com.overmindgc.sudoku.view.GameWindow;
	import com.overmindgc.sudoku.view.SudokuView;
	import com.overmindgc.sudoku.view.mediators.GameCompleteMediator;
	import com.overmindgc.sudoku.view.mediators.GameListMediator;
	import com.overmindgc.sudoku.view.mediators.GameMainMediator;
	import com.overmindgc.sudoku.view.mediators.GameWinMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import mx.events.FlexEvent;
	
	import org.robotlegs.mvcs.Context;
	
	/**
	 * sudoku上下文中心
	 * @author gongchen
	 * */
	public class SudokuContext extends Context
	{
		public function SudokuContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//model映射只需要一个实例
			injector.mapSingleton(GameDataModel);
			
			//映射视图
			mediatorMap.mapView(SudokuView,GameMainMediator);
			mediatorMap.mapView(GameListView,GameListMediator,null,false,false);
			mediatorMap.mapView(GameWindow,GameWinMediator,null,false,false);
			mediatorMap.mapView(GameCompleteWin,GameCompleteMediator,null,false,false);
			
			//command映射
			commandMap.mapEvent(GameListEvent.OPEN_GAME_LIST,OpenGameListCommand,GameListEvent);
			commandMap.mapEvent(GameListEvent.GET_GAME_DATA,GetGameDataCommand,GameListEvent);
			
			//service映射只需要一个实例执行一次
			injector.mapSingleton(GameDataProxy);
			
			//初始加载游戏数据
			contextView.addEventListener(FlexEvent.APPLICATION_COMPLETE,getGameData_Handler);
			
			super.startup();
		}
		
		private function getGameData_Handler(event:FlexEvent):void
		{
			eventDispatcher.dispatchEvent(new GameListEvent(GameListEvent.GET_GAME_DATA,""));
		}
	}
}