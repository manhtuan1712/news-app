class TypeAnalytics {
  final String _value;

  const TypeAnalytics._internal(this._value);

  get() => _value;

  static const firebase = TypeAnalytics._internal('firebase');
  static const amplitude = TypeAnalytics._internal('amplitude');
  static const appsflyer = TypeAnalytics._internal('appsflyer');
}

class TypePlatform {
  final String _value;

  const TypePlatform._internal(this._value);

  get() => _value;

  static const android = TypePlatform._internal('android');
  static const ios = TypePlatform._internal('ios');
}

class EnvironmentSelection {
  final String _value;

  const EnvironmentSelection._internal(this._value);

  get() => _value;

  static const integration = EnvironmentSelection._internal('integration');
  static const staging = EnvironmentSelection._internal('staging');
  static const production = EnvironmentSelection._internal('production');
}

class KycDocumentCategory {
  final String _value;

  const KycDocumentCategory._internal(this._value);

  get() => _value;

  static const nationId = KycDocumentCategory._internal('NATIONAL_ID');
  static const passport = KycDocumentCategory._internal('PASSPORT');
  static const drivingLicense =
      KycDocumentCategory._internal('DRIVING_LICENSE');
}

class KycType {
  final String _value;

  const KycType._internal(this._value);

  get() => _value;

  static const kycRequiredIdentity = KycType._internal('KYC_REQUIRED_IDENTITY');
  static const kycRequiredLiveNess =
      KycType._internal('KYC_REQUIRED_IDENTITY_LIVENESS');
}

class RegulaFieldType {
  final int _value;

  const RegulaFieldType._internal(this._value);

  getValue() => _value;

  static const country = RegulaFieldType._internal(1);
  static const documentNumber = RegulaFieldType._internal(2);
  static const dateOfExpiry = RegulaFieldType._internal(3);
  static const dateOfIssue = RegulaFieldType._internal(4);
  static const dateOfBirth = RegulaFieldType._internal(5);
  static const placeOfBirth = RegulaFieldType._internal(6);
  static const surname = RegulaFieldType._internal(8);
  static const givenName = RegulaFieldType._internal(9);
  static const dlCategory = RegulaFieldType._internal(20);
  static const issuingAuthority = RegulaFieldType._internal(24);
  static const surnameAndGivenName = RegulaFieldType._internal(25);
}

class RegulaSource {
  final int _value;

  const RegulaSource._internal(this._value);

  getValue() => _value;

  static const mrz = RegulaSource._internal(3);
  static const visualZone = RegulaSource._internal(17);
}

class CardState {
  final String _value;

  const CardState._internal(this._value);

  getValue() => _value;

  static const active = CardState._internal('active');
  static const spent = CardState._internal('spent');
}

class CleverCardsStatus {
  final String _value;

  const CleverCardsStatus._internal(this._value);

  getValue() => _value;

  static const active = CleverCardsStatus._internal('ACTIVE');
  static const locked = CleverCardsStatus._internal('LOCKED');
  static const closed = CleverCardsStatus._internal('CLOSED');
  static const pending = CleverCardsStatus._internal('PENDING');
}

class CleverCardsState {
  final String _value;

  const CleverCardsState._internal(this._value);

  getValue() => _value;

  static const pending = CleverCardsState._internal('pending');
  static const unavailable = CleverCardsState._internal('unavailable');
  static const available = CleverCardsState._internal('available');
}

class TransactionStatus {
  final String _value;

  const TransactionStatus._internal(this._value);

  getValue() => _value;

  static const pending = TransactionStatus._internal('PENDING');
  static const approved = TransactionStatus._internal('APPROVED');
  static const chargeBack = TransactionStatus._internal('CHARGE_BACK');
  static const rejected = TransactionStatus._internal('REJECTED');
}

class TransactionType {
  final String _value;

  const TransactionType._internal(this._value);

  getValue() => _value;

  static const cardActivation = TransactionType._internal('CARD_ACTIVATION');
  static const purchase = TransactionType._internal('PURCHASE');
  static const refund = TransactionType._internal('REFUND');
  static const reversal = TransactionType._internal('REVERSAL');
  static const moneySend = TransactionType._internal('MONEYSEND');
  static const deFund = TransactionType._internal('DEFUND');
  static const promo = TransactionType._internal('PROMO');
  static const adjustment = TransactionType._internal('ADJUSTMENT');
  static const others = TransactionType._internal('OTHERS');
}

class WalletStatus {
  final String _value;

  const WalletStatus._internal(this._value);

  getValue() => _value;

  static const added = TransactionType._internal('added');
  static const available = TransactionType._internal('available');
  static const unavailable = TransactionType._internal('unavailable');
}

class CardType {
  final String _value;

  const CardType._internal(this._value);

  String getValue() => _value;

  static const business = CardType._internal('BUSINESS');
  static const employeeBenefit = CardType._internal('EMPLOYEE_BENEFIT');
}
