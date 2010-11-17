package src
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author yanfan1122@gmail.com
	 */
	public class CatToy extends Sprite 
	{
		private var angle:int;//角度
		private var b:Number;//y轴焦点
		private var point:Object;//起始点
		private var pointArr:Array;//记录点坐标
		private var moveTimer:Timer;
		private var counter:uint;//timer计数
		
		
		public function CatToy()
		{
			init();
		}
		private function init():void
		{
			bg.width = stage.stageWidth - 100;
			bg.height = stage.stageHeight - 100;
			bg.x = 50;
			bg.y = 50;
			bg.color
			
			//point = { _x:randRange(0, stage.stageWidth), _y:randRange(0, stage.stageHeight) };
			point = { _x:0, _y:0 };
			angle = randomAngle();
			start();
			
			addEventListener(Event.ENTER_FRAME, enterHandler);
		}
		
		
		//move
		private function start():void
		{
			pointArr = new Array;
			counter = 0;
			//point = { _x:butterfly.x, _y:butterfly.y };
			b = Math.sin(angle / 180 * Math.PI) * point._x - point._y * -1;

			//var len:uint = Math.floor(stage.stageWidth / 10);
			var len:uint = Math.floor(bg.width / 10);
			for (var i:uint = 0; i < len; i++ )
			{
				pointArr.push( { _x:10 * i, _y: equationY(10 * i) } );
			}
			
			moveTimer = new Timer(100, len);
			moveTimer.addEventListener(TimerEvent.TIMER, moveHandler);
			moveTimer.start();
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
			//trace("方程：x=" + _x + " , y=" + Math.sin(angle / 180 * Math.PI) + "x+(" + b + ")");
			return (Math.sin((angle / 180) * Math.PI) * _x + b);
		}
		
		private function moveHandler(event:TimerEvent):void //蝴蝶移动
		{
			butterfly.x = pointArr[counter]._x;
			butterfly.y = pointArr[counter]._y;
			counter += 1;

		}
		// //move
		
		
		
		private function enterHandler(event:Event):void
		{
			trace(butterfly.hitTestObject(bg));
		}
		
		
		
		
		
		
		
	}
	
}