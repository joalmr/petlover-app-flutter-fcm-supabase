// import 'package:google_sign_in/google_sign_in.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:proypet/source/auth/data/service/auth_service.dart';

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static Future<int> signIn() async {
    final AuthService repository = AuthService();
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      final googleKey = await account.authentication;

      int respLogin = await repository.loginGoogle(
        account.displayName.split(' ')[0],
        account.displayName.split(' ')[1],
        account.email,
        account.id,
        googleKey.accessToken,
      );

      return respLogin;
    } catch (ex) {
      return 500;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
