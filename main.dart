import 'dart:io';
import 'trip.dart';
import 'activity.dart';

void main() {
  List<Trip> trips = [];

  while (true) {
    print('Travel Planner');
    print('1. Add Trip');
    print('2. View Trips');
    print('3. Add Activity to Trip');
    print('4. View Itinerary of Trip');

    print('5. Remove Trip');
    print('6. Remove Activity from Trip');
    print('7. Exit');
    print('Choose an option:');
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        addTrip(trips);
        break;
      case '2':
        viewTrips(trips);
        break;
      case '3':
        addActivityToTrip(trips);
        break;
      case '4':
        viewItinerary(trips);
        break;
      case '5':
        removeTrip(trips);
        break;
      case '6':
        removeActivityFromTrip(trips);
        break;
      case '7':
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void addTrip(List<Trip> trips) {
  print('Enter trip name:');
  String tripName = stdin.readLineSync()!;
  print('Enter start date:');
  String startDate = stdin.readLineSync()!;
  print('Enter end date:');
  String endDate = stdin.readLineSync()!;
  print('Enter destination:');
  String destination = stdin.readLineSync()!;
  trips.add(Trip(tripName, startDate, endDate, destination));
  print('Trip added successfully.');
}

void viewTrips(List<Trip> trips) {
  if (trips.isEmpty) {
    print('No trips planned.');
    return;
  }
  for (var trip in trips) {
    print(trip);
  }
}

void addActivityToTrip(List<Trip> trips) {
  print('Enter trip name:');
  String tripName = stdin.readLineSync()!;
  Trip? trip = findTripByName(trips, tripName);
  if (trip == null) {
    print('Trip not found.');
    return;
  }
  print('Enter activity name:');
  String activityName = stdin.readLineSync()!;
  print('Enter date:');
  String date = stdin.readLineSync()!;
  print('Enter time:');
  String time = stdin.readLineSync()!;
  print('Enter description:');
  String description = stdin.readLineSync()!;
  trip.addActivity(Activity(activityName, date, time, description));
  print('Activity added successfully.');
}

void viewItinerary(List<Trip> trips) {
  print('Enter trip name:');
  String tripName = stdin.readLineSync()!;
  Trip? trip = findTripByName(trips, tripName);
  if (trip == null) {
    print('Trip not found.');
    return;
  }
  trip.viewItinerary();
}

void removeTrip(List<Trip> trips) {
  print('Enter trip name:');
  String tripName = stdin.readLineSync()!;
  trips.removeWhere((trip) => trip.tripName == tripName);
  print('Trip removed successfully.');
}

void removeActivityFromTrip(List<Trip> trips) {
  print('Enter trip name:');
  String tripName = stdin.readLineSync()!;
  Trip? trip = findTripByName(trips, tripName);
  if (trip == null) {
    print('Trip not found.');
    return;
  }
  print('Enter activity name:');
  String activityName = stdin.readLineSync()!;
  trip.removeActivity(activityName);
  print('Activity removed successfully.');
}

Trip? findTripByName(List<Trip> trips, String tripName) {
  try {
    return trips.firstWhere((trip) => trip.tripName == tripName);
  } catch (e) {
    return null;
  }
}
