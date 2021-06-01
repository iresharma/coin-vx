import 'dart:convert';

class CoinMin {
  final String id;
  final String name;
  final String symbol;
  final int rank;
  final bool is_new;
  final bool is_active;
  final String type;
  CoinMin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.is_new,
    required this.is_active,
    required this.type,
  });

  CoinMin copyWith({
    String? id,
    String? name,
    String? symbol,
    int? rank,
    bool? is_new,
    bool? is_active,
    String? type,
  }) {
    return CoinMin(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      rank: rank ?? this.rank,
      is_new: is_new ?? this.is_new,
      is_active: is_active ?? this.is_active,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'rank': rank,
      'is_new': is_new,
      'is_active': is_active,
      'type': type,
    };
  }

  factory CoinMin.fromMap(Map<String, dynamic> map) {
    return CoinMin(
      id: map['id'],
      name: map['name'],
      symbol: map['symbol'],
      rank: map['rank']?.toInt(),
      is_new: map['is_new'],
      is_active: map['is_active'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinMin.fromJson(String source) =>
      CoinMin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinMin(id: $id, name: $name, symbol: $symbol, rank: $rank, is_new: $is_new, is_active: $is_active, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinMin &&
        other.id == id &&
        other.name == name &&
        other.symbol == symbol &&
        other.rank == rank &&
        other.is_new == is_new &&
        other.is_active == is_active &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        symbol.hashCode ^
        rank.hashCode ^
        is_new.hashCode ^
        is_active.hashCode ^
        type.hashCode;
  }
}
