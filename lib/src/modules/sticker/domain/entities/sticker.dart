class Sticker {
  int id;
  int idGroup;
  String text;
  int quantity;

  Sticker(
      {required this.id,
      required this.text,
      required this.idGroup,
      required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "text": this.text,
      "idGroup": this.idGroup,
      "quantity": this.quantity,
    };
  }

  @override
  String toString() {
    return '$text ($quantity)';
  }

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Sticker &&
        other.runtimeType == runtimeType &&
        id == other.id &&
        idGroup == other.idGroup &&
        text == other.text &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => Object.hash(id, idGroup, quantity, text);
}
