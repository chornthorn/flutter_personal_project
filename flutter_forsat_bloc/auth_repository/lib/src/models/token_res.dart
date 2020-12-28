class AuthAccessToken {
  Token data;

  AuthAccessToken({this.data});

  AuthAccessToken.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Token.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Token {
  String accessToken;
  String tokenType;
  String expiresAt;

  Token({this.accessToken, this.tokenType, this.expiresAt});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['tokenType'] = this.tokenType;
    data['expiresAt'] = this.expiresAt;
    return data;
  }
}
