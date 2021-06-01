import 'dart:convert';

class CoinTweet {
  final String date;
  final String user_name;
  final String user_image_link;
  final String status;
  final bool is_retweet;
  final int retweet_count;
  final int like_count;
  final String status_link;
  final String status_id;
  final String media_link;
  final String youtube_link;
  CoinTweet({
    required this.date,
    required this.user_name,
    required this.user_image_link,
    required this.status,
    required this.is_retweet,
    required this.retweet_count,
    required this.like_count,
    required this.status_link,
    required this.status_id,
    required this.media_link,
    required this.youtube_link,
  });

  CoinTweet copyWith({
    String? date,
    String? user_name,
    String? user_image_link,
    String? status,
    bool? is_retweet,
    int? retweet_count,
    int? like_count,
    String? status_link,
    String? status_id,
    String? media_link,
    String? youtube_link,
  }) {
    return CoinTweet(
      date: date ?? this.date,
      user_name: user_name ?? this.user_name,
      user_image_link: user_image_link ?? this.user_image_link,
      status: status ?? this.status,
      is_retweet: is_retweet ?? this.is_retweet,
      retweet_count: retweet_count ?? this.retweet_count,
      like_count: like_count ?? this.like_count,
      status_link: status_link ?? this.status_link,
      status_id: status_id ?? this.status_id,
      media_link: media_link ?? this.media_link,
      youtube_link: youtube_link ?? this.youtube_link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'user_name': user_name,
      'user_image_link': user_image_link,
      'status': status,
      'is_retweet': is_retweet,
      'retweet_count': retweet_count,
      'like_count': like_count,
      'status_link': status_link,
      'status_id': status_id,
      'media_link': media_link,
      'youtube_link': youtube_link,
    };
  }

  factory CoinTweet.fromMap(Map<String, dynamic> map) {
    return CoinTweet(
      date: map['date']?? 'hi',
      user_name: map['user_name']?? 'hi',
      user_image_link: map['user_image_link']?? 'hi',
      status: map['status']?? 'hi',
      is_retweet: map['is_retweet']?? false,
      retweet_count: map['retweet_count']?.toInt()?? 0,
      like_count: map['like_count']?.toInt()?? 0,
      status_link: map['status_link']?? 'hi',
      status_id: map['status_id']?? 'hi',
      media_link: map['media_link']?? 'hi',
      youtube_link: map['youtube_link']?? 'hi',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinTweet.fromJson(String source) => CoinTweet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinTweet(date: $date, user_name: $user_name, user_image_link: $user_image_link, status: $status, is_retweet: $is_retweet, retweet_count: $retweet_count, like_count: $like_count, status_link: $status_link, status_id: $status_id, media_link: $media_link, youtube_link: $youtube_link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CoinTweet &&
      other.date == date &&
      other.user_name == user_name &&
      other.user_image_link == user_image_link &&
      other.status == status &&
      other.is_retweet == is_retweet &&
      other.retweet_count == retweet_count &&
      other.like_count == like_count &&
      other.status_link == status_link &&
      other.status_id == status_id &&
      other.media_link == media_link &&
      other.youtube_link == youtube_link;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      user_name.hashCode ^
      user_image_link.hashCode ^
      status.hashCode ^
      is_retweet.hashCode ^
      retweet_count.hashCode ^
      like_count.hashCode ^
      status_link.hashCode ^
      status_id.hashCode ^
      media_link.hashCode ^
      youtube_link.hashCode;
  }
}