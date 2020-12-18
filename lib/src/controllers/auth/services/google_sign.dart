import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount> signIn() async {
    try {
      final GoogleSignInAccount account = await _googleSignIn.signIn();
      final googleKey = await account.authentication;
      print('===== id token =====');
      print(googleKey.idToken);
      print(account);

      return account;
    } catch (e) {
      print('Error google');
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
