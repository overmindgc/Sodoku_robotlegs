package com.overmindgc.sudoku.service
{
	import com.overmindgc.sudoku.model.GameDataModel;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	
	public class GameDataProxy
	{
		[Inject]
		public var gameModel:GameDataModel;
		
		public function getGameListData():void
		{
			var xmlLoader:URLLoader = new URLLoader();
			
			xmlLoader.addEventListener(Event.COMPLETE,function(evt:Event):void
			{
				var gameXml:XML = XML(evt.target.data);
				gameModel.easyXmlList = XMLList(gameXml.easy.sudoku);
				gameModel.normalXmlList = XMLList(gameXml.normal.sudoku);
				gameModel.hardXmlList = XMLList(gameXml.hard.sudoku);
				trace("读取到了游戏数据");
			});
			
			xmlLoader.addEventListener(IOErrorEvent.IO_ERROR,function(evt:Event):void
			{
				Alert.show("获取游戏数据出错了","哎呀呀");
			});
			xmlLoader.load(new URLRequest("gameSource.xml"));
		}
	}
}