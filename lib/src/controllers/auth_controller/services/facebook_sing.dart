import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:proypet/src/data/services/auth/auth_service.dart';

class FacebookSignInService {
  static FacebookLogin _fb = FacebookLogin();

  static Future<int> signIn() async {
    final AuthService repository = AuthService();
    int statusCode;
    try {
      final result = await _fb.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);

      switch (result.status) {
        case FacebookLoginStatus.Success:
          {
            final fbProfile = await _fb.getUserProfile();
            final fbEmail = await _fb.getUserEmail();

            var nombre = fbProfile.firstName;
            var apellido = fbProfile.lastName;
            var email = fbEmail;
            var fbId = fbProfile.userId;

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
        case FacebookLoginStatus.Cancel:
          statusCode = 408;
          break;
        case FacebookLoginStatus.Error:
          statusCode = 409;
          break;
      }
      return statusCode;
    } catch (ex) {
      // throw Exception();
      print('Error fb');
      print(ex);
      return 500;
    }
  }

  static Future signOut() async {
    await _fb.logOut();
  }
}
