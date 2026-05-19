import 'package:zalameha/core/resource_manager/app_strings.dart';

class JobModel {
  const JobModel({
    required this.title,
    required this.subtitle,
    required this.location,
    required this.type,
  });

  final String title;
  final String subtitle;
  final String location;
  final String type;
}

const List<JobModel> homeJobs = [
  JobModel(
    title: StringsManager.salesRepresentativeTwoYears,
    subtitle: StringsManager.paperPlaneTechnology,
    location: StringsManager.ammanJabalAlHussein,
    type: StringsManager.fullTime,
  ),
  JobModel(
    title: StringsManager.secretary,
    subtitle: StringsManager.drAzmiClinic,
    location: StringsManager.ammanFifthCircle,
    type: StringsManager.fullTime,
  ),
  JobModel(
    title: StringsManager.shawarmaChefFiveYears,
    subtitle: StringsManager.alasalaRestaurant,
    location: StringsManager.ammanAbuAlanda,
    type: StringsManager.fullTime,
  ),
];
