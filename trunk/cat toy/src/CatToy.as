package src
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author yangfan1122@gmail.com
	 */
	public class CatToy extends Sprite 
	{
		private var angle:int;//角度
		private var timer:Timer;
		private var points:Array;
		private var counter:int;
		
		public function CatToy()
		{
			init();
		}
		private function init():void
		{
			start();
		}
		
		
		//move
		private function start():void
		{
			counter = 0;
			
			points = new Array();
			for (var i:int = 0; i<1000; i++)
			{
				points[i] = new Object();
				points[i].x = Math.random() * stage.stageHeight + 200;
				points[i].y = Math.random() * stage.stageHeight;
			}
			
			graphics.lineStyle(1,0x00ff00);
			graphics.moveTo(points[0].x,points[0].y);
			
			butterfly.x = points[0].x;
			butterfly.y = points[0].y;
			
			for (i=1; i<7; i++)
			{
				var xc:Number = (points[i].x + points[i+1].x)/2;
				var yc:Number = (points[i].y + points[i+1].y)/2;
				graphics.curveTo(points[i].x,points[i].y,xc,yc);
			}
			graphics.curveTo(points[i].x,points[i].y,points[i+1].x,points[i+1].y);
			
			
			
			timer = new Timer(100, 1000);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			//timer.start();
		}
		/*
		private function randRange(min:Number, max:Number):Number //随机数
		{
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
		*/
		private function timerHandler(event:TimerEvent):void
		{
			butterfly.x = points[counter].x;
			butterfly.y = points[counter].x;
			counter += 1;
		}

		// //move
		

		
		
		
		
		
		
		
	}
	
}