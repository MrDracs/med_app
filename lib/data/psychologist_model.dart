// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorModel {
  final String name;
  final String position;
  final int averageReview;
  final int totalReviews;
  final String profile;
  DoctorModel({
    required this.name,
    required this.position,
    required this.averageReview,
    required this.totalReviews,
    required this.profile,
  });
}

final List<DoctorModel> expertCounsellors = [
  DoctorModel(
    name: "Olivia Anderson",
    position: "Cognitive Psychologist",
    averageReview: 4,
    totalReviews: 200,
    profile: "assets/docs/doc1.png",
  ),
  DoctorModel(
    name: "Benjamin Campbell",
    position: "Clinical Psychologist",
    averageReview: 3,
    totalReviews: 256,
    profile: "assets/docs/doc2.png",
  ),
];
