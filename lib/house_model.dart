class HouseModel {
  final String title;
  final String subtitle;
  final int bedrooms;
  final int bathrooms;
  final String description;
  final String imageUrl;
  final double rentAmount;
  final String ownerName;

  HouseModel({
    required this.title,
    required this.subtitle,
    this.bedrooms = 0,
    this.bathrooms = 0,
    required this.description,
    required this.imageUrl,
    required this.rentAmount,
    required this.ownerName,
  });

  // Factory constructor for creating a House object from JSON
  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      title: json['title'],
      subtitle: json['subtitle'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      rentAmount: json['rentAmount'].toDouble(),
      ownerName: json['ownerName'],
    );
  }

  // Method for converting a House object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'description': description,
      'imageUrl': imageUrl,
      'rentAmount': rentAmount,
      'ownerName': ownerName,
    };
  }
}
