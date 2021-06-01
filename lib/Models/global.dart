import 'dart:convert';

import 'package:coin_vx/Models/global.dart';
import 'package:money2/money2.dart';

class GlobalData {
  final int market_cap_usd;
  final int volume_24h_usd;
  final double bitcoin_dominance_percentage;
  final int cryptocurrencies_number;
  final int market_cap_ath_value;
  final String market_cap_ath_date;
  final int volume_24h_ath_value;
  final String volume_24h_ath_date;
  final double market_cap_change_24h;
  final double volume_24h_change_24h;
  final int last_updated;
  GlobalData({
    required this.market_cap_usd,
    required this.volume_24h_usd,
    required this.bitcoin_dominance_percentage,
    required this.cryptocurrencies_number,
    required this.market_cap_ath_value,
    required this.market_cap_ath_date,
    required this.volume_24h_ath_value,
    required this.volume_24h_ath_date,
    required this.market_cap_change_24h,
    required this.volume_24h_change_24h,
    required this.last_updated,
  });

  factory GlobalData.empty() => GlobalData(
      market_cap_usd: 0,
      volume_24h_usd: 0,
      bitcoin_dominance_percentage: 0,
      cryptocurrencies_number: 0,
      market_cap_ath_value: 0,
      market_cap_ath_date: "market_cap_ath_date",
      volume_24h_ath_value: 0,
      volume_24h_ath_date: "volume_24h_ath_date",
      market_cap_change_24h: 0,
      volume_24h_change_24h: 0,
      last_updated: 0);

  GlobalData copyWith({
    int? market_cap_usd,
    int? volume_24h_usd,
    double? bitcoin_dominance_percentage,
    int? cryptocurrencies_number,
    int? market_cap_ath_value,
    String? market_cap_ath_date,
    int? volume_24h_ath_value,
    String? volume_24h_ath_date,
    double? market_cap_change_24h,
    double? volume_24h_change_24h,
    int? last_updated,
  }) {
    return GlobalData(
      market_cap_usd: market_cap_usd ?? this.market_cap_usd,
      volume_24h_usd: volume_24h_usd ?? this.volume_24h_usd,
      bitcoin_dominance_percentage:
          bitcoin_dominance_percentage ?? this.bitcoin_dominance_percentage,
      cryptocurrencies_number:
          cryptocurrencies_number ?? this.cryptocurrencies_number,
      market_cap_ath_value: market_cap_ath_value ?? this.market_cap_ath_value,
      market_cap_ath_date: market_cap_ath_date ?? this.market_cap_ath_date,
      volume_24h_ath_value: volume_24h_ath_value ?? this.volume_24h_ath_value,
      volume_24h_ath_date: volume_24h_ath_date ?? this.volume_24h_ath_date,
      market_cap_change_24h:
          market_cap_change_24h ?? this.market_cap_change_24h,
      volume_24h_change_24h:
          volume_24h_change_24h ?? this.volume_24h_change_24h,
      last_updated: last_updated ?? this.last_updated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'market_cap_usd': market_cap_usd,
      'volume_24h_usd': volume_24h_usd,
      'bitcoin_dominance_percentage': bitcoin_dominance_percentage,
      'cryptocurrencies_number': cryptocurrencies_number,
      'market_cap_ath_value': market_cap_ath_value,
      'market_cap_ath_date': market_cap_ath_date,
      'volume_24h_ath_value': volume_24h_ath_value,
      'volume_24h_ath_date': volume_24h_ath_date,
      'market_cap_change_24h': market_cap_change_24h,
      'volume_24h_change_24h': volume_24h_change_24h,
      'last_updated': last_updated,
    };
  }

  factory GlobalData.fromMap(Map<String, dynamic> map) {
    return GlobalData(
      market_cap_usd: map['market_cap_usd']?.toInt(),
      volume_24h_usd: map['volume_24h_usd']?.toInt(),
      bitcoin_dominance_percentage:
          map['bitcoin_dominance_percentage']?.toDouble(),
      cryptocurrencies_number: map['cryptocurrencies_number']?.toInt(),
      market_cap_ath_value: map['market_cap_ath_value']?.toInt(),
      market_cap_ath_date: map['market_cap_ath_date'],
      volume_24h_ath_value: map['volume_24h_ath_value']?.toInt(),
      volume_24h_ath_date: map['volume_24h_ath_date'],
      market_cap_change_24h: map['market_cap_change_24h']?.toDouble(),
      volume_24h_change_24h: map['volume_24h_change_24h']?.toDouble(),
      last_updated: map['last_updated']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GlobalData.fromJson(String source) =>
      GlobalData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GlobalData(market_cap_usd: $market_cap_usd, volume_24h_usd: $volume_24h_usd, bitcoin_dominance_percentage: $bitcoin_dominance_percentage, cryptocurrencies_number: $cryptocurrencies_number, market_cap_ath_value: $market_cap_ath_value, market_cap_ath_date: $market_cap_ath_date, volume_24h_ath_value: $volume_24h_ath_value, volume_24h_ath_date: $volume_24h_ath_date, market_cap_change_24h: $market_cap_change_24h, volume_24h_change_24h: $volume_24h_change_24h, last_updated: $last_updated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GlobalData &&
        other.market_cap_usd == market_cap_usd &&
        other.volume_24h_usd == volume_24h_usd &&
        other.bitcoin_dominance_percentage == bitcoin_dominance_percentage &&
        other.cryptocurrencies_number == cryptocurrencies_number &&
        other.market_cap_ath_value == market_cap_ath_value &&
        other.market_cap_ath_date == market_cap_ath_date &&
        other.volume_24h_ath_value == volume_24h_ath_value &&
        other.volume_24h_ath_date == volume_24h_ath_date &&
        other.market_cap_change_24h == market_cap_change_24h &&
        other.volume_24h_change_24h == volume_24h_change_24h &&
        other.last_updated == last_updated;
  }

  @override
  int get hashCode {
    return market_cap_usd.hashCode ^
        volume_24h_usd.hashCode ^
        bitcoin_dominance_percentage.hashCode ^
        cryptocurrencies_number.hashCode ^
        market_cap_ath_value.hashCode ^
        market_cap_ath_date.hashCode ^
        volume_24h_ath_value.hashCode ^
        volume_24h_ath_date.hashCode ^
        market_cap_change_24h.hashCode ^
        volume_24h_change_24h.hashCode ^
        last_updated.hashCode;
  }

  String get market_cap =>
      "\$ ${(market_cap_usd / 1000000000).round()} Billion+";

  String get volume => "\$ ${(volume_24h_usd / 1000000000).round()} Billion+";

  String get market_cap_change {
    return "$market_cap_change_24h %";
  }

  String get volume_change {
    return "$volume_24h_change_24h %";
  }
}
