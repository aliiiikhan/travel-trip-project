import 'activity.dart';

class Trip {
  String tripName;
  String startDate;
  String endDate;
  String destination;
  List<Activity> activities;

  Trip(this.tripName, this.startDate, this.endDate, this.destination) : activities = [];

  void addActivity(Activity activity) {
    activities.add(activity);
  }

  void removeActivity(String activityName) {
    activities.removeWhere((activity) => activity.activityName == activityName);
  }

  void viewItinerary() {
    print('Itinerary for $tripName:');
    for (var activity in activities) {
      print(activity);
    }
  }

  @override
  String toString() {
    return 'Trip: $tripName, Destination: $destination, Start: $startDate, End: $endDate';
  }
}
