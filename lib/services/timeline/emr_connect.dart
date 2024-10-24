import 'package:get/get.dart';
import 'package:privata/app/modules/init/controllers/init_controller.dart';
import 'package:privata/utils/constants_keys.dart';
import '../../utils/constants_connect.dart';

class EMRConnect extends GetConnect {
  final InitController _initC;
  late final Map<String, String> headers;

  EMRConnect(this._initC) {
    final token = _initC.localStorage.read<String>(ConstantsKeys.authToken);
    headers = {
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = token;
    }
  }

  @override
  String? get baseUrl => ConstantsConnect.endPointBaseUrl;

  Future<Response> getDetailEMR(Map<String, dynamic> query) => get(
        'KMrs',
        headers: headers,
        query: query,
      );

  Future<Response> searchDiagnosesICD10s(String keyword) => get(
        'ICD10s/getByKeyword',
        headers: headers,
        query: {
          'keyword': keyword,
        },
      );

//! BODY addDiagnose
// JsonObject jo = new JsonObject();
//         jo.addProperty("keyword", keyword);
//         jo.addProperty("isICD10", isICD10);
//         jo.addProperty("id", id);

//         //name
//         JsonArray jsonArray = new JsonArray();
//         jsonArray.add(jo);

//         JsonObject jsonObject = new JsonObject();
//         jsonObject.addProperty("mrNo", mrNo);
//         jsonObject.addProperty("hospitalId", hospitalId);
//         jsonObject.addProperty("patientId", patientId);
//         jsonObject.addProperty("createdName", strUserName);
//         jsonObject.addProperty("createdId", createdId);
//         jsonObject.addProperty("practiceId", practiceId);
//         jsonObject.addProperty("appointId", appointId);
//         jsonObject.addProperty("mrId", mrId);
//         jsonObject.addProperty("createdAt", currentDateandTime);
//         jsonObject.add("name", jsonArray);

  Future<Response> addDiagnoses(Map<String, dynamic> body) => post(
        'KDiagnoses',
        body,
        headers: headers,
      );

  //! BODY coretDiagnoses
  // String diagId = lsDiagnoseId.get(i);
  //       Log.d("", "diagId "+diagId);
  //       JsonObject jsonObject = new JsonObject();
  //       jsonObject.addProperty("streakId", strUserId);
  //       jsonObject.addProperty("streakName", strUserName);
  Future<Response> coretDiagnose({
    required String id,
    required Map<String, dynamic> body,
  }) =>
      put(
        'KDiagnoses/$id/streak',
        body,
        headers: headers,
      );

  //! QUERY searchProcedures
  // JsonObject joItem = new JsonObject();
  //       joItem.addProperty("exists", false);

  //       JsonObject joPoli = new JsonObject();
  //       joPoli.add("eq", null);

  //       JsonObject joP = new JsonObject();
  //       joP.add("poliId", joPoli);

  //       JsonObject joNmPoli = new JsonObject();
  //       joNmPoli.addProperty("poliId.nmPoli", "Umum");

  //       JsonArray jaOr = new JsonArray();
  //       jaOr.add(joP);
  //       jaOr.add(joNmPoli);

  //       JsonObject joName = new JsonObject();
  //       joName.addProperty("like", keyword);
  //       joName.addProperty("options", "i");

  //       JsonObject jsonObject = new JsonObject();
  //       jsonObject.addProperty("hospitalId", strRsId);
  //       // jsonObject.add("itemsUsed.id", joItem);
  //       jsonObject.add("or", jaOr);
  //       jsonObject.add("name", joName);

  //       JsonObject jWhere = new JsonObject();
  //       jWhere.add("where", jsonObject);
  Future<Response> searchProcedures(Map<String, dynamic> query) => get(
        'KProcedures',
        headers: headers,
        query: query,
      );

  // Cek Ketersediaan Data Prosedure
  Future<Response> countProcedures(Map<String, dynamic> query) => get(
        'KProcedures/count',
        headers: headers,
        query: query,

        //! Untuk catatan key dari versi android
        // query: {
        //   'where': query,
        // },
      );

  //! Kode body saveProcedures dari android
  // if (jaProcedures.length() == 0){
  //           PublicMethod.showMessage(EMRAddTindakan.this, "Tidak ada tindakan yang bisa disimpan", new DialogInterface.OnClickListener() {
  //               @Override
  //               public void onClick(DialogInterface dialog, int which) {
  //                   dialog.dismiss();
  //               }
  //           });
  //           return;
  //       }

  //       JsonArray ja = new JsonArray();

  //       for (int i=0; i<jaProcedures.length(); i++){
  //           JsonArray jItemsUsed = new JsonArray();

  //           JsonObject jo = new JsonObject();
  //           jo.addProperty("mrNo", strNoMr);
  //           jo.addProperty("hospitalId", strRsId);
  //           jo.addProperty("patientId", strPatientId);
  //           jo.addProperty("createdName", jaProcedures.optJSONObject(i).optString("createdName"));
  //           jo.addProperty("createdId", jaProcedures.optJSONObject(i).optString("createdId"));
  //           jo.addProperty("practiceId", strPracticeId);
  //           jo.addProperty("appointId", strAppointId);
  //           jo.addProperty("mrId", strMrId);
  //           jo.addProperty("createdAt", strCreatedAt);
  //           jo.addProperty("procedureName", jaProcedures.optJSONObject(i).optString("name"));
  //           jo.add("itemsUsed",jItemsUsed);
  //           jo.addProperty("basicFee", jaProcedures.optJSONObject(i).optInt("basicFee"));
  //           jo.addProperty("procedureId", jaProcedures.optJSONObject(i).optString("id"));
  //           if (!jaProcedures.optJSONObject(i).isNull("discountFee")){
  //               jo.addProperty("discountFee", 0);
  //           }
  //           else{
  //               jo.addProperty("discountFee", jaProcedures.optJSONObject(i).optInt("id"));
  //           }
  //           jo.addProperty("notes", "");
  //           jo.addProperty("isPriceLock", jaProcedures.optJSONObject(i).optBoolean("isPriceLock"));
  //           int basicFee = jaProcedures.optJSONObject(i).optInt("basicFee");
  //           int discountFee = jaProcedures.optJSONObject(i).optInt("discountFee");
  //           jo.addProperty("totalFee", basicFee-discountFee);
  //           jo.addProperty("isDb", true);

  //           ja.add(jo);

  //       }
  Future<Response> saveProcedures(Map<String, dynamic> body) => post(
        'KMrProcedures/newPostProcedureDetail',
        body,
        headers: headers,
      );

  //! BODY coretProcedure
  // JsonObject jo = new JsonObject();
  //       jo.addProperty("streakId", streakId);
  //       jo.addProperty("streakName", streakName);

  //       try {
  //           jsonArray.optJSONObject(intPosition).put("streakId", streakId);
  //           jsonArray.optJSONObject(intPosition).put("streakName", streakName);
  //       } catch (JSONException e) {
  //           e.printStackTrace();
  //       }
  Future<Response> coretProcedure({
    required String id,
    required Map<String, dynamic> body,
  }) =>
      put(
        'KMrProcedures/$id/streak',
        body,
        headers: headers,
      );

  Future<Response> timelineEMRByPatient(Map<String, dynamic> query) => get(
        'KMrs',
        headers: headers,
        query: query,
      );
}
