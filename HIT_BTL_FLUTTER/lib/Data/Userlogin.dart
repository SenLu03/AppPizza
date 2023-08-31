class AccessToken {
  final String tokenType;
  final String accessToken;
  final String refreshToken;
  final String id;
  final List<Authority> authorities;

  AccessToken({
    required this.tokenType,
    required this.accessToken,
    required this.refreshToken,
    required this.id,
    required this.authorities,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    List<Authority> authorityList = [];
    if (json['authorities'] != null) {
      for (var authorityJson in json['authorities']) {
        authorityList.add(Authority.fromJson(authorityJson));
      }
    }

    return AccessToken(
      tokenType: json['tokenType'] as String? ?? '',  // Kiểm tra null và gán giá trị mặc định nếu cần
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      id: json['id'] as String? ?? '',
      authorities: authorityList,
    );
  }
}

class Authority {
  final String authority;

  Authority({required this.authority});

  factory Authority.fromJson(Map<String, dynamic> json) {
    return Authority(
      authority: json['authority'],
    );
  }
}
