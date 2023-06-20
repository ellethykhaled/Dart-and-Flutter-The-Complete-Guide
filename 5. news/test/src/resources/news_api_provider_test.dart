import 'package:http/testing.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final newsApi = NewsApiProvider();

    final mockData = [1, 2, 3, 4];

    newsApi.client = MockClient((request) async {
      return Response(json.encode(mockData), 200);
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, mockData);
  });

  test('FetchItem returns an Item Model', () async {
    final newsApi = NewsApiProvider();

    final mockData = {
      'id': 123,
      "deleted": true,
      "type": 'typey',
      "by": 'person',
      "time": 15,
      "text": 'texty',
      "dead": false,
      "parent": 20,
      "kids": [1, 2, 3],
      "url": 'www.google.com',
      "score": 50,
      "title": 'A title',
      "descendants": 5,
    };
    final mockItem = ItemModel.fromJson(mockData);

    newsApi.client = MockClient((request) async {
      return Response(jsonEncode(mockData), 200);
    });

    final item = await newsApi.fetchItem(999);

    expect(item.id, mockItem.id);
    expect(item.deleted, mockItem.deleted);
    expect(item.type, mockItem.type);
    expect(item.by, mockItem.by);
    expect(item.time, mockItem.time);
    expect(item.dead, mockItem.dead);
    expect(item.parent, mockItem.parent);
    expect(item.kids, mockItem.kids);
    expect(item.url, mockItem.url);
    expect(item.score, mockItem.score);
    expect(item.title, mockItem.title);
    expect(item.descendants, mockItem.descendants);
  });
}
