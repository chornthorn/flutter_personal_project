class BaseRes {

  BaseResPaging paging;
  int statusCode;
  String statusMessage;
  String encryptFlag;
  String encryptMsg;

  BaseRes({this.paging, this.statusCode, this.statusMessage, this.encryptFlag, this.encryptMsg});

  BaseRes.fromJson(Map<String, dynamic> json) {
    paging = json['paging'] != null ? new BaseResPaging.fromJson(json['paging']) : null;
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    encryptFlag = json['encrypt_flag'];
    encryptMsg = json['encrypt_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    data['status_code'] = this.statusCode;
    data['status_message'] = this.statusMessage;
    data['encrypt_flag'] = this.encryptFlag;
    data['encrypt_msg'] = this.encryptMsg;
    return data;
  }
}

class BaseResPaging {
  int pageNo;
  int pageSize;
  int totalPage;
  int totalRecord;

  BaseResPaging({this.pageNo, this.pageSize, this.totalPage, this.totalRecord});

  BaseResPaging.fromJson(Map<String, dynamic> json) {
    pageNo = json['page_no'];
    pageSize = json['page_size'];
    totalPage = json['total_page'];
    totalRecord = json['total_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_no'] = this.pageNo;
    data['page_size'] = this.pageSize;
    data['total_page'] = this.totalPage;
    data['total_record'] = this.totalRecord;
    return data;
  }
}
