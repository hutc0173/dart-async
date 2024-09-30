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
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
