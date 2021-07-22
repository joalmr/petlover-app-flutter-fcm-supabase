import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'auth_service.dart';

class FacebookSignInService {
  static Future<int> signIn() async {
    final AuthService repository = AuthService();
    int statusCode = 401;
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      switch (result.status) {
        case LoginStatus.success:
          {
            final AccessToken accessToken = result.accessToken;

            final userData = await FacebookAuth.instance.getUserData(
              fields: "first_name,last_name,email,id",
            );

            int respLogin = await repository.loginFb(
              userData['first_name'],
              userData['last_name'] ?? '',
              userData['email'],
              userData['id'],
              accessToken.token,
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
