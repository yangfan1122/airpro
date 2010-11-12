package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;

	/**
	 * ...
	 * @author yanfan1122@gmail.com
	 *
	 * 0 - stone
	 * 1 - forfex
	 * 2 - fabric
	 *
	 */

	public class AndroidTest extends Sprite
	{

		public function AndroidTest()
		{
			init();
		}

		private function init():void
		{
			addObjects();
			styles();
			addListener();
		}

		private function styles():void
		{
		}

		private function addListener():void
		{
			stoneBtn.addEventListener(MouseEvent.CLICK, btnHandler); //stone
			forfexBtn.addEventListener(MouseEvent.CLICK, btnHandler); //forfex
			fabricBtn.addEventListener(MouseEvent.CLICK, btnHandler); //fabric
		}

		private function addObjects():void
		{
		}


		private function btnHandler(event:MouseEvent):void //相应按钮点击
		{
			var temp:uint;
			resTxt.text = "";
			
			//com
			temp = randRange(0, 2);
			showPic(temp, comContainer);
			
			//you
			if (event.target.name == "stoneBtn")
			{
				showPic(0, youContainer);
				judge(0, temp);
			}
			else if (event.target.name == "forfexBtn")
			{
				showPic(1, youContainer);
				judge(1, temp);
			}
			else if (event.target.name == "fabricBtn")
			{
				showPic(2, youContainer);
				judge(2, temp);
			}
			else
			{
				resTxt.text = "error";
			}
		}

		private function showPic(_no:uint, _container:MovieClip):void //显示出拳结果
		{
			var len:Number = _container.numChildren;
			for (var i:Number = 0; i < len; i++)_container.removeChildAt(0);

			if (_no == 0)
			{
				_container.addChild(new stonemc);
			}
			else if (_no == 1)
			{
				_container.addChild(new forfexmc);
			}
			else if (_no == 2)
			{
				_container.addChild(new fabricmc);
			}
		}

		private function randRange(min:Number, max:Number):Number //随机数
		{
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}

		private function judge(_no1:uint, _no2:uint):void //判断结果, _no1:you, _no2:com
		{
			var tmp:Boolean = Math.abs(_no1 - _no2) < 2 && _no1!=_no2 ? true:false;
			if (tmp) {
				resTxt.text = _no1 < _no2 ? "you win":"you lose";
			}else {
				if (_no1 == _no2) {
					resTxt.text = "once more";
				}else {
					resTxt.text = _no1 < _no2 ? "you lose":"you win";
				}
				
			}
		}



	}

}