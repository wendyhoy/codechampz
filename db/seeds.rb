# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
DrillGroup.destroy_all
Drill.destroy_all
Solution.destroy_all
StudentDrillGroup.destroy_all
StudentDrill.destroy_all

PASSWORD = 'supersecret'

super_user = User.create(
  first_name: "Dwight",
  last_name: "Schrute",
  email: "beets@dundies.com",
  password: PASSWORD,
  is_admin: true
)

super_student = User.create(
  first_name: "Michael",
  last_name: "Scott",
  email: "boss@dundies.com",
  password: PASSWORD
)

# DRILL GROUP - RUBY STRINGS LEVEL 1
g = DrillGroup.create(
  name: 'Ruby Language',
  description: 'Tests your knowledge of Ruby Language',
  level: 1,
  max_points: 1000,
  user: super_user,
  badge_name: ''
)

# DRILLS - RUBY STRINGS LEVEL 1 - Question 1
d = Drill.create(
  question: 'Ruby is an object oriented general purpose programming language (True or False)',
  drill_group: g
)

Solution.create(
  solution: 'True',
  drill: d
)

# RUBY STRINGS LEVEL 1 - Question 2
d = Drill.create(
  question: 'What will any variable evaluate to if it is of Boolean data type?',
  drill_group: g
)

Solution.create(
  solution: 'True or False',
  drill: d
)


# RUBY STRINGS LEVEL 1 - Question 3
d = Drill.create(
  question: 'Quatation mark (‘ or “) can be used only with what kind of data type?',
  drill_group: g
)


Solution.create(
  solution: 'Strings',
  drill: d
)

# RUBY STRINGS LEVEL 1 - Question 4
d = Drill.create(
  question: 'Ruby is a case-sensitive language - (True or False)',
  drill_group: g
)

Solution.create(
  solution: 'True',
  drill: d
)


# RUBY STRINGS LEVEL 1 - Question 5
d = Drill.create(
  question: 'The == ‘is equal to’ is known as assignment operator (True or False)',
  drill_group: g
)

Solution.create(
  solution: 'False',
  drill: d
)

Solution.create(
  solution: 'It is relational operator',
  drill: d
)


# RUBY STRINGS LEVEL 1 - Question 6
d = Drill.create(
  question: 'What is the library function ‘puts’used for?',
  drill_group: g
)

Solution.create(
  solution: 'prints and then insert a new blank line',
  drill: d
)

# RUBY STRINGS LEVEL 1 - Question 7
d = Drill.create(
  question: 'For getting an input from the user which method is used?',
  drill_group: g
)

Solution.create(
  solution: 'gets.chomp',
  drill: d
)

# RUBY STRINGS LEVEL 1 - Question 8
d = Drill.create(
  question: 'What is the role of ! at the end of the capitalize method?',
  drill_group: g
)

Solution.create(
  solution: 'It modifies the value stored in the variable',
  drill: d
)

Solution.create(
  solution: 'It mutates the value stored in the variable',
  drill: d
)

# RUBY STRINGS LEVEL 1 - Question 9
d = Drill.create(
  question: 'What is the use of .capitalize method?',
  drill_group: g
)

Solution.create(
  solution: 'It capitalizes only the first letter.',
  drill: d
)

# RUBY STRINGS LEVEL 1 - Question 10
d = Drill.create(
  question: 'What is the output of the the given code? puts \'My name is #{Name}\'',
  drill_group: g
)

Solution.create(
  solution: 'Name variable not defined',
  drill: d
)

Solution.create(
  solution: 'name variable not defined',
  drill: d
)

# DRILL GROUP - RUBY LANGUAGE LEVEL 2
g = DrillGroup.create(
  name: 'Ruby Language',
  description: 'Tests your knowledge of Ruby Language',
  level: 2,
  max_points: 1000,
  user: super_user,
  badge_name: ''
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 1
d = Drill.create(
  question: 'Why do we use comments?',
  drill_group: g
)

Solution.create(
  solution: 'For later use to understand the working of the program',
  drill: d
)

Solution.create(
  solution: 'It is an efficient way of programming',
  drill: d
)

Solution.create(
  solution: 'It makes easy for the third person to understand',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 2
d = Drill.create(
  question: 'What is the sequence of ruby strings?',
  drill_group: g
)

Solution.create(
  solution: '8-bit bytes',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 3
d = Drill.create(
  question: 'Objects of which class does the integer from the range -2^30 to 2^(30-1) belong to?',
  drill_group: g
)

Solution.create(
  solution: 'Fixnum',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 4
d = Drill.create(
  question: 'How to comment a single line?',
  drill_group: g
)

Solution.create(
  solution: 'Use #',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 5
d = Drill.create(
  question: '6. What is the output of the given code?
“Ruby”.length #to find the length of given string',
  drill_group: g
)

Solution.create(
  solution: '4',
  drill: d
)


# DRILLS - RUBY STRINGS LEVEL 2 - Question 6
d = Drill.create(
  question: 'The elsif conditional statement is written with an expression (True or False)',
  drill_group: g
)

Solution.create(
  solution: 'True',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 7
d = Drill.create(
  question: 'Enter a valid assignment operator',
  drill_group: g
)

Solution.create(
  solution: '+=',
  drill: d
)
Solution.create(
  solution: '-=',
  drill: d
)
Solution.create(
  solution: '*=',
  drill: d
)
Solution.create(
  solution: '/=',
  drill: d
)
Solution.create(
  solution: '**=',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 8
d = Drill.create(
  question: 'What does the **= assignment operator do?',
  drill_group: g
)

Solution.create(
  solution: 'It is used as exponent',
  drill: d
)
Solution.create(
  solution: 'it is used as exponent',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 9
d = Drill.create(
  question: 'Ruby does not support ++ operator, it only supports += operator (True or False)',
  drill_group: g
)
Solution.create(
  solution: 'True',
  drill: d
)
Solution.create(
  solution: 'True',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 2 - Question 10
d = Drill.create(
  question: 'The == ‘is equal to’ is known as ...... operator',
  drill_group: g
)
Solution.create(
  solution: 'relational',
  drill: d
)

# DRILL GROUP - RUBY LANGUAGE LEVEL 3
g = DrillGroup.create(
  name: 'Ruby Language',
  description: 'Tests your knowledge of Ruby Language',
  level: 3,
  max_points: 1000,
  user: super_user,
  badge_name: ''
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 1
d = Drill.create(
  question: 'What is the output of the given code?
  print "2 is less than 3" unless 2>3',
  drill_group: g
)

Solution.create(
  solution: '2 is less than 3',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 2
d = Drill.create(
  question: "What is the size of an integer data type in ruby?",
  drill_group: g
)

Solution.create(
  solution: '-2^30 to 2^29',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 3
d = Drill.create(
  question: "What is the output of the given code? \n
    Ans=Ruby \n
    puts \"#[Ans] is an oop language\"",
  drill_group: g
)

Solution.create(
  solution: 'Ruby is an oop language',
  drill: d
)



# DRILLS - RUBY STRINGS LEVEL 3 - Question 4
d = Drill.create(
  question: "Which of the following is not a valid datatype? [Float, Integer, Binary, Timedate]",
  drill_group: g
)

Solution.create(
  solution: 'Timedate',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 5
d = Drill.create(
  question: "The ‘=’ is used for .....",
  drill_group: g
)

Solution.create(
  solution: 'assigning value to variable',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 6
d = Drill.create(
  question: "What will the following expression evaluate to !true && !false ?",
  drill_group: g
)

Solution.create(
  solution: 'False',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 7
d = Drill.create(
  question: "What will be the output of the boolean_1 ?  boolean_1 = !(700 / 10 == 70)",
  drill_group: g
)

Solution.create(
  solution: 'False',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 8
d = Drill.create(
  question: "Which of the following are used for comparison? [Equal to, Not equal to, Less than or greater than, All of the mentioned]",
  drill_group: g
)

Solution.create(
  solution: 'All of the mentioned',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 9
d = Drill.create(
  question: "Which of the following is a valid boolean operator? [and(&&), or(||), not(!), All of the mentioned]",
  drill_group: g
)

Solution.create(
  solution: 'All of the mentioned',
  drill: d
)

# DRILLS - RUBY STRINGS LEVEL 3 - Question 10
d = Drill.create(
  question: "What will be the output of the array[5] ? array = [100, 200, 300, 400, 500] ",
  drill_group: g
)

Solution.create(
  solution: 'Nil',
  drill: d
)

# DRILL GROUP - JAVASCRIPT LANGUAGE LEVEL 1
g = DrillGroup.create(
  name: 'Javascript Language',
  description: 'Tests your knowledge of Ruby Language',
  level: 1,
  max_points: 1000,
  user: super_user,
  badge_name: ''
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 1
d = Drill.create(
  question: 'The behaviour of the instances present of a class inside a method is defined by',
  drill_group: g
)

Solution.create(
  solution: 'Classes',
  drill: d
)

Solution.create(
  solution: 'The behaviour of the instance of a class is defined by the class and is shared by all instances.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 2
d = Drill.create(
  question: 'The keyword or the property that you use to refer to an object through which they were invoked is ....',
  drill_group: g
)

Solution.create(
  solution: 'this',
  drill: d
)

Solution.create(
  solution: 'The ‘this’ keyword is used to refer to the object through which the properties or methods were invoked. This use of ‘this’ is a fundamental characteristic of the methods of any class.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 3
d = Drill.create(
  question: ' The basic difference between JavaScript and Java is ....',
  drill_group: g
)

Solution.create(
  solution: 'Functions are values, and there is no hard distinction between methods and fields',
  drill: d
)

Solution.create(
  solution: 'The basic difference between JavaScript and Java is that the functions are values, and there is no hard distinction between methods and fields.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 4
d = Drill.create(
  question: 'The meaning for Augmenting classes is that ...',
  drill_group: g
)

Solution.create(
  solution: 'objects inherit prototype properties even in dynamic state',
  drill: d
)

Solution.create(
  solution: 'JavaScript’s prototype-based inheritance mechanism is dynamic: an object inherits properties from its prototype, even if the prototype changes after the object is created. This means that we can augment JavaScript classes simply by adding new methods to their prototype objects.',
  drill: d
)


# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 5
d = Drill.create(
  question: 'The property of JSON() method is:',
  drill_group: g
)

Solution.create(
  solution: 'it is invoked automatically by the JSON.stringify() method',
  drill: d
)

Solution.create(
  solution: 'The JSON format is intended for serialization of data structures and can handle JavaScript primitive values, arrays, and plain objects. It does not know about classes, and when serializing an object, it ignores the object’s prototype and constructor. If you call JSON.stringify() on a Range or Complex object, for example, it returns a string like {“from”:1, “to”:3} or {“r”:1, “i”:-1}.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 6
d = Drill.create(
  question: 'The method that can be used to create new properties and also to modify the attributes of existing properties is',
  drill_group: g
)

Solution.create(
  solution: 'Object.defineProperty()',
  drill: d
)

Solution.create(
  solution: 'Object.defineProperties()',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 7
d = Drill.create(
  question: 'What will happen if reverse() and join() methods are used simultaneously ?',
  drill_group: g
)

Solution.create(
  solution: 'Reverses and stores in the same array',
  drill: d
)

Solution.create(
  solution: 'The reverse() followed by a join() will reverse the respective array and will store the reversed array in the memory.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 8
d = Drill.create(
  question: 'Do functions in JavaScript necessarily return a value ?',
  drill_group: g
)

Solution.create(
  solution: 'Few functions return values by default',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 9
d = Drill.create(
  question: 'If you have a function f and an object o, you can define a method named m of o with',
  drill_group: g
)

Solution.create(
  solution: 'o.m=m.f;',
  drill: d
)

Solution.create(
  solution: 'A method is nothing more than a JavaScript function that is stored in a property of an object. If you have a function f and an object o, you can define a method named m of o with the following line:o.m = f;',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 1 - Question 10
d = Drill.create(
  question: 'The unordered collection of properties, each of which has a name and a value is called',
  drill_group: g
)

Solution.create(
  solution: 'Object',
  drill: d
)

Solution.create(
  solution: 'An object is an unordered collection of properties, each of which has a name and a value. Property names are strings, so we can say that objects map strings to values.',
  drill: d
)


# DRILL GROUP - JAVASCRIPT LANGUAGE LEVEL 2
g = DrillGroup.create(
  name: 'Javascript Language',
  description: 'Tests your knowledge of Ruby Language',
  level: 2,
  max_points: 1000,
  user: super_user,
  badge_name: ''
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 1
d = Drill.create(
  question: 'A linkage of series of prototype objects is called as :',
  drill_group: g
)

Solution.create(
  solution: 'prototype chain',
  drill: d
)

Solution.create(
  solution: 'Consider an example, Date.prototype inherits properties from Object.prototype, so a Date object created by new Date() inherits properties from both Date.prototype and Object.prototype. This linked series of prototype objects is known as prototype chain.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 2
d = Drill.create(
  question: 'To determine whether one object is the prototype of (or is part of the prototype chain of) another object, one should use the',
  drill_group: g
)

Solution.create(
  solution: 'PrototypeOf() method',
  drill: d
)

Solution.create(
  solution: 'To determine whether one object is the prototype of (or is part of the prototype chain of) another object, one should use the isPrototype() method. To find out if p is the prototype of o write p.isPrototypeOf(o).',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 3
d = Drill.create(
  question: 'The purpose of extensible attribute is to',
  drill_group: g
)

Solution.create(
  solution: '“lock down” objects into a known state and prevent outside tampering',
  drill: d
)

Solution.create(
  solution: 'The purpose of the extensible attribute is to be able to “lock down” objects into a known state and prevent outside tampering.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 4
d = Drill.create(
  question: 'The let keyword can be used',
  drill_group: g
)

Solution.create(
  solution: 'as a variable declaration like var',
  drill: d
)

Solution.create(
  solution: 'in a for or for/in loop, as a substitute for var',
  drill: d
)

Solution.create(
  solution: 'as a block statement, to define new variables and explicitly delimit their scope',
  drill: d
)

Solution.create(
  solution: 'to define variables that are scoped to a single expression',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 5
d = Drill.create(
  question: 'The main difference between the variables declared with var and with let is',
  drill_group: g
)

Solution.create(
  solution: 'let is confined to a particular function but var is not',
  drill: d
)

Solution.create(
  solution: 'Variables declared with var are defined throughout the enclosing function. Variables declared with let are defined only within the closest enclosing block (and any blocks nested within it, of course).',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 6
d = Drill.create(
  question: 'The four kinds of class members are',
  drill_group: g
)

Solution.create(
  solution: 'Instance fields, Instance methods, Class fields, Class methods',
  drill: d
)

Solution.create(
  solution: 'The four kinds of class members are Instance fields, Instance methods, Class fields, Class methods.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 7
d = Drill.create(
  question: 'The properties of the objects act like different kinds of class members. They are',
  drill_group: g
)

Solution.create(
  solution: 'Constructor object, Prototype object, Instance object',
  drill: d
)

Solution.create(
  solution: 'In JavaScript, there are three different objects involved inany class definition, and the properties of these three objects act like different kinds of class members namely, Constructor object, Prototype object, and Instance object.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 8
d = Drill.create(
  question: 'The object whose properties are inherited by all instances of the class, and properties whose values are functions behaving like instance methods of the class, is',
  drill_group: g
)

Solution.create(
  solution: 'Prototype object',
  drill: d
)

Solution.create(
  solution: 'The properties of the prototype object are inhertied by all instances of the class, and properties whose values are functions behave like instance methods of the class.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 9
d = Drill.create(
  question: 'Which are usually variables that are used internally in object methods and also are globally visible variables?',
  drill_group: g
)

Solution.create(
  solution: 'Variable properties',
  drill: d
)

Solution.create(
  solution: 'The variable properties are usually variables that are used internally in the objects methods, but can also be globally visible variables that are used through the page.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 2 - Question 10
d = Drill.create(
  question: 'How can we make methods available on all objects??',
  drill_group: g
)

Solution.create(
  solution: 'Object.prototype',
  drill: d
)

Solution.create(
  solution: 'It is possible to add methods to Object.prototype, making them available on all objects. This is not recommended, however, because prior to ECMAScript5, there is no way to make these add-on methods nonenumerable, and if you add properties to Object.prototype, those properties will be reported by all for/in loops.',
  drill: d
)

# DRILL GROUP - JAVASCRIPT LANGUAGE LEVEL 3
g = DrillGroup.create(
  name: 'Javascript Language',
  description: 'Tests your knowledge of Ruby Language',
  level: 3,
  max_points: 1000,
  user: super_user,
  badge_name: ''
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 1
d = Drill.create(
  question: 'You can refresh the webpage in JavaScript by using',
  drill_group: g
)

Solution.create(
  solution: 'location.reload',
  drill: d
)

Solution.create(
  solution: 'One can refresh the webpage in JavaScript by using location.reload.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 2
d = Drill.create(
  question: 'The main purpose of JavaScript in web browser is to',
  drill_group: g
)

Solution.create(
  solution: 'Creating animations and other visual effects',
  drill: d
)

Solution.create(
  solution: 'Sorting the columns of a table to make it easier for a user to find what she needs',
  drill: d
)

Solution.create(
  solution: 'Hiding certain content and revealing details progressively as the user “drills down”
into that content',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 3
d = Drill.create(
  question: 'A JavaScript program can traverse and manipulate document content through',
  drill_group: g
)

Solution.create(
  solution: 'Both Element and Document Object',
  drill: d
)

Solution.create(
  solution: 'A JavaScript program can traverse and manipulate document content through the Document object and the Element objects it contains. It can alter the presentation of that content by scripting CSS styles and classes.
',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 4
d = Drill.create(
  question: 'The behaviour of the document elements can be defined by',
  drill_group: g
)

Solution.create(
  solution: 'Both Element and Document Object',
  drill: d
)

Solution.create(
  solution: 'The JavaScript program can define the behavior of document elements by registering appropriate event handlers.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 5
d = Drill.create(
  question: 'The type that specifies what kind of event occured is',
  drill_group: g
)

Solution.create(
  solution: 'event type',
  drill: d
)

Solution.create(
  solution: 'The event type is a string that specifies what kind of event occurred) The type “mousemove”, for example, means that the user moved the mouse.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 6
d = Drill.create(
  question: 'The maximum number of global symbols a module can define is',
  drill_group: g
)

Solution.create(
  solution: '1',
  drill: d
)

Solution.create(
  solution: 'Generally, the various modules are allowed to run in the pristine (or near pristine) environment that it expects. The modules should minimize the number of global symbols they define – ideally, no module should define more than one.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 7
d = Drill.create(
  question: 'The scope of a function is also called as',
  drill_group: g
)

Solution.create(
  solution: 'Module function',
  drill: d
)

Solution.create(
  solution: 'The scope of a function can be used as a private namespace for a module. Therefore, the scope of a function is called a module function.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 8
d = Drill.create(
  question: ' The properties() method is a',
  drill_group: g
)

Solution.create(
  solution: 'Non-enumerable method',
  drill: d
)

Solution.create(
  solution: 'The properties() method is a non-enumerable method.',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 9
d = Drill.create(
  question: 'What can be done in order to avoid creation of global variables in JavaScript?',
  drill_group: g
)

Solution.create(
  solution: 'To use an object as its namespace',
  drill: d
)

Solution.create(
  solution: 'One way for a module to avoid the creation of global variables is to use an object as its namespace. Instead of defining global functions and variables, it stores the functions and values as properties of an object (which may be referenced to a global variable).',
  drill: d
)

# DRILLS - JAVASCRIPT STRINGS LEVEL 3 - Question 10
d = Drill.create(
  question: 'What are the three important manipulations done in a for loop on a loop variable?',
  drill_group: g
)

Solution.create(
  solution: 'Initialization,Testing, Updation',
  drill: d
)

Solution.create(
  solution: 'In a for loop, the initialization, the test, and the update are the three crucial manipulations of a loop variable.',
  drill: d
)









groups = DrillGroup.all
drills = Drill.all
solutions = Solution.all

puts "Created #{groups.count} drill groups, #{drills.count} drills, #{solutions.count} solutions!"

15.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  u = User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@email.com",
    password: PASSWORD
  )
  if u.valid?
    group = groups.sample

    g = StudentDrillGroup.create(
      user: u,
      drill_group: group
    )
    if g.valid?
      drills = group.drills
      for drill in drills
        StudentDrill.create(
          user: u,
          drill: drill,
          is_correct: Faker::Boolean.boolean(0.5)
        )
      end
    end
  end
end

students = User.where("id > 1")
student_drill_groups = StudentDrillGroup.all
student_drills = StudentDrill.all


puts "Created #{students.count} students with #{student_drills.count} drills from #{student_drill_groups.count} student drill groups"

puts "Log in as admin with email: #{super_user.email} password: #{super_user.password} or as student with email: #{super_student.email} password: #{super_student.password}. Have fun!"
