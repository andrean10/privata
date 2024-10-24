class TransactionModel {
  final String noInvoice;
  final DateTime transactionDate;
  final num visitor;
  final num maxVisitor;
  final DateTime endTransaction;
  final String channelPayment;
  final num total;
  final bool isPurchased;

  TransactionModel({
    required this.noInvoice,
    required this.transactionDate,
    required this.visitor,
    required this.maxVisitor,
    required this.endTransaction,
    required this.channelPayment,
    required this.total,
    required this.isPurchased,
  });
}
