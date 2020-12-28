import 'package:auth_repository/index.dart';
import 'package:data_repository/src/base_rul.dart';
import 'package:data_repository/src/classes/errors/common_error.dart';
import 'package:data_repository/src/models/opportunity/opportunity.dart';
import 'package:dio/dio.dart';

class OpportunityApiProvider{

  Future<List<Opportunity>> getAllOpportunities() async {
    try {
      var response = await AppApi.dio.get('/api/opportunity',
          options: Options(headers: {
            'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFhOTVhYzQxOGZlMGFkNWZlMmViMmY4MGE1ZmU3YjllZmU3NWEzOTc0OWE0M2JiOTM4NmRmYzNmNGU4NzFkMTVhNmI4MzQ0N2QxZTdmOTUiLCJpYXQiOjE1OTQ3Mzg2NzgsIm5iZiI6MTU5NDczODY3OCwiZXhwIjoxNjI2Mjc0Njc4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.pP1lq-gDIXtDXinTc1PxUnp5XrkFgQU0R252QDaXyCTdieM4AIA4z_UhfNGec5vC0HFYQvE64bvjVo2pSeL1K7BEzq-WcFF-g8yX1ppkkUhZF52UMJnxUpl7I_2Xwxno3iktQUUf1sooU8AON4gHSFXF11AC1fb8c8_HUhJq6UqSUWRKuYKB1Qrr_U9ceQoO54EVCFyt6HX8qLW42_M4epXxoc-lvGOyPHXvP9vSUpvF7hYpGKZlR-rLgmMxr6Wsf8FiZqbn5KhgdrXUJgpl0_GmRC2Hvlnu8JaOMY8ZqKNg8VeIqNIBugW16kWYA07rJcN6vCbNY16oFdZxekE_Hi6vigbMJFccWiViFNaTw6kKNqSAxlebryW11DOxthkYd3Ipm3QdNZxojAd2hhXOEgbm3IdXhc7-XlU_svwilE1aVX7NBg4pXXlya1YocpgdJzAp0uMAcukUBxwzFfHjKN-XHqay95gkqTb2vYL-f5gPAc43zXLFPIzP4TYe9sgFf_bJFT6yga7wphKg5EqOx1VKKkPIa5X-kR5Twn8GfiwgizkYyNXA4k1geLuJK1L8ZPeQIMdXiBlgYCcp_5w7NfuWNvh2eQRbjsBAkaYnNZqopMb9GTygonKKzYBgzEGIDXF-QeEL2Pm9cVZlWjWKsvgTA-fELOR69FQmU9WSuPE'
          }));
      List _temp = response.data['data'];
      List<Opportunity> _opportunities = _temp
          .map((opportunity) => Opportunity.fromJson(opportunity))
          .toList();
      return _opportunities;
    } on DioError catch (e) {
      throw showNetworkError(e.error);
    }
  }

}