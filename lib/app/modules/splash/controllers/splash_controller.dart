import 'package:get/get.dart';

import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late final InitController _initC;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    if (Get.isRegistered<InitController>()) {
      _initC = Get.find<InitController>();
    }

    Future.delayed(
      5.seconds,
      () => _checkAuth(),
    );
  }

  void _checkAuth() {
    if (_initC.isUserFirstUsingApp()) {
      Get.offAllNamed(Routes.WALKTHROUGH);
    } else {
      // check user is have login or not
      final userToken =
          _initC.localStorage.read<String>(ConstantsKeys.authToken);

      _initC.logger.d('debug: userToken = $userToken');

      if (userToken != null) {
        final isPhoneVerified =
            _initC.localStorage.read<bool>(ConstantsKeys.isVerifiedPhone) ??
                false;
        final isPref =
            _initC.localStorage.read<bool>(ConstantsKeys.isPref) ?? false;

        // check is user has verified phone
        //? !isPhoneVerified
        if (isPhoneVerified) {
          _moveToVerifyPhone();
        }
        //? !isPref
        else if (isPref) {
          _moveToPreferences();
        } else {
          moveToMain();
        }
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  void moveToMain() => Get.offAllNamed(Routes.MAIN);

  void _moveToVerifyPhone() => Get.offAllNamed(Routes.VERIFY_OTP);

  void _moveToPreferences() => Get.offAllNamed(Routes.PREFERENCES);
}
