import 'package:url_launcher/url_launcher.dart';



String getString(List list) {
  String result = '';
  for (var value in list) {
    result = '$result,$value,';
  }
  return result;
}

List<String> getImages(String string) {
  return string.split(',');
}
///*****************************************************************************
///
/// URL LAUNCHER
///
/// ****************************************************************************
///
Future<void> launchWebSiteUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))){
    throw 'Could not launch url $url';
  }
}//end method

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

void launchEmailIntent(String mailto , String subject) {
  final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mailto,
      query: encodeQueryParameters(<String, String>{
        'subject' : subject
      })

  );

  launchUrl(emailLaunchUri);
}//end method