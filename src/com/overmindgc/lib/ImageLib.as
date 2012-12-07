package com.overmindgc.lib
{
	public final class ImageLib
	{
		/**游戏背景图片*/
		[Embed(source="assets/images/background.png")]
		public static const backgroundImg:Class;
		
		/**左箭头*/
		[Embed(source="assets/images/arrow-left.png")]
		public static const arrowLeftImg:Class;
		
		/**右箭头*/
		[Embed(source="assets/images/arrow-right.png")]
		public static const arrowRightImg:Class;
		
		/**关闭叉号*/
		[Embed(source="assets/images/close.png")]
		public static const closeImg:Class;
		
		/**数独预览图片*/
		[Embed(source="assets/images/sudokupreview.png")]
		public static const sudokuPreviewImg:Class;
	}
}