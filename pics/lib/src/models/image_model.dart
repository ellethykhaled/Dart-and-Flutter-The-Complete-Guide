class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> parsedString)
      : id = parsedString['id'],
        url = parsedString['url'],
        title = parsedString['title'];
}
