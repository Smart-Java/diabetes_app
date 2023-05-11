const String txnTableName = 'failed_txn';

class FailedTxnTable {
  static List<String> values = [
    id,
    amountToPay,
    dateOfPayment,
    paymentReferId,
    paystackSuccessfulReturnResponseValue,
  ];

  static String id = '_id';
  static String amountToPay = '_amountToPay';
  static String dateOfPayment = '_dateOfPayment';
  static String paymentReferId = '_paymentReferId';
  static String paystackSuccessfulReturnResponseValue =
      '_paystackSuccessfulReturnResponseValue';
}

class FailedTxnModel {
  final int? id;
  final double amountToPay;
  final String dateOfPayment;
  final String paymentReferId;
  final String paystackSuccessfulReturnResponseValue;

  const FailedTxnModel({
    this.id,
    required this.amountToPay,
    required this.dateOfPayment,
    required this.paymentReferId,
    required this.paystackSuccessfulReturnResponseValue,
  });

  FailedTxnModel copy({
    int? id,
    double? amountToPay,
    String? dateOfPayment,
    String? paymentReferId,
    String? paystackSuccessfulReturnResponseValue,
  }) {
    return FailedTxnModel(
      id: id ?? this.id,
      amountToPay: amountToPay ?? this.amountToPay,
      dateOfPayment: dateOfPayment ?? this.dateOfPayment,
      paymentReferId: paymentReferId ?? this.paymentReferId,
      paystackSuccessfulReturnResponseValue:
          paystackSuccessfulReturnResponseValue ??
              this.paystackSuccessfulReturnResponseValue,
    );
  }

  Map<String, Object?> toJson() => {
        FailedTxnTable.id: id,
        FailedTxnTable.amountToPay: amountToPay,
        FailedTxnTable.dateOfPayment: dateOfPayment,
        FailedTxnTable.paymentReferId: paymentReferId,
        FailedTxnTable.paystackSuccessfulReturnResponseValue:
            paystackSuccessfulReturnResponseValue,
      };

  static FailedTxnModel fromJson(Map<String, Object?> json) {
    return FailedTxnModel(
      id: json[FailedTxnTable.id] as int,
      amountToPay: json[FailedTxnTable.amountToPay] as double,
      dateOfPayment: json[FailedTxnTable.dateOfPayment] as String,
      paymentReferId: json[FailedTxnTable.paymentReferId] as String,
      paystackSuccessfulReturnResponseValue:
          json[FailedTxnTable.paystackSuccessfulReturnResponseValue] as String,
    );
  }
}
