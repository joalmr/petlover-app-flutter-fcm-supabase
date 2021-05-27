import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'auth_service.dart';

//! TODO: no funciona
class FacebookSignInService {
  static Future<int> signIn() async{
    final AuthService repository = AuthService();
    int statusCode;
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      print(result.status);
      switch (result.status) {
        case LoginStatus.success:
          { 
            final userData = await FacebookAuth.instance.getUserData(
                fields: "first_name,last_name,email,id",
            );
            var nombre = userData['first_name'];
            var apellido = userData['last_name']??'';
            var email = userData['email'];
            var fbId = userData['id'];

            int respLogin = await repository.loginFb(
              nombre,
              apellido,
              email,
              fbId,
              result.accessToken.token,
            );
            statusCode = respLogin; //200 401 500
          }
          break;
        case LoginStatus.cancelled:
          statusCode = 408;
          break;
        case LoginStatus.failed:
          statusCode = 409;
          break;
        case LoginStatus.operationInProgress:
          statusCode = 409;
          break;
      }
      return statusCode;
    } catch (ex) {
      return 500;
    }
  }

  static Future signOut() async {
    await FacebookAuth.instance.logOut();
  }
}
