import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import '../pages/Login-Page/login_page_casual.dart';
import '../pages/News-Page/home_page.dart';
import '../references/references.dart';
import '../widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  var logger = Logger();

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: authAccount.idToken, accessToken: authAccount.accessToken);
        await _auth.signInWithCredential(credential);
        await saveUser(account);
        navigateToHomePage();
        logger.i('Sign In With Google Success!\nCredential: $credential');
      }
    } on Exception catch (error) {
      logger.e('Sign In Failed\nError Code: $error');
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      'email': account.email,
      'name': account.displayName,
      'profilepic': account.photoUrl
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed('/introduction');
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(onTap: () {
        Get.back();
        navigateToLoginPage();
        // Navigasi ke Login Page
      }),
      barrierDismissible: true,
    );
  }

  void showSignOutAlertDialogue() {
    Get.dialog(
      Dialogs.signOutDialogue(onTap: () {
        logger.i('Sign Out Success');
        // SystemNavigator.pop();
        try {
          _auth.signOut();
        } on FirebaseAuthException catch (e) {
          logger.e('Sign Out Failed\nError Code: $e');
        }
        Get.back();
      }),
      barrierDismissible: false,
    );
  }

  void navigateToHomePage() {
    Get.offAllNamed(HomePage.routeName);
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _user.value != null;
  }

  Future<void> signOut() async {
    AuthController authController = Get.find();
    authController.showSignOutAlertDialogue();
  }

  Future<void> signIn() async {
    AuthController authController = Get.find();
    authController.showLoginAlertDialogue();
  }
}
