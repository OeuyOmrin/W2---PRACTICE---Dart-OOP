
class BankAccount {
    // TODO

    //create 3 attributes to classify each bankaccount
    final int _accountId; 
    final String _accountOwner; 
    double _balance; 


    //initialize the bank amount to create a balance of 0
    BankAccount(this._accountId, this._accountOwner) : _balance = 0; 

    // created these getter methods
    int get accountId => _accountId;
    String get accountOwner => _accountOwner; 
    double get balance => _balance; 

    //creating a method to add credit and throws an expection if the input ammount is negative
    void credit(double amount) {
      if (amount <= 0) throw Exception('Credit amount must be positive. ');
      _balance += amount; 
    }


    //creates a withdraw methord with 2 conditions
    // if the amount negative throw an exception 
    // if the balance is less than the withdraw amount throws an exception telling that you don't have enough money. 
    void withdraw(double amount) {
      if (amount <= 0) throw Exception('Credit amount must be positive.');
      if (_balance - amount < 0) {
        throw Exception('Insufficient Balnce for withdrawal!');
      }
      _balance -= amount; 
    }

  
    void printDetails() {
    print('[$_accountId] $_accountOwner — Balance: \$${_balance.toStringAsFixed(2)}');
    }

}

class Bank {
    // TODO
  
  final String _name; 
  final List<BankAccount> _accounts; 

  Bank({required String name})
      : _name = name, 
        _accounts = []; 

  String get name => _name; 
  List<BankAccount> get accounts => List.unmodifiable(_accounts);

  //a  method used to create an account and if the account exists will throw an expetion
  //create a parameter that loops through every account to check wheither the account already exists
  BankAccount createAccount(int accountId, String accountOwner){
    final exists = _accounts.any((acc) => acc.accountId == accountId ); 
    if (exists) {
      throw Exception('Account with ID $accountId already exists!'); 
    }
    final newAccount = BankAccount(accountId, accountOwner); 
    _accounts.add(newAccount); 
    return newAccount; 
  }

}
 
void main() {

   Bank myBank = Bank(name: "CADT Bank");
   BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

   print(ronanAccount.balance); // Balance: $0
   ronanAccount.credit(100);
   print(ronanAccount.balance); // Balance: $100
   ronanAccount.withdraw(50);
   print(ronanAccount.balance); // Balance: $50

   try {
     ronanAccount.withdraw(75); // This will throw an exception
   } catch (e) {
     print(e); // Output: Insufficient balance for withdrawal!
   }

   try {
     myBank.createAccount(100, 'Honlgy'); // This will throw an exception
   } catch (e) {
     print(e); // Output: Account with ID 100 already exists!
   }
}
