enum TravelClass {
  economy, 
  business,
  first,
}

// creating a passenger class
class Passenger {
  String name; 
  int age;

  Passenger(this.name, this.age); 
}

//create another destination class
class Destination {
  String city; 
  String country; 

  Destination(this.city, this.country );
}

class TravelTicket {
  Passenger passenger; 
  Destination destination; 
  TravelClass travelClass;

  TravelTicket(this.passenger, this.destination, this.travelClass);


  void displayTicket() {
    print("Passenger: ${passenger.name}");
    print("Age: ${passenger.age}");
    print("Destination: ${destination.city}, ${destination.country}");
    print("Class: ${travelClass.name}");
  }
}

void main() {
  Passenger p1 = Passenger("Nirmo", 30);
  Destination d1 = Destination("Cambodia", "Phnom Penh");

  TravelTicket ticket1 =
      TravelTicket(p1, d1, TravelClass.business);

  ticket1.displayTicket();
}