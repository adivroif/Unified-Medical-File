import '../SuitCategories.dart';

class Treatmentboundary {
  int treatmentId;
  String treatmentName;
  String treatmentDescription;
  double treatmentPrice;
  List<SuitCategories> suitCategories;


  Treatmentboundary({
    required this.treatmentId,
    required this.treatmentName,
    required this.treatmentDescription,
    required this.treatmentPrice,
    required this.suitCategories,
  });

  factory Treatmentboundary.fromJson(Map<String, dynamic> json) {
    return Treatmentboundary(
      treatmentId: json['treatmentId'],
      treatmentName: json['treatmentName'],
      treatmentDescription: json['treatmentDescription'],
      treatmentPrice: json['treatmentPrice'],
      suitCategories: json['SuitCategories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'treatmentId':treatmentId,
      'treatmentName': treatmentName,
      'treatmentDescription': treatmentDescription,
      'treatmentPrice': treatmentPrice,
      'suitCategories': suitCategories,
    };

  }
}