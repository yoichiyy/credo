import 'dart:convert';
import 'package:gsheets/gsheets.dart';
import 'package:http/http.dart' as http;
import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/models/form_models/feedback_form.dart';

class MorningFeedbackFormController {
  String _feedbackFormAPIURL = sheetURL;
  // "https://script.google.com/macros/s/AKfycbyjc_8JV59ZLEOx_zgu0yz5ME9rFs5ZwIBSHIc4acDMLGlUW77grcOdyK0vvrMr9kLv/exec";

  final credentials = r"""{
  "type": "service_account",
  "project_id": "submitform-329820",
  "private_key_id": "7e67995d6a33aca034934f06a8cb9464e1f5bdca",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDjhA7qiDL8eGhB\nDNIvDJPLb3e63s/TNqALwUOm+zFIuMco/u8z5oxN/2w3hm2Z0HZYXbGMAUbSJOhi\nGyV60TZ/hTHVRSQlddZ5yuALMozOcJLHBsV+DLSOHYxCqMQ+yWm0BPzfP+dPMhNz\naFvEkxNRz1ZvYcWBChk6RJZiVc+wwZ5VECYOT3c4iKXQg2h1OqQDV7EABo3i7Wp0\nZyhGFPpEp6X8PSWX7dbgiHHhtu86Ch1iJvmwDQ80V96Wom+c3VwTrvCXp4Nv4q9K\nV65cUy3t/t4u4RKlAjQvN9X8s/5euuWLS2j7kxY8O9RhEaOTujGnyd7x48MtKI9s\nIHN89LtvAgMBAAECggEAKde+uomD/wTR/6yw9zAz+kUs2vRhenHga2kG3S3zeXFq\nR3LjYUM0aJ/iMjAJ9jDtowDQR3RwpvNcvbZKZVUW1csUSCnoJO+QG2QhYk3QsaLo\ni6wGJFGH3181zYimVvnJ8+665wAktV77Ts1Rm0yFUBV2yxNLNJk73IiCs+EeSl5o\nvSrk873q71JjofR1JYy9zrJ+WicnEVNz1bZ4o/B8SWIHhvhAuRr0Ocf5EbwYr90U\nF0siQEAGCGNYwGiPofqLnXHd88QZDPAhKpsB/2D12FvYHi+GPmeLmXgTmZMiUIxw\n3FVPwrAUsmCfh3+kqcpmLU5Sh1MsOiuiRyHrMe0RWQKBgQD7UT2OtM5jGUu9vqAy\n6EWjxzwj52jFADbOOzy/sjMaImYM3TVIsYWZ6Q6NSSi3ZD82b/ZxFlb+ySfy4C3Q\nD8UhISXNBDyMyQKff9Zl9gVwiVuXsWOGV2v1b/MfkvFkbF/ujAjgJ8ynwvWau3zY\nVSRbU17VUqZvUvPkiqLy8lGvjQKBgQDnwUl3XuFtjnvRp6VAVxMh2P9i8XYP5oEP\n3ndk7943r5k7/GTK1r1AwMJHymwkFU3CgypykR/lCfHQO+WYbKh5/Izusn18/bhH\nICkKf9sQF9Iu71eFKwjf7wAg7873EUkHrMh9fEAax79gnmYK047ZoM5bbEVjCAW3\n+CYNUgcp6wKBgQDPh0iT3U5ImwzmhNF4+ED5e354D5F+jCy1pEkH6zkzrZAjs09a\n1e0DKWaw2ObcedWROGeC/vWbs7RfZSuvkjYwo1S5tXPiteKKn2AGFmBri6Gs4/jR\naMNni6hyPD9FtBCLxetWXscrCV0TBxuS8Mvy9idrdLKnXxKzeKASinNVyQKBgAPm\nheUDbMnaPw09RBO8I29LZqj0pWcJGxz4QowpWVUYmHyg99VOHetMEzkAGCfXT/K5\nIGrDNIU3UKGPkIKrOX6sGHcf++qxnntb+DTcCATSUdBGaPOt0L1sGVV0k8gmu1Ls\nvocWI0IQIJFwuQjvnJTfFvoE7XoINYhuHb3Vppc3AoGAFU0fiEs/roGKyM2bGJs6\nCemJddSYsumk/WGChdWyDsvR9L+ep1rcoTWJ+U2k0bMNKfd8zpatE70gwelfnFVM\nVv5snmFtYQFit2NxAyPsEry4EVVdWOwUow6QftMUABWt+HI9x8sHaam5rkO6iJNw\nq35MPB1r6rs2/AayCbk4cVI=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@submitform-329820.iam.gserviceaccount.com",
  "client_id": "114827053481616630030",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40submitform-329820.iam.gserviceaccount.com"
}""";

  final fileId = "1FdA5g_jCyxPlHX08sRkB1wIrDO_iZFS7AGAJgp9iH2E";
  final chokanSheetId = 0;
  final yukanSheetId = 1960848660;

  Future<bool> submitForm(FeedbackForm feedbackForm) async {
    final gsheets = GSheets(credentials);
    final ss = await gsheets.spreadsheet(fileId);
    final chokanSheet = ss.worksheetById(chokanSheetId);

    // print(chokanSheet.rowCount);
    // print(yukanSheet.rowCount);
    // await chokanSheet.values.insertValue('newよ', column: 2, row: 2);
    // print(await chokanSheet.values.value(column: 2, row: 2));
    // final cell = await chokanSheet.cells.cell(column: 2, row: 2);
    // print(cell.value);
    // await cell.post('new2');
    // print(cell.value);
    // print(await chokanSheet.values.value(column: 2, row: 2));

    final userResponse = [
      DateTime.now().toIso8601String(),
      feedbackForm.email,
      feedbackForm.feeling,
      feedbackForm.focus,
      feedbackForm.knowledge,
      feedbackForm.motivation,
      feedbackForm.bridging,
      feedbackForm.section,
      feedbackForm.video,
    ];
    return chokanSheet.values.appendRow(userResponse);
  }

  // Future<bool> submitForm(MorningFeedbackFormData feedbackForm) async {
  //   try {
  //     print("start submitting the form");
  //     Map body = feedbackForm.toJson();
  //     print("Json Successed");
  //     http.Response response = await http.post(
  //       Uri.parse(_feedbackFormAPIURL),
  //       body: body,
  //     );
  //     print("http successed");

  //     return (response.statusCode == 302);
  //   } catch (e) {
  //     print("error");
  //     print(e);
  //   }
  // }
}
