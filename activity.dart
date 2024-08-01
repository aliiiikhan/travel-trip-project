class Activity {
  String activityName;
  String date;
  String time;
  String description;

  Activity(this.activityName, this.date, this.time, this.description);

  @override
  String toString() {
    return 'Activity: $activityName, Date: $date, Time: $time, Description: $description';
  }
}
