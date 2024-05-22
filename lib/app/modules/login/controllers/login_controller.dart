import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iot_app/app/routes/app_pages.dart';
import 'package:lazyui/lazyui.dart';

class LoginController extends GetxController {
  // Obsecure password
  bool isObsecure = true;

  Map<String, FormModel> forms = LzForm.make(["email", "password"]);

  FirebaseAuth auth = FirebaseAuth.instance;

  Future Login() async {
    try {
      var status = LzForm.validate(forms);

      if (status.ok) {
        var map = forms.toMap();

        UserCredential user = await auth.signInWithEmailAndPassword(
          email: map["email"],
          password: map["password"],
        );

        if (user.user != null) {
          LzToast.success('Login Success');
          Get.offAllNamed(Routes.HOME);
        }
      }
    } on FirebaseAuthException catch (e, s) {
      Errors.check(e, s);
      if (e.code == 'user-not-found') {
        LzToast.error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        LzToast.error('No user found for that email.');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
