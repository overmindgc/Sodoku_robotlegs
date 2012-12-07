package com.overmindgc.sudoku.controller.commands
{
	import com.overmindgc.sudoku.controller.events.GameListEvent;
	import com.overmindgc.sudoku.service.GameDataProxy;
	
	import org.robotlegs.mvcs.Command;
	
	public class GetGameDataCommand extends Command
	{
		[Inject]
		public var gameDataProxy:GameDataProxy;
		
		override public function execute():void
		{
			gameDataProxy.getGameListData();
		}
	}
}