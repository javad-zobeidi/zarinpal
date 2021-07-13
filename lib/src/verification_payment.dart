class VerificationPayment {
  num? _amount;
  String? _authority;
  String? _merchantID;

  num? getAmount() {
    return _amount;
  }

  void setAmount(num? amount) {
    this._amount = amount;
  }

  String? getAuthority() {
    return _authority;
  }

  void setAuthority(String authority) {
    this._authority = authority;
  }

  String? getMerchantID() {
    return _merchantID;
  }

  void setMerchantID(String? merchantID) {
    this._merchantID = merchantID;
  }

  Map<String, dynamic> toMap() {
    return {
      "MerchantID": _merchantID,
      "Amount": _amount,
      "Authority": _authority,
    };
  }
}
