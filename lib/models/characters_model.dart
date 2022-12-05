
class CharactersModel
{
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;

  CharactersModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl,
});

  factory CharactersModel.fromJson(Map<String , dynamic> jsonData)
  {
    return CharactersModel(
        id: jsonData['id'],
        firstName: jsonData['firstName'],
        lastName: jsonData['lastName'],
        fullName: jsonData['fullName'],
        title: jsonData['title'],
        family: jsonData['family'],
        image: jsonData['image'],
        imageUrl: jsonData['imageUrl'],
    );
  }

}