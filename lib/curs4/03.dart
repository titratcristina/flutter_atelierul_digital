import 'package:http/http.dart';

Future<void> main() async {
  final Response response = await get('https://www.worldometers.info/geography/flags-of-the-world/');
  final String data = response.body;

  final List<String> items = data.split('<a href="/img/flags');

  for (final String item in items.skip(1)) {
    const String countryTitlePattern = 'padding-top:10px">';
    final String countryName =
        item.substring(item.indexOf(countryTitlePattern) + countryTitlePattern.length, item.indexOf('</div>'));
    final String flagUrl = 'https://www.worldometers.info/img/flags${item.split('"')[0]}';
    print('$countryName => $flagUrl');
  }
}
