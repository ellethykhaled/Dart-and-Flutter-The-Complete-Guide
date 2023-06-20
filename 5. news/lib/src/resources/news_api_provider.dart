import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

const _root = 'hacker-news.firebaseio.com';

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final Uri uri = Uri.https(_root, '/v0/topstories.json');

    final response = await client.get(uri);
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    final Uri uri = Uri.https(_root, '/v0/item/$id.json');

    final response = await client.get(uri);

    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
