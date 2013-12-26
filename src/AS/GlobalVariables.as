package AS
{
	import AS.FacebookFnct;
	
	import mx.binding.utils.BindingUtils;

	public class GlobalVariables
	{
		[Bindable]
		public static var firstName:String;
		public static var loggedIn:Boolean = false;
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