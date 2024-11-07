enum AppointmentStatus { all, waiting, engaged }

enum MethodPayment {
  tunai,
  bpjsKesehatan,
  bpjsKetenagakerjaan,
  insurance,
  company,
  cardDebit,
  cardCredit,
  other
}

enum Day { senin, selasa, rabu, kamis, jumat, sabtu, minggu }

enum Gender { male, female }

enum NewRegistrationStatus { available, exist }

enum RJStatus { succeed, engaged, booked, waiting, failed }

enum BillingState { active, inActive, notyet, empty }

enum SubscriptionProduct { clinica, hospita, privata, pharma }

enum StatePermission { active, notActive, denied, deniedForever }

enum ButtonType { elevated, filled, filledTonal, outlined, text }

enum TypeDropDown { menu, dialog, modal, bottomSheet }
