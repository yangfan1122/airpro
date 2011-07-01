package {
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Main extends Sprite {
		private var rect:Rect;
		private var levelNum:int = 3;
		private var RectWidth:int = 30;
		private var BlockArr:Array = [];
		private var row:int = 0;
		private var line:int = 0;
		private var positionX:int = 0;
		private var positionY:int = 0;
		private var positionArr:Array = [];
		private var flag:int = 0;
		private var timer:Timer;
		private var _timer:int = 1000;

		private var totalNum:int = 0;

		[SWF(width = "360", height = "600", backgroundColor = "0xcccccc")];
		public function Main(){
			row = stage.stageWidth / RectWidth;
			line = stage.stageHeight / RectWidth;
			totalNum = row * line;
			timer = new Timer(_timer);
			timer.addEventListener(TimerEvent.TIMER, Play);
			timer.start();

			initApp();

		}
		
		private function Play(e:TimerEvent):void 
		{
			for (var i:int = 0; i < BlockArr.length; i++){
					BlockArr[i].gotoAndStop(2);
				}
		}

		private function initApp():void {
			for (var i:int = 0; i < levelNum; i++){
				rect = new Rect();
				rect.num_label = String(i + 1);
				BlockArr.push(rect);
			}
			setRectPosition();
		}

		private function setRectPosition():void {

			for (var i:int = 0; i < BlockArr.length; i++){
				randomPosition();
				positionArr.push(new Point(positionX, positionY));
				BlockArr[i].x = positionX;
				BlockArr[i].y = positionY;
				this.addChild(BlockArr[i]);

				BlockArr[i].addEventListener(MouseEvent.CLICK, onClick);
			}
		}

		private function onClick(e:MouseEvent):void {
			var rect:Rect = Rect(e.currentTarget);
			if (flag == 0){
				for (var i:int = 0; i < BlockArr.length; i++){
					BlockArr[i].gotoAndStop(2);
				}
			}
			flag++;
			if (String(flag) == rect.num_label) {
				this.removeChild(rect);
				if (flag == levelNum) {
					levelNum++;	
					_timer = 1000 * (levelNum - 2);
					resetApp();
				}
			}else {
				while(this.numChildren) {
					this.removeChild(this.getChildAt(0));
				}
				resetApp();
			}
		}
		
		private function resetApp():void 
		{
			BlockArr = [];
			positionArr = [];
			flag = 0;
			initApp();
			timer.delay = _timer;
			timer.reset();
			timer.start();
		}

		private function randomPosition():void {
			positionX = int(Math.random() * row) * RectWidth;
			positionY = int(Math.random() * line) * RectWidth;

			for (var i:int = 0; i < positionArr.length; i++){
				if (positionArr[i].x == positionX && positionArr[i].y == positionY){
					randomPosition();
					break;
				}
			}
		}

	}
}