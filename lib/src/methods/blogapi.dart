import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
//import 'package:internship_subspace/src/methods/dbmethods.dart';
import 'package:internship_subspace/src/models/blogmodel.dart';

class ApiServices {
  final String _url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String _adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
  Future<List<Blog>> fetchBlogsFromAPI() async {
    List<Blog> tempbloglists = [];
    try {
      final response = await http.get(Uri.parse(_url), headers: {
        'x-hasura-admin-secret': _adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        final result =
            jsonDecode(jsonEncode(jsonDecode(response.body)['blogs']));

        for (var i = 0; i < result.length; i++) {
          Blog b = Blog.fromMap(result[i]);
          /*try {
            var i=_db.insert(b.toMap());
          } catch (e) {
            print(await _db.queryRowCount());
          }*/
          tempbloglists.add(b);
        }
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
    }
    return tempbloglists;
  }
}

final blogProvider = Provider<ApiServices>((ref) => ApiServices());
final blogDataProvider = FutureProvider<List<Blog>>((ref) async {
  return ref.watch(blogProvider).fetchBlogsFromAPI();
});
