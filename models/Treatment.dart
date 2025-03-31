import 'package:untitled2/modelsBoundary/TreatmentBoundary.dart';

import '../SuitCategories.dart';

class Treatment {
  int treatmentId;
  String treatmentName;
  String treatmentDescription;
  double treatmentPrice;
  List<SuitCategories> suitCategories;


  Treatment({
    required this.treatmentId,
    required this.treatmentName,
    required this.treatmentDescription,
    required this.treatmentPrice,
    required this.suitCategories,
  });

  factory Treatment.fromBoundary(TreatmentBoundary boundary) {
    return Treatment(
      treatmentId: boundary.treatmentId,
      treatmentName: boundary.treatmentName,
      treatmentDescription: boundary.treatmentDescription,
      treatmentPrice:boundary.treatmentPrice,
      suitCategories: boundary.suitCategories,
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