import 'package:hybrid_4/hybrid_4.dart' as hybrid_4;

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() async {
  await getUsers();
}

Future<void> getUsers() async {
  final url = 'https://random-data-api.com/api/users/random_user?size=8';
  print('Fetching data from: $url');

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Data fetched successfully: ${response.body}');

      List<dynamic> users = convert.jsonDecode(response.body);

      for (var user in users) {
        print(
            'UID: ${user['uid']}, Name: ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (err) {
    print('An error occurred: $err');
  }
}
