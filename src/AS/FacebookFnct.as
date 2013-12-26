package AS
{
	import AS.GlobalVariables;
	
	import com.facebook.graph.FacebookMobile;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import mx.core.FlexGlobals;

	public class FacebookFnct extends EventDispatcher
	{
		private var stageWidth:Number;
		private var stageHeight:Number;
		private var stage:Stage;
		public var uName:String;
		public static var stage:Stage = null;
		private static const ReadLblOk:String = "ok";
		
		
		
		[Bindable]
		public function get username():String
		{
			return GlobalVariables.firstName;
		}
		public function set username(naam:String):void
		{
		}

		
		public function FacebookFnct(stage_width:Number, stage_height:Number)
		{
			stageWidth = stage_width;
			stageHeight = stage_height;
			FacebookMobile.init("630767130320379",null, null);
		
			trace('FacebookFnct');
				
		}
		public function execFB():void
		{
			loginFB();
			trace ('execFB');
		}
		
		protected function loginFB():void 
		{
			
			trace('loginFB');
			var facebookWebView:StageWebView = new StageWebView();
			facebookWebView.viewPort = new Rectangle(0,0,stageWidth, stageHeight - 100);
			var permissions:Array = new Array();
			FacebookMobile.login(onLogin,FlexGlobals.topLevelApplication.stage, permissions, facebookWebView);
		}
		
		private function onLogin(succes:Object, fail:Object):void
		{
			// TODO Auto Generated method stub
			if (succes)
			{
				GlobalVariables.firstName = succes.user.first_name;
				GlobalVariables.username = succes.user.username;
				GlobalVariables.loggedIn=true;
				trace("succesvol ingelogd, naam = " + GlobalVariables.firstName);
				dispatchEvent(new Event(ReadLblOk));
			}
			else
			{
				trace("FAIL!");
			}
		}
		
		/*public function buttonFbHandler():void
		{
			if(GlobalVariables.loggedIn)
			{
				GlobalVariables.newFacebook.logout();
				//GlobalVariables.newFacebook.removeEventListener(ReadLblOk, setname);
				trace(GlobalVariables.loggedIn);
				GlobalVariables.firstName = "";
				//target.setStyle("skinClass", skins.facebookInButton);
				//Naam.text="";
				trace('logoutHandler');
			}
		}*/
		
		public function logout():void
		{
			FacebookMobile.logout(onLogout, 'tim.lammar.be');
			GlobalVariables.loggedIn=false;
			
		}
		private function onLogout(result:Object):void
		{
			// TODO Auto Generated method stub
			trace('loggedOut');
			
		}
	}
}