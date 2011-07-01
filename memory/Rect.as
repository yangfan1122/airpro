package {
	import flash.display.MovieClip;
	public class Rect extends MovieClip {
		private var _num_label:String = "";
		public function Rect() {
			this.stop();
			NumTxt.selectable = false;
			NumTxt.autoSize = "center";
		}
		
		public function get num_label():String 
		{
			
			return _num_label;
		}
		
		public function set num_label(value:String):void 
		{
			NumTxt.text = value;
			_num_label = value;
		}
	}
}