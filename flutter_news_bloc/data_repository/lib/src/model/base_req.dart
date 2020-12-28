class BaseReq {
  BaseReqPaging paging;

  BaseReq({this.paging});

  BaseReq.fromJson(Map<String, dynamic> json) {
    paging =
    json['paging'] != null ? new BaseReqPaging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    return data;
  }
}

class BaseReqPaging {
  int pageNo;
  int pageSize;
  int totalPage;
  int totalRecord;

  BaseReqPaging({this.pageNo, this.pageSize, this.totalPage, this.totalRecord});

  BaseReqPaging.fromJson(Map<String, dynamic> json) {
    pageNo = json['pageNo'];
    pageSize = json['pageSize'];
    totalPage = json['totalPage'];
    totalRecord = json['totalRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNo'] = this.pageNo;
    data['pageSize'] = this.pageSize;
    data['totalPage'] = this.totalPage;
    data['totalRecord'] = this.totalRecord;
    return data;
  }
}
