import '../SuitCategories.dart';

class TreatmentBoundary {
  int treatmentId;
  String treatmentName;
  String treatmentDescription;
  double treatmentPrice;
  List<SuitCategories> suitCategories;


  TreatmentBoundary({
    required this.treatmentId,
    required this.treatmentName,
    required this.treatmentDescription,
    required this.treatmentPrice,
    required this.suitCategories,
  });

  factory TreatmentBoundary.fromJson(Map<String, dynamic> json) {
    return TreatmentBoundary(
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