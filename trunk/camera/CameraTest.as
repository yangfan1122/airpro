package 
{
	import flash.media.Camera;
	import flash.media.Video;
	import flash.display.Sprite;

	public class CameraTest extends Sprite
	{

		public function CameraTest()
		{
			init();
		}
		private function init():void
		{
			var camera:Camera = Camera.getCamera("1");
			if(camera != null)
			{
				var video:Video = new Video();
				video.attachCamera(camera);
				txt.text = "video.width = "+video.width;
				addChild(video);
			}
			else
			{
				txt.text = "no camera";
			}
		}

	}

}