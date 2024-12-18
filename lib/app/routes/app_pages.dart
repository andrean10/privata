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
import '../modules/core/emr/bindings/emr_binding.dart';
import '../modules/core/emr/bindings/search_procedure_binding.dart';
import '../modules/core/emr/views/dialog/search_procedure_dialog.dart';
import '../modules/core/emr/views/emr_view.dart';
import '../modules/core/main/bindings/main_binding.dart';
import '../modules/core/main/views/main_view.dart';
import '../modules/core/medical_prescription/bindings/medical_prescription_binding.dart';
import '../modules/core/medical_prescription/views/medical_prescription_view.dart';
import '../modules/core/menu_cashier/payment_details/bindings/payment_details_binding.dart';
import '../modules/core/menu_cashier/payment_details/views/payment_details_view.dart';
import '../modules/core/menu_cashier/transaction/bindings/transaction_binding.dart';
import '../modules/core/menu_cashier/transaction/views/transaction_view.dart';
import '../modules/core/menu_registration/doctor/add_doctor/bindings/add_doctor_binding.dart';
import '../modules/core/menu_registration/doctor/add_doctor/views/add_doctor_view.dart';
import '../modules/core/menu_registration/search_patient/bindings/search_patient_binding.dart';
import '../modules/core/menu_registration/search_patient/views/search_patient_dialog.dart';
import '../modules/core/menu_registration/search_patient/views/search_patient_view.dart';
import '../modules/core/menu_registration/sub_menu/new_patient/bindings/new_patient_binding.dart';
import '../modules/core/menu_registration/sub_menu/new_patient/views/new_patient_view.dart';
import '../modules/core/menu_registration/timeline_emr/bindings/timeline_emr_binding.dart';
import '../modules/core/menu_registration/timeline_emr/views/timeline_emr_view.dart';
import '../modules/core/menu_registration/visit_registration/bindings/visit_registration_binding.dart';
import '../modules/core/menu_registration/visit_registration/views/visit_registration_view.dart';
import '../modules/core/menu_setting/billing_landing/detail/bindings/detail_billing_landing_binding.dart';
import '../modules/core/menu_setting/billing_landing/detail/views/detail_billing_landing_view.dart';
import '../modules/core/menu_setting/billing_landing/main/bindings/billing_landing_binding.dart';
import '../modules/core/menu_setting/billing_landing/main/views/billing_landing_view.dart';
import '../modules/core/menu_setting/invoice/bindings/invoice_binding.dart';
import '../modules/core/menu_setting/invoice/views/invoice_view.dart';
import '../modules/core/menu_setting/payment/main/bindings/payment_binding.dart';
import '../modules/core/menu_setting/payment/main/views/payment_view.dart';
import '../modules/core/menu_setting/payment/status/bindings/payment_status_binding.dart';
import '../modules/core/menu_setting/payment/status/views/payment_status_view.dart';
import '../modules/core/menu_setting/printer_settings/bindings/printer_settings_binding.dart';
import '../modules/core/menu_setting/printer_settings/views/printer_settings_view.dart';
import '../modules/core/menu_setting/subscribe/bindings/subscribe_binding.dart';
import '../modules/core/menu_setting/subscribe/views/subscribe_view.dart';
import '../modules/core/menu_cashier/payment_receipt/bindings/payment_receipt_binding.dart';
import '../modules/core/menu_cashier/payment_receipt/views/payment_receipt_view.dart';
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
      name: _Paths.SEARCH_PROCEDURE_DIALOG,
      page: () => const SearchProcedureDialog(),
      binding: SearchProcedureBinding(),
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
      page: () => const SearchPatientView(),
      binding: SearchPatientBinding(),
    ),
    // GetPage(
    //   name: _Paths.SEARCH_PATIENT_DIALOG,
    //   page: () => const SearchPatientDialog(),
    //   binding: SearchPatientBinding(),
    //   fullscreenDialog: true,
    //   transition: Transition.downToUp,
    // ),
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
      name: _Paths.SUBSCRIBE,
      page: () => const SubscribeView(),
      binding: SubscribeBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_STATUS,
      page: () => const PaymentStatusView(),
      binding: PaymentStatusBinding(),
    ),
    GetPage(
      name: _Paths.PRINTER_SETTINGS,
      page: () => const PrinterSettingsView(),
      binding: PrinterSettingsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAILS,
      page: () => const PaymentDetailsView(),
      binding: PaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_RECEIPT,
      page: () => const PaymentReceiptView(),
      binding: PaymentReceiptBinding(),
    ),
  ];
}
