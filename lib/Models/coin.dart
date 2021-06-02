// ignore_for_file: dead_null_aware_expression
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Coin {
  final String id;
  final String name;
  final String symbol;
  final int rank;
  final bool is_new;
  final bool is_active;
  final String type;
  final List<Tag> tags;
  final List<Team> team;
  final String description;
  final String message;
  final bool open_source;
  final String started_at;
  final String development_status;
  final bool hardware_wallet;
  final String proof_type;
  final String org_structure;
  final String hash_algorithm;
  final Links links;
  final List<Links_extended> links_extended;
  final Whitepaper whitepaper;
  final String first_data_at;
  final String last_data_at;
  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.is_new,
    required this.is_active,
    required this.type,
    required this.tags,
    required this.team,
    required this.description,
    required this.message,
    required this.open_source,
    required this.started_at,
    required this.development_status,
    required this.hardware_wallet,
    required this.proof_type,
    required this.org_structure,
    required this.hash_algorithm,
    required this.links,
    required this.links_extended,
    required this.whitepaper,
    required this.first_data_at,
    required this.last_data_at,
  });

  Coin copyWith({
    String? id,
    String? name,
    String? symbol,
    int? rank,
    bool? is_new,
    bool? is_active,
    String? type,
    List<Tag>? tags,
    List<Team>? team,
    String? description,
    String? message,
    bool? open_source,
    String? started_at,
    String? development_status,
    bool? hardware_wallet,
    String? proof_type,
    String? org_structure,
    String? hash_algorithm,
    Links? links,
    List<Links_extended>? links_extended,
    Whitepaper? whitepaper,
    String? first_data_at,
    String? last_data_at,
  }) {
    return Coin(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      rank: rank ?? this.rank,
      is_new: is_new ?? this.is_new,
      is_active: is_active ?? this.is_active,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      team: team ?? this.team,
      description: description ?? this.description,
      message: message ?? this.message,
      open_source: open_source ?? this.open_source,
      started_at: started_at ?? this.started_at,
      development_status: development_status ?? this.development_status,
      hardware_wallet: hardware_wallet ?? this.hardware_wallet,
      proof_type: proof_type ?? this.proof_type,
      org_structure: org_structure ?? this.org_structure,
      hash_algorithm: hash_algorithm ?? this.hash_algorithm,
      links: links ?? this.links,
      links_extended: links_extended ?? this.links_extended,
      whitepaper: whitepaper ?? this.whitepaper,
      first_data_at: first_data_at ?? this.first_data_at,
      last_data_at: last_data_at ?? this.last_data_at,
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
      'tags': tags.map((x) => x.toMap()).toList(),
      'team': team.map((x) => x.toMap()).toList(),
      'description': description,
      'message': message,
      'open_source': open_source,
      'started_at': started_at,
      'development_status': development_status,
      'hardware_wallet': hardware_wallet,
      'proof_type': proof_type,
      'org_structure': org_structure,
      'hash_algorithm': hash_algorithm,
      'links': links.toMap(),
      'links_extended': links_extended.map((x) => x.toMap()).toList(),
      'whitepaper': whitepaper.toMap(),
      'first_data_at': first_data_at,
      'last_data_at': last_data_at,
    };
  }

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      id: map['id']?? "",
      name: map['name']?? "",
      symbol: map['symbol']?? "",
      rank: map['rank']?.toInt()?? 0,
      is_new: map['is_new']?? false,
      is_active: map['is_active']?? false,
      type: map['type']?? "",
      tags: List<Tag>.from(map['tags']?.map((x) => Tag.fromMap(x))),
      team: List<Team>.from(map['team']?.map((x) => Team.fromMap(x))),
      description: map['description']?? "",
      message: map['message']?? "",
      open_source: map['open_source']?? false,
      started_at: map['started_at']?? "",
      development_status: map['development_status']?? "",
      hardware_wallet: map['hardware_wallet']?? false,
      proof_type: map['proof_type']?? "",
      org_structure: map['org_structure']?? "",
      hash_algorithm: map['hash_algorithm']?? "",
      links: Links.fromMap(map['links']),
      links_extended: List<Links_extended>.from(map['links_extended']?.map((x) => Links_extended.fromMap(x))),
      whitepaper: Whitepaper.fromMap(map['whitepaper']),
      first_data_at: map['first_data_at']?? "",
      last_data_at: map['last_data_at']?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Coin.fromJson(String source) => Coin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Coin(id: $id, name: $name, symbol: $symbol, rank: $rank, is_new: $is_new, is_active: $is_active, type: $type, tags: $tags, team: $team, description: $description, message: $message, open_source: $open_source, started_at: $started_at, development_status: $development_status, hardware_wallet: $hardware_wallet, proof_type: $proof_type, org_structure: $org_structure, hash_algorithm: $hash_algorithm, links: $links, links_extended: $links_extended, whitepaper: $whitepaper, first_data_at: $first_data_at, last_data_at: $last_data_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Coin &&
      other.id == id &&
      other.name == name &&
      other.symbol == symbol &&
      other.rank == rank &&
      other.is_new == is_new &&
      other.is_active == is_active &&
      other.type == type &&
      listEquals(other.tags, tags) &&
      listEquals(other.team, team) &&
      other.description == description &&
      other.message == message &&
      other.open_source == open_source &&
      other.started_at == started_at &&
      other.development_status == development_status &&
      other.hardware_wallet == hardware_wallet &&
      other.proof_type == proof_type &&
      other.org_structure == org_structure &&
      other.hash_algorithm == hash_algorithm &&
      other.links == links &&
      listEquals(other.links_extended, links_extended) &&
      other.whitepaper == whitepaper &&
      other.first_data_at == first_data_at &&
      other.last_data_at == last_data_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      symbol.hashCode ^
      rank.hashCode ^
      is_new.hashCode ^
      is_active.hashCode ^
      type.hashCode ^
      tags.hashCode ^
      team.hashCode ^
      description.hashCode ^
      message.hashCode ^
      open_source.hashCode ^
      started_at.hashCode ^
      development_status.hashCode ^
      hardware_wallet.hashCode ^
      proof_type.hashCode ^
      org_structure.hashCode ^
      hash_algorithm.hashCode ^
      links.hashCode ^
      links_extended.hashCode ^
      whitepaper.hashCode ^
      first_data_at.hashCode ^
      last_data_at.hashCode;
  }
}

class Tag {
  final String id;
  final String name;
  final int coin_counter;
  final int ico_counter;
  Tag({
    required this.id,
    required this.name,
    required this.coin_counter,
    required this.ico_counter,
  });

  Tag copyWith({
    String? id,
    String? name,
    int? coin_counter,
    int? ico_counter,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      coin_counter: coin_counter ?? this.coin_counter,
      ico_counter: ico_counter ?? this.ico_counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id?? "",
      'name': name?? "",
      'coin_counter': coin_counter?? 0,
      'ico_counter': ico_counter?? 0,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'],
      name: map['name'],
      coin_counter: map['coin_counter']?.toInt(),
      ico_counter: map['ico_counter']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) => Tag.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, coin_counter: $coin_counter, ico_counter: $ico_counter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tag &&
      other.id == id &&
      other.name == name &&
      other.coin_counter == coin_counter &&
      other.ico_counter == ico_counter;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      coin_counter.hashCode ^
      ico_counter.hashCode;
  }
}

class Team {
  final String id;
  final String name;
  final String position;
  Team({
    required this.id,
    required this.name,
    required this.position,
  });

  Team copyWith({
    String? id,
    String? name,
    String? position,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id?? "",
      'name': name?? "",
      'position': position?? "",
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'],
      name: map['name'],
      position: map['position'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));

  @override
  String toString() => 'Team(id: $id, name: $name, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Team &&
      other.id == id &&
      other.name == name &&
      other.position == position;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ position.hashCode;
}

class Links {
  final List<String> explorer;
  final List<String> facebook;
  final List<String> reddit;
  final List<String> source_code;
  final List<String> website;
  final List<String> youtube;
  Links({
    required this.explorer,
    required this.facebook,
    required this.reddit,
    required this.source_code,
    required this.website,
    required this.youtube,
  });

  Links copyWith({
    List<String>? explorer,
    List<String>? facebook,
    List<String>? reddit,
    List<String>? source_code,
    List<String>? website,
    List<String>? youtube,
  }) {
    return Links(
      explorer: explorer ?? this.explorer,
      facebook: facebook ?? this.facebook,
      reddit: reddit ?? this.reddit,
      source_code: source_code ?? this.source_code,
      website: website ?? this.website,
      youtube: youtube ?? this.youtube,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'explorer': explorer?? "",
      'facebook': facebook?? "",
      'reddit': reddit?? "",
      'source_code': source_code?? "",
      'website': website?? "",
      'youtube': youtube?? "",
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      explorer: List<String>.from(map['explorer']),
      facebook: List<String>.from(map['facebook']),
      reddit: List<String>.from(map['reddit']),
      source_code: List<String>.from(map['source_code']),
      website: List<String>.from(map['website']),
      youtube: List<String>.from(map['youtube']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Links(explorer: $explorer, facebook: $facebook, reddit: $reddit, source_code: $source_code, website: $website, youtube: $youtube)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Links &&
      listEquals(other.explorer, explorer) &&
      listEquals(other.facebook, facebook) &&
      listEquals(other.reddit, reddit) &&
      listEquals(other.source_code, source_code) &&
      listEquals(other.website, website) &&
      listEquals(other.youtube, youtube);
  }

  @override
  int get hashCode {
    return explorer.hashCode ^
      facebook.hashCode ^
      reddit.hashCode ^
      source_code.hashCode ^
      website.hashCode ^
      youtube.hashCode;
  }
}

class Links_extended {
  final String url;
  final String type;
  Links_extended({
    required this.url,
    required this.type,
  });

  Links_extended copyWith({
    String? url,
    String? type,
  }) {
    return Links_extended(
      url: url ?? this.url,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'type': type,
    };
  }

  factory Links_extended.fromMap(Map<String, dynamic> map) {
    return Links_extended(
      url: map['url']?? "",
      type: map['type']?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Links_extended.fromJson(String source) => Links_extended.fromMap(json.decode(source));

  @override
  String toString() => 'Links_extended(url: $url, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Links_extended &&
      other.url == url &&
      other.type == type;
  }

  @override
  int get hashCode => url.hashCode ^ type.hashCode;
}

class Whitepaper {
  final String link;
  final String thumbnail;
  Whitepaper({
    required this.link,
    required this.thumbnail,
  });

  Whitepaper copyWith({
    String? link,
    String? thumbnail,
  }) {
    return Whitepaper(
      link: link ?? this.link,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'thumbnail': thumbnail,
    };
  }

  factory Whitepaper.fromMap(Map<String, dynamic> map) {
    return Whitepaper(
      link: map['link']?? "",
      thumbnail: map['thumbnail']?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Whitepaper.fromJson(String source) => Whitepaper.fromMap(json.decode(source));

  @override
  String toString() => 'Whitepaper(link: $link, thumbnail: $thumbnail)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Whitepaper &&
      other.link == link &&
      other.thumbnail == thumbnail;
  }

  @override
  int get hashCode => link.hashCode ^ thumbnail.hashCode;
}