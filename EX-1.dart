enum Skill { FLUTTER, DART, OTHER }

class Address {

  //creating private attributes for class address 
  final String  _street; 
  final String _city; 
  final String _zipCode; 

  Address(this._street, this._city, this._zipCode); 

  String get street => _street; 
  String get city => _city; 
  String get zipCode => _zipCode; 

  @override
  String toString() => '$_street, $_city $_zipCode';
}

class Employee {

  String _name;
  double _baseSalary;
  List<Skill> _skills; //creating a list to store skills
  Address _address;
  int _yearsOfExperience;   


  Employee(
    this._name, 
    this._baseSalary, 
    this._skills, 
    this._address, 
    this._yearsOfExperience,

  ); 

  //creating a named constructor for mobile Developer 
  Employee.mobileDeveloper({
    required String name, 
    required Address address, 
    required int yearsOfExperience, 
  })  : _name = name, 
        _baseSalary = 40000, 
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address, 
        _yearsOfExperience = yearsOfExperience;


  //creating another named constructor for data analyst
  Employee.dataAnalyst({
    required String name, 
    required Address address, 
  })  : _name = name, 
        _baseSalary = 40000, 
        _skills = [Skill.OTHER], 
        _address = address, 
        _yearsOfExperience = 0;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;


  
  // creating a method to calculate salary method
  double computeSalary() {
    double salary = 40000; 
    
    salary += _yearsOfExperience * 2000; 

    for (final skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER: 
          salary += 5000; 
          break; 
        case Skill.DART: 
          salary  += 3000; 
          break; 
        case Skill.OTHER: 
          salary += 1000; 
          break; 
      }
    }


    return salary; 

  }



  void printDetails() {

    print('==================================');
    print('Employee     : $_name');
    print('Address     : $_address');
    print('Years Of Experience     : $_yearsOfExperience year(s)');
    print('Skills     : ${_skills.map((s) => s.name).join(', ')}');
    print('Base Salary     : \$${_baseSalary.toStringAsFixed(2)}');
    print('Employee     : \$${computeSalary().toStringAsFixed(2)}');
    print('==================================');
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000, 
    [Skill.FLUTTER, Skill.DART, Skill.OTHER], 
    Address('Toul Kork', 'Phnom Penh', '12000'), 
    5,
    );
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(
    name: 'Ronan',
    address: Address('Street 101', 'Siem Reap', '17000'),
    yearsOfExperience: 3,
    );
  emp2.printDetails();

  var emp3 = Employee.dataAnalyst(
    name: 'Dara',
    address: Address('Street 404', 'Kompong Som', '11203'),
  );
  emp3.printDetails(); 


  //using the getters 
  print('\nAccessing via getters: '); 
  print('Name: ${emp1.name}');
  print('City: ${emp1.address.city}');
  print('Years of exp: ${emp1.yearsOfExperience}');
  print('Skills: ${emp1.skills}');

}