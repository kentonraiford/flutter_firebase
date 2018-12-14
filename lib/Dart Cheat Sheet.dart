/*

Conditional Expressions - if condition is true, evaluate expression1 and return it's value. If not, return expression 2.
  int smallNumber = a< b ? a: b
  String nameToPrint = name ?? "Guest User" -> if null print "Guest user"

Functions can be variables
  int rectArea = getArea(10, 5);

Expression in Function: Short hand syntax using the fat arrow
  int getArea(int length, int breadth) => print('The area is ${length * breadth}');

Divide by the initial value's type
  int result = 12 ~/ 4

Exception handling
  1. ON Clause - If you know the type of exception
    try {
      int result = 12 ~/0;
      print('result is $result');
    } on IntegerDivisionByZeroException
    {
      print('Can't divide by zero')
    }

  2. Catch Clause with Exception Object - when you don't know exception name
  try {
      int result = 12 ~/0;
      print('result is $result');
    } catch(e)
    {
      print('The exception thrown is $e')
    }

  3. Stacktrace lets us know the events occurred before Exception was thrown
  try {
      int result = 12 ~/0;
      print('result is $result');
    } catch(e, s)
    {
      print('The exception thrown is $e and Stack Trace is $s')
    }

  4. Finally Clause is executed regardless if there's an error or not
  try {
      int result = 12 ~/0;
      print('result is $result');
    } catch(e)
    {
      print('The exception thrown is $e')
    } finally
    {
      print('This is always executed')
    }

Custom Exception Class
  Need to create a class of exception to make a custom exception.final

  5. Custom Exception
  try {
    depositMoney(-200);
  } catch (e) {
    print(e.errorMessage);
  }



  class DepositException implements Exception
  {
    String errorMessage()
    {
      return 'You cannot enter amount less than 0';
    }
  }

  void depositMoney(int amount)
  {
    if (amount < 0)
    {
      throw DepositException();
    }
  }


Constructors


  void main()
  {
    var student = Student.myCustomContructor();
    student.id = 1
    student.name = "Kenton"
   }

  class Student
  {
    int id;
    String name;

    Student(this.id, this.name); Parameterised Constructor

    Student.myCustomConstructor()
    {
      print('custom Contructor')
    }

    Student.anotherCustomConstructor(this.id, this.name)
    {
      print('${this.name} is studying')
    }
  }


Getter and Setters:

Default Getter and Setter
  void main()
  {
    var student = Student();
    student.name = "Peter" // calling the default Setter to set value.
    print(student.name); // calling the default Getter to set value.

    student.percentage = 438.0; //Calling custom Setter to set value
    print(student.percentage); //Calling Custom Getter to get value
  }

  class Student
  {
    String name; //Instance default getter and setter

    double _percent; -> underscore makes it private for its own library

    //Instance variable with custom setter
    void set percentage(double marksSecured) => percent = (marksSecured / 500) * 100;

    //Instance variable with custom getter
    double get percentage => _percent;

  }


Inheritance
  class Dog extends Animal // inherets properties of Animal class (super / parent class
  { }

Single inheritance: Class B -> Class A // Class B inherits from Class A

Multi-level Inheritance: Class C -> Class B -> Class A // Class C inherits from Class B inherits from Class A

Hierarchial Inheritance: Class C & B inherit from Class A



High-Order Function
void main() {

	// Example One: Passing Function to Higher-Order Function
	Function addNumbers = (a, b) => print(a + b);
	someOtherFunction("Hello", addNumbers);


	// Example Two: Receiving Function from Higher-Order Function
	var myFunc = taskToPerform();
	print(myFunc(10));      // multiplyFour(10)         // number * 4       // 10 * 4       // OUTPUT: 40
  }

  // Example one: Accepts function as parameter
  void someOtherFunction(String message, Function myFunction) {       // Higher-Order Function

    print(message);
    myFunction(2, 4);       // addNumbers(2, 4)    // print(a + b);   // print(2 + 4)       // OUTPUT: 6
  }


  // Example two: Returns a function
  Function taskToPerform() {       // Higher-Order Function

    Function multiplyFour = (int number) => number * 4;
    return multiplyFour;
  }


Loop through Lists
  numbersList.forEach((element) => print(element)); // Using Lambda function

Growable Lists
  List<int> numbersList = List();
  numbersList.add(1);

Fixed Lists
  List<int> numbersList = List(5);
  numbersList[0] = 1;

Sets - unordered collection of unique items (no duplicates). Can't get elements by index.
  Set<String> countries = Set.from(["USA", "India", "China"])

Map - unordered collection of key-value pair also known as hash or dictionary.
  HashMap - implementation of Map based on hash-table and elements are identified by their hash value.

  Map<String, String> fruits = Map();
  fruits["apple"] = "red";

  fruits.forEach((key, value)) => print("key: $key and value: $value");
  fruits.containsKey("apple");
  fruits.update("apple", (value) => "green");
  fruits.remove("apple");

  //Using literals
  Map<String, int> countryDialingCode = {
    "USA": 1,
    "Pakistan": 92
  };










 */