package AS
{
	import AS.FacebookFnct;
	
	import mx.binding.utils.BindingUtils;

	public class GlobalVariables
	{
		/*
		Deze classe dient enkel en alleen om globale variabelen te kunnen gerbuiken over de views en klasses heen.
		*/
		
		// in de globale variabele steken we bij een succesvolle inlogging de voornaam van de gebruiker. Al de views kunnen deze dan tonen in
		// de navigationContent.
		[Bindable]
		public static var firstName:String;
		public static var loggedIn:Boolean = false;
		// newFacebook is het object van de klasse FacebookFnct dat we hier globaal moken. Hierdoor kunnen we in alle views hetzelfde object aanspreken 
		// en is er in elke view geweten of er ingelogd is of niet (globale variabele loggedIn, zie hierboven).
		public static var newFacebook:FacebookFnct = new FacebookFnct(320,480);
		public static var username:String;
		public static var accesToken:String;
		public function get username():String
		{
			return username;
		}
		public function GlobalVariables()
		{
		}
		
	}
}