import 'package:get/get.dart';

import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/info_faskes/bindings/info_faskes_binding.dart';
import '../modules/auth/info_faskes/views/info_faskes_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/preferences/bindings/preferences_binding.dart';
import '../modules/auth/preferences/views/preferences_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/terms/bindings/terms_binding.dart';
import '../modules/auth/terms/views/terms_view.dart';
import '../modules/auth/verify_forgot_password/views/verify_forgot_password_view.dart';
import '../modules/auth/verify_otp/bindings/verify_otp_binding.dart';
import '../modules/auth/verify_otp/views/verify_otp_view.dart';
import '../modules/auth/walkthrough/bindings/walkthrough_binding.dart';
import '../modules/auth/walkthrough/views/walkthrough_view.dart';
import '../modules/auth/welcome/bindings/welcome_binding.dart';
import '../modules/auth/welcome/views/welcome_view.dart';
import '../modules/core/doctor/add_doctor/bindings/add_doctor_binding.dart';
import '../modules/core/doctor/add_doctor/views/add_doctor_view.dart';
import '../modules/core/emr/bindings/emr_binding.dart';
import '../modules/core/emr/bindings/search_action_binding.dart';
import '../modules/core/emr/views/emr_view.dart';
import '../modules/core/emr/views/search_action_dialog.dart';
import '../modules/core/main/bindings/main_binding.dart';
import '../modules/core/main/views/main_view.dart';
import '../modules/core/medical_prescription/bindings/medical_prescription_binding.dart';
import '../modules/core/medical_prescription/views/medical_prescription_view.dart';
import '../modules/core/menu_cashier/transaction/bindings/transaction_binding.dart';
import '../modules/core/menu_cashier/transaction/views/transaction_view.dart';
import '../modules/core/menu_profile/billing_landing/bindings/billing_landing_binding.dart';
import '../modules/core/menu_profile/billing_landing/views/billing_landing_view.dart';

import '../modules/core/menu_regist/sub_menu/new_patient/bindings/new_patient_binding.dart';
import '../modules/core/menu_regist/sub_menu/new_patient/views/new_patient_view.dart';
import '../modules/core/search_patient/bindings/search_patient_binding.dart';
import '../modules/core/search_patient/views/search_patient_dialog.dart';
import '../modules/core/timeline_emr/bindings/timeline_emr_binding.dart';
import '../modules/core/timeline_emr/views/timeline_emr_view.dart';
import '../modules/core/visit_registration/bindings/visit_registration_binding.dart';
import '../modules/core/visit_registration/views/visit_registration_view.dart';
import '../modules/detail_billing_landing/bindings/detail_billing_landing_binding.dart';
import '../modules/detail_billing_landing/views/detail_billing_landing_view.dart';
import '../modules/invoice/bindings/invoice_binding.dart';
import '../modules/invoice/views/invoice_view.dart';
import '../modules/packages/bindings/packages_binding.dart';
import '../modules/packages/views/packages_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/payment_s/status/bindings/payment_status_binding.dart';
import '../modules/payment_s/status/views/payment_status_view.dart';
import '../modules/printer_settings/bindings/printer_settings_binding.dart';
import '../modules/printer_settings/views/printer_settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WALKTHROUGH,
      page: () => const WalkthroughView(),
      binding: WalkthroughBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.TERMS,
      page: () => const TermsView(),
      binding: TermsBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_FORGOT_PASSWORD,
      page: () => const VerifyForgotPasswordView(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP,
      page: () => const VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: _Paths.PREFERENCES,
      page: () => const PreferencesView(),
      binding: PreferencesBinding(),
    ),
    GetPage(
      name: _Paths.INFO_FASKES,
      page: () => const InfoFaskesView(),
      binding: InfoFaskesBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PATIENT,
      page: () => const NewPatientView(),
      binding: NewPatientBinding(),
    ),
    GetPage(
      name: _Paths.EMR,
      page: () => const EmrView(),
      binding: EmrBinding(),
    ),
    GetPage(
      name: _Paths.TIMELINE_EMR,
      page: () => const TimelineEmrView(),
      binding: TimelineEmrBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_ACTION_DIALOG,
      page: () => const SearchActionDialog(),
      binding: SearchActionBinding(),
      fullscreenDialog: true,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.VISIT_REGISTRATION,
      page: () => const VisitRegistrationView(),
      binding: VisitRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DOCTOR,
      page: () => const AddDoctorView(),
      binding: AddDoctorBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => const TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PATIENT,
      page: () => const SearchPatientDialog(),
      binding: SearchPatientBinding(),
      fullscreenDialog: true,
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.MEDICAL_PRESCRIPTION,
      page: () => const MedicalPrescriptionView(),
      binding: MedicalPrescriptionBinding(),
    ),
    GetPage(
      name: _Paths.BILLING_LANDING,
      page: () => const BillingLandingView(),
      binding: BillingLandingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BILLING_LANDING,
      page: () => const DetailBillingLandingView(),
      binding: DetailBillingLandingBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE,
      page: () => const InvoiceView(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGES,
      page: () => const PackagesView(),
      binding: PackagesBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_STATUS,
      page: () => const PaymentStatusView(),
      binding: PaymentStatusBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PRINTER_SETTINGS,
      page: () => const PrinterSettingsView(),
      binding: PrinterSettingsBinding(),
    ),
  ];
}
