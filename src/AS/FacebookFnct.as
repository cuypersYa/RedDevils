package AS
{
	/*
	In deze klasse worden de constructor en methodes voor het initialiseren, aan- en uitloggen en posten van berichten via facebook uitgeschreven.	
	*/
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
		/*
		Bij het aanmaken van het object worden de breedte en hoogte van de stage meegegeven.
		*/
		private var stageWidth:Number;
		private var stageHeight:Number;
		/*
		Volgende string dient voor het plaatsen van de voornaam in de navigationContent. 
		We hebben deze nodig om in de klasse een functie van de view op te roepen (zodat de volgorde wordt gerespecteerd)
		*/
		private static const ReadLblOk:String = "ok";
		
		/*
		Getter en setter om in de views de voornaam te kunnen uitlezen.
		*/
		
		[Bindable]
		public function get username():String
		{
			return GlobalVariables.firstName;
		}
		public function set username(naam:String):void
		{
		}

		/*
		contructor voor het object.
		Hier worden de stagebreedte en stagehoogte meegegeven.
		De intitialisatie met de geregistreerde FBapp wordt alvast gestart
		*/
		public function FacebookFnct(stage_width:Number, stage_height:Number)
		{
			stageWidth = stage_width;
			stageHeight = stage_height;
			FacebookMobile.init("630767130320379",null, null);
		
			trace('FacebookFnct');
				
		}
		
		/*
		Deze functie wordt in de view opgeroepen als de gebruker wilt inloggen.
		hier gebeurt de eigenlijke login op FB
		*/
		public function loginFB():void 
		{
			
			trace('loginFB');
			var facebookWebView:StageWebView = new StageWebView();
			facebookWebView.viewPort = new Rectangle(0,0,stageWidth, stageHeight - 100);
			var permissions:Array = ["publish_actions"];
			
			FacebookMobile.login(onLogin,FlexGlobals.topLevelApplication.stage, permissions, facebookWebView);
		}
		
		/*
		de callback functie van de login. Hierin weten we of er succesvol is ingelogd.
		
		*/
		private function onLogin(succes:Object, fail:Object):void
		{
			// TODO Auto Generated method stub
			if (succes)
				/* Indien succes mag de info van de gebruiker opgehaald worden en de globale boolean loggedIn op true wordt gezet.*/
			{
				GlobalVariables.firstName = succes.user.first_name;
				GlobalVariables.username = succes.user.username;
				GlobalVariables.loggedIn=true;
				/*Gebruikers voornaam mag nu in de navigationContent*/
				dispatchEvent(new Event(ReadLblOk));
			}
			else
			{
				trace("FAIL!");
			}
		}
		/* de gebruiker logt uit van FB*/
		public function logout():void
		{
			FacebookMobile.logout(onLogout, 
								'https://m.facebook.com/dialog/permissions.request?' +
								'app_id=630767130320379&' +
								'display=touch&' +
								'type=user_agent&perms=publish_stream&fbconnect=1');
			GlobalVariables.loggedIn=false;
			FacebookMobile.manageSession=false;
			
		}
		/*callback functie van logout*/
		private function onLogout(result:Object):void
		{
			// TODO Auto Generated method stub
			trace('loggedOut');
			
		}
	}
}