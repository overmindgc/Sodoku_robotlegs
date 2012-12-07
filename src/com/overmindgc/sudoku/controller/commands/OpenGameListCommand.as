package com.overmindgc.sudoku.controller.commands
{
	import com.overmindgc.sudoku.controller.events.GameListEvent;
	import com.overmindgc.sudoku.model.GameDataModel;
	import com.overmindgc.sudoku.service.GameDataProxy;
	
	import org.robotlegs.mvcs.Command;
	
	public class OpenGameListCommand extends Command
	{
		[Inject]
		public var event:GameListEvent;
		
		[Inject]
		public var model:GameDataModel;
		
		override public function execute():void
		{
			var type:String = event.gameType;
			model.getGameDataByType(type);
		}
	}
}