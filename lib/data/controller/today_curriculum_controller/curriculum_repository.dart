import 'dart:developer';
import '../../../http_cleint/api_helper.dart';
import '../../../http_cleint/app_config.dart';
import '../../../http_cleint/request_handler.dart';
import 'model/curriculum_model/today_curriculum_list_model.dart';

class TodayCurriculumRepository extends ApiHelper{


  /// Today Curriculum Get list
  Future<TodayCurriculumListModel> getTodayCurriculumList() async{
    try{
      final response = await requestHandler.get(AppConfig.todayCurriculumList.url);
      if(response.statusCode == 200){
        return TodayCurriculumListModel.fromJson(response.data);
      } else{
        throw RequestException(
          url: AppConfig.todayCurriculumList.url,
          method: '#GET',
          res: response,
          error: response.data['message'],
          msg: response.data['message'],
          trace: StackTrace.current,
        );
      }
    } catch(e, s){
      log('Error: ', error: e, stackTrace: s);
      rethrow;
    }
  }




}
