import 'package:http/http.dart';

void findAll() async {
  final Response response =
      await get(Uri.parse('http://172.23.32.1:8080/transactions'));
  print(response.body);
}
