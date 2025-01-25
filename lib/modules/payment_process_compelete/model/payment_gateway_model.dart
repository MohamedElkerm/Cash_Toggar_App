class PaymentGateway {
  final bool isEnable;
  final bool isVisible;
  final String image;
  final String title;
  final String titleEn;
  final String titleForTransaction;
  final String titleForTransactionEn;
  final String transactionMethod;

  PaymentGateway({
    required this.isEnable,
    required this.isVisible,
    required this.image,
    required this.title,
    required this.titleEn,
    required this.titleForTransaction,
    required this.titleForTransactionEn,
    required this.transactionMethod,
  });

  // Factory method to create a PaymentGateway from a Firestore document
  factory PaymentGateway.fromMap(Map<String, dynamic> data) {
    return PaymentGateway(
      isEnable: data['isEnable'] ?? false,
      isVisible: data['isVisible'] ?? false,
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      titleEn: data['titleEn'] ?? '',
      titleForTransaction: data['titleForTransaction'] ?? '',
      titleForTransactionEn: data['titleForTransactionEn'] ?? '',
      transactionMethod: data['transactionMethod'] ?? '',
    );
  }

  // Convert PaymentGateway to a map (optional, useful for adding/updating data)
  Map<String, dynamic> toMap() {
    return {
      'isEnable': isEnable,
      'isVisible': isVisible,
      'image': image,
      'title': title,
      'titleEn': titleEn,
      'titleForTransaction': titleForTransaction,
      'titleForTransactionEn': titleForTransactionEn,
      'transactionMethod': transactionMethod,
    };
  }
}