package src
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author yanfan1122@gmail.com
	 */
	public class CatToy extends Sprite 
	{
		private var angle:int;//角度
		private var b:Number;//y轴焦点
		
		private var point:Object = {_x:30, _y:30};//起始点
		
		
		public function CatToy()
		{
			init();
		}
		private function init():void
		{
			b = Math.sin(randomAngle() / 180 * Math.PI) * point._x - point._y * -1;
			trace(equationY(30));
		}
		

		private function randomAngle():Number //随机角度
		{
			return randRange(0, 180);
		}
		private function randRange(min:Number, max:Number):Number //随机数
		{
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}

		
		private function equationY(_x:Number):Number //求y值
		{
			//trace("方程：x="+_x+" , y="+Math.sin(randomAngle() / 180 * Math.PI)+"x+("+b+")");
			return (Math.sin((randomAngle() / 180) * Math.PI) * _x + b);
		}
		
		
	}
	
}