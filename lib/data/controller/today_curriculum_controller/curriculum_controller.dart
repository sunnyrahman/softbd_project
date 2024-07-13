import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'curriculum_repository.dart';
import 'model/curriculum_model/today_curriculum_list_model.dart';

class TodayCurriculumController extends GetxController implements GetxService {
  final SharedPreferences prefs;
  TodayCurriculumController({required this.prefs});
  static TodayCurriculumController get current => Get.find();
  final TodayCurriculumRepository repository = TodayCurriculumRepository();
  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  final bool _hasError = false;
  bool get hasError => _hasError;

  /// Data Clear
  Future<void> dataClear() async {
    curriculumDataList = [];
    // curriculumDataList = null;
  }

  /// Today Curriculum Get list
  List<CurriculumData> curriculumDataList=[];
  Future getTodayCurriculumList(DateTime selectedDate) async {
    try {
      final response = await repository.getTodayCurriculumList();
      curriculumDataList = [];
      if(response.data!=null){
        response.data!.map((e) {
          DateTime serverDateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(e.date!) * 1000);
          if(serverDateTime.day==selectedDate.day && serverDateTime.month==selectedDate.month && serverDateTime.year==selectedDate.year){
            curriculumDataList.add(e);
          }
        }).toList();
      }
      update();
    } catch (e, s) {
      log('Error: ', error: e, stackTrace: s);
    }
  }




}
