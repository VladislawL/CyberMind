INSERT INTO `cybermind`.`user` (`id`, `username`, `password`, `enabled`)
    VALUES ('1', 'user1', '$2a$10$JJdewR3oK93pdv0fGmazGOWsAZlJhWoVTTt.VmPtmFWOLxMa27.Q6', '1');

INSERT INTO `cybermind`.`user` (`id`, `username`, `password`, `enabled`)
    VALUES ('2', 'user2', '$2a$10$JJdewR3oK93pdv0fGmazGOWsAZlJhWoVTTt.VmPtmFWOLxMa27.Q6', '1');

INSERT INTO `cybermind`.`user` (`id`, `username`, `password`, `enabled`)
    VALUES ('3', 'user3', '$2a$10$JJdewR3oK93pdv0fGmazGOWsAZlJhWoVTTt.VmPtmFWOLxMa27.Q6', '1');

INSERT INTO `cybermind`.`user` (`id`, `username`, `password`, `enabled`)
    VALUES ('4', 'admin', '$2a$10$JJdewR3oK93pdv0fGmazGOWsAZlJhWoVTTt.VmPtmFWOLxMa27.Q6', '1');


INSERT INTO `cybermind`.`role` (`id`, `name`) VALUES ('1', 'ROLE_USER');
INSERT INTO `cybermind`.`role` (`id`, `name`) VALUES ('2', 'ROLE_ADMIN');


INSERT INTO `cybermind`.`users_roles` (`role_id`, `user_id`) VALUES ('1', '1');
INSERT INTO `cybermind`.`users_roles` (`role_id`, `user_id`) VALUES ('1', '2');
INSERT INTO `cybermind`.`users_roles` (`role_id`, `user_id`) VALUES ('1', '3');
INSERT INTO `cybermind`.`users_roles` (`role_id`, `user_id`) VALUES ('1', '4');
INSERT INTO `cybermind`.`users_roles` (`role_id`, `user_id`) VALUES ('2', '4');


-- INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES ('37', 'Riceboard', '<h1>Riceboard</h1> <p>In th eSOLAR Laboratory,the Reply Social Lab,students and Replyers like stop lay table games while</p>', '3');


INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '1', 'Items in boxes',
    '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription">You have 2^n different boxes, each containing a different item. Find the number of ways to take exactly one item from each box modulo 2^n+2. In other words, if the desired number of ways is x, output the remainder of dividing x by 2^n+2 .</p>
        <h2 class="taskTitle">Examples</h2>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Inputs</th>
                    <th>Outputs</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>5 10</th>
                    <th>0</th>
                </tr>
                <tr>
                    <th>10 5</th>
                    <th>1</th>
                </tr>
                <tr>
                    <th>1 2</th>
                    <th>4</th>
                </tr>
            </tbody>
        </table>
        <h2 class="taskTitle">Explanation</h2>
        <p class="taskDescription">In the third example, 2^n = 2 boxes, each containing a = 2 items. It turns out that there are two ways to take an item from the first and two ways to take an item from the second, a total of 2·2 = 4 ways. The remainder of the division by 2^n+2 = 23 = 8 is 4.</p>
    <!---->',
    '2'
);
INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '2', 'Cloud server',
        '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription">Running an online contest uses a lot of hardware resources, so for the day of the Reply Code Challenge we decide to rent some servers from our trusted provider AWesome Servers (AWSTM). <br>
        According to our Complex Monitoring System (CMSTM) we need P units of computing power. AWSTM provides us the computing power from their N servers, arranged in a single row and numbered from 0 to N—1. <br>
        As we want to optimize the latency in the communications, we decide to rent only a contiguous subsequence of the servers (defined by a range l and r) whose total sum of computing powers is at least P. Of course, the exceeding part will not be used, so our target is to choose a range that minimize wasted computing as much as possible. <br>
        In case of multiple ranges that meet the criteria, we prefer the nearest to the entrance, the one with the lowest starting index l and then the lowest ending index r. Write a program to help the team choose which range of servers to rent. </p>
        <h2 class="taskTitle">Examples</h2>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Inputs</th>
                    <th>Outputs</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>1 2 3 4 5 6 7 8 9 10 , 23</th>
                    <th>6 8</th>
                </tr>
             </tbody>
        </table>
        <h2 class="taskTitle">Explanation</h2>
        <p class="taskDescription">The optimal solution is the subsequence [7, 8. 9] of sum 24, defined by the range l = 6 and r = 8. There is no way to obtain 23 as sum of a contiguous subsequence.</p>
    <!---->',
    '3'
);
INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '3', 'Scoreboard',
    '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription">There are five problerris, each one requires to solve five different inputs of increasing score (100, 200, 300, 400 and 500 respectively for inputs one, two, three, four and five). The points for a specific problem and input will be assigned once per team. <br>
        Using these rules, it is possible for teams to tie. So to solve this problem, we''ll need to take into account the time each teams takes to reach their score. In particular, each team will receive a time penalty, which equals the sum of the time taken to solve each input. <br>
        We need you to write a program that analyses the platform logs and ranks teams by decreasing score and, in the case of a tie, increasing penalty time. If two or more teams have the same score and penalty time, then return them in numerical order.<br>
        A platform log has a specific format: timestamp teamid problemid inputid scored, where<br>
        &bull; timestamp is the time the submission was evaluated.<br>
        &bull;  teamid is the team identifier(from 1 to N).<br>
        &bull; problemid is the problem identifier (from 1 to 5).<br>
        &bull; inputid is the input identifier (from 1 to 5).<br>
        &bull; scored is 1 if the submitted solution is valid, otherwise 0.</p>
        <h2 class="taskTitle">Examples</h2>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Inputs</th>
                    <th>Outputs</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>1 1 1 1 0 <br> 2 1 1 1 1 <br>2 4 1 2 1 <br> 3 2 1 2 0 <br>4 2 1 1 1</th>
                    <th>4 1 2 3 5</th>
                </tr>
             </tbody>
        </table>
    <!---->',
    '3'
);
INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '4', 'Range execration',
    '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription"> A format for expressing an ordered list of integers is to use a comma separated list of either <br>
        &bull; individual integers <br>
        &bull; or a range of integers denoted by the starting integer separated from the end integer in the range by a dash, ''-''. The range includes all integers in the interval including both endpoints. It is not considered a range unless it spans at least 3 numbers. For example "12,13,15-17" <br>
        Complete the solution so that it takes a list of integers in increasing order and returns a correctly formatted string in the range format. </p>
        <h2 class=" taskTitle ">Examples</h2>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Inputs</th>
                    <th>Outputs</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>-6 -3 -2 -1 0 1 3 4 5 7 8 9 10 11 14 15 17 18 19 20</th>
                    <th>"-6,-3-1,3-5,7-11,14,15,17-20"</th>
                </tr>
             </tbody>
        </table>
<!---->
',
    '2'
);


-- INSERT INTO `cybermind`.`solved_tasks` (`user_id`, `task_id`, `is_solved`) VALUES ('1', '1', '1');


INSERT INTO `cybermind`.`tags` (id, name) VALUE ('1', 'Array');
INSERT INTO `cybermind`.`tags` (id, name) VALUE ('2', 'String');
INSERT INTO `cybermind`.`tags` (id, name) VALUE ('3', 'Hash Table');
INSERT INTO `cybermind`.`tags` (id, name) VALUE ('4', 'Linked List');
INSERT INTO `cybermind`.`tags` (id, name) VALUE ('5', 'Math');


INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('1', '5');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('2', '1');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('2', '5');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('3', '1');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('3', '4');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('3', '5');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('4', '1');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('4', '2');


INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('1', 'Java basics');
INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('2', 'Operators');


INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '1', '1', 'Arrays',
    '<!---->
        <h2 class="chapterTitle">Arrays</h2>
        <p class="chapterDescription">An array is a container object that holds a fixed number of values of a single type. The length of an array is established when the array is created. After creation, its length is fixed. You have seen an example of arrays already, in the main method of the "Hello World!" application. This section discusses arrays in greater detail.<br>
        Each item in an array is called an element, and each element is accessed by its numerical index. As shown in the preceding illustration, numbering begins with 0. The 9th element, for example, would therefore be accessed at index 8.</p>
        <h2 class="chapterTitle">Declaring a Variable to Refer to an Array</h2>
        <p class="chapterDescription">The preceding program declares an array (named anArray) with the following line of code:<br>
        // declares an array of integers
        int[] anArray;<br>
        Like declarations for variables of other types, an array declaration has two components: the array''s type and the array''s name. An array''s type is written as type[], where type is the data type of the contained elements; the brackets are special symbols indicating that this variable holds an array. The size of the array is not part of its type (which is why the brackets are empty). An array''s name can be anything you want, provided that it follows the rules and conventions as previously discussed in the naming section. As with variables of other types, the declaration does not actually create an array; it simply tells the compiler that this variable will hold an array of the specified type.<br>
        Similarly, you can declare arrays of other types:
        &bull; byte[] anArrayOfBytes;<br>
        &bull; short[] anArrayOfShorts; <br>
        &bull; long[] anArrayOfLongs; <br>
        &bull; float[] anArrayOfFloats; <br>
        &bull; double[] anArrayOfDoubles; <br>
        &bull; boolean[] anArrayOfBooleans; <br>
        &bull; char[] anArrayOfChars; <br>
        &bull; String[] anArrayOfStrings; <br>
        </p>
            <h2 class="chapterTitle">Creating, Initializing, and Accessing an Array</h2>
        <p class="chapterDescription">Each array element is accessed by its numerical index:
        System.out.println("Element 1 at index 0: " + anArray[0]);<br>
        System.out.println("Element 2 at index 1: " + anArray[1]); <br>
        System.out.println("Element 3 at index 2: " + anArray[2]); <br>
        Alternatively, you can use the shortcut syntax to create and initialize an array:<br>
        int[] anArray = { <br>
            100, 200, 300, <br>
            400, 500, 600, <br>
            700, 800, 900, 1000<br>
        };<br>
        You can also declare an array of arrays (also known as a multidimensional array) by using two or more sets of brackets, such as String[][] names. Each element, therefore, must be accessed by a corresponding number of index values.</p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '2', '1', 'Class',
    '<!---->
        <h2 class="chapterTitle">Classes</h2>
        <p class="chapterDescription">The introduction to object-oriented concepts in the lesson titled Object-oriented Programming Concepts used a bicycle class as an example, with racing bikes, mountain bikes, and tandem bikes as subclasses. Here is sample code for a possible implementation of a Bicycle class, to give you an overview of a class declaration. Subsequent sections of this lesson will back up and explain class declarations step by step. For the moment, don''t concern yourself with the details.<br>
        In this chapter, we will look into the concepts - Classes and Objects.<br>
        &bull; Object − Objects have states and behaviors. Example: A dog has states - color, name, breed as well as behaviors – wagging the tail, barking, eating. An object is an instance of a class.<br>
        &bull; Class − A class can be defined as a template/blueprint that describes the behavior/state that the object of its type support.<br></p>
        <h2 class="chapterTitle">Objects in Java</h2>
        <p class="chapterDescription">Let us now look deep into what are objects. If we consider the real-world, we can find many objects around us, cars, dogs, humans, etc. All these objects have a state and a behavior.<br>
        If we consider a dog, then its state is - name, breed, color, and the behavior is - barking, wagging the tail, running.<br>
        If you compare the software object with a real-world object, they have very similar characteristics.<br>
        Software objects also have a state and a behavior. A software object''s state is stored in fields and behavior is shown via methods.<br>
        So in software development, methods operate on the internal state of an object and the object-to-object communication is done via methods.<br></p>
        <h2 class="chapterTitle">Classes in Java</h2>
        <p class="chapterDescription">A class is a blueprint from which individual objects are created.
        Following is a sample of a class.<br>
        public class Dog {<br>
           String breed; <br>
           int age; <br>
           String color; <br>
           void barking() {<br>
           }<br>
           void hungry() {<br>
           }<br>
           void sleeping() {<br>
           }<br>
        }<br>
        A class can contain any of the following variable types.<br>
        &bull; Local variables − Variables defined inside methods, constructors or blocks are called local variables. The variable will be declared and initialized within the method and the variable will be destroyed when the method has completed.<br>
        &bull; Instance variables − Instance variables are variables within a class but outside any method. These variables are initialized when the class is instantiated. Instance variables can be accessed from inside any method, constructor or blocks of that particular class.<br>
        &bull; Class variables − Class variables are variables declared within a class, outside any method, with the static keyword.<br></p>
        <h2 class="chapterTitle">Constructors </h2>
        <p class="chapterDescription">When discussing about classes, one of the most important sub topic would be constructors. Every class has a constructor. If we do not explicitly write a constructor for a class, the Java compiler builds a default constructor for that class.<br>
        Each time a new object is created, at least one constructor will be invoked. The main rule of constructors is that they should have the same name as the class. A class can have more than one constructor.<br>
        Following is an example of a constructor −<br>
        public class Puppy {<br>
           public Puppy() {<br>
           }<br>
           public Puppy(String name) {<br>
              // This constructor has one parameter, name. <br>
           }<br>
        } </p>
        <h2 class="chapterTitle">Source File Declaration Rules</h2>
        <p class="chapterDescription">As the last part of this section, let''s now look into the source file declaration rules. These rules are essential when declaring classes, import statements and package statements in a source file.<br>
        &bull;There can be only one public class per source file.<br>
        &bull;A source file can have multiple non-public classes. <br>
        &bull;The public class name should be the name of the source file as well which should be appended by .java at the end. For example: the class name is public class Employee{} then the source file should be as Employee.java. <br>
        &bull;If the class is defined inside a package, then the package statement should be the first statement in the source file. <br>
        &bull;If import statements are present, then they must be written between the package statement and the class declaration. If there are no package statements, then the import statement should be the first line in the source file. <br>
        &bull;Import and package statements will imply to all the classes present in the source file. It is not possible to declare different import and/or package statements to different classes in the source file. <br>
        Classes have several access levels and there are different types of classes; abstract classes, final classes, etc. We will be explaining about all these in the access modifiers chapter.<br>
        Apart from the above mentioned types of classes, Java also has some special classes called Inner classes and Anonymous classes.</p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '3', '1', 'String',
    '<!---->
        <h2 class="chapterTitle">Strings</h2>
        <p class="chapterDescription">Strings, which are widely used in Java programming, are a sequence of characters. In the Java programming language, strings are objects.<br>
        The Java platform provides the String class to create and manipulate strings.<br></p>
        <h2 class="chapterTitle">Creating Strings</h2>
        <p class="chapterDescription">The most direct way to create a string is to write:<br>
        String greeting = "Hello world!";<br>
        In this case, "Hello world!" is a string literal—a series of characters in your code that is enclosed in double quotes. Whenever it encounters a string literal in your code, the compiler creates a String object with its value—in this case, Hello world!.<br>
        As with any other object, you can create String objects by using the new keyword and a constructor. The String class has thirteen constructors that allow you to provide the initial value of the string using different sources, such as an array of characters:<br>
        char[] helloArray = { ''h'', ''e'', ''l'', ''l'', ''o'', ''.'' };<br>
        String helloString = new String(helloArray);<br>
        System.out.println(helloString);<br>
        The last line of this code snippet displays hello.</p>
        <h2 class="chapterTitle">String Length</h2>
        <p class="chapterDescription">Methods used to obtain information about an object are known as accessor methods. One accessor method that you can use with strings is the length() method, which returns the number of characters contained in the string object. After the following two lines of code have been executed, len equals 17:<br>
        String palindrome = "Dot saw I was Tod";<br>
        int len = palindrome.length();<br>
        A palindrome is a word or sentence that is symmetric—it is spelled the same forward and backward, ignoring case and punctuation. Here is a short and inefficient program to reverse a palindrome string. It invokes the String method charAt(i), which returns the ith character in the string, counting from 0.</p>
        <h2 class="chapterTitle">Concatenating Strings</h2>
        <p class="chapterDescription">The String class includes a method for concatenating two strings − string1.concat(string2);This returns a new string that is string1 with string2 added to it at the end. <br>
        You can also use the concat() method with string literals, as in −"My name is ".concat("Zara");<br>
        Strings are more commonly concatenated with the + operator, as in −"Hello," + " world" + "!" which results in − "Hello, world!"</p>
        <h2 class="chapterTitle">String Methods</h2>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Method</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>char charAt(int index)</th>
                    <th>Returns the character at the specified index.</th>
                </tr>
                <tr>
                    <th>int compareTo(Object o)</th>
                    <th>Compares this String to another Object.</th>
                </tr>
                <tr>
                    <th>int indexOf(String str)</th>
                    <th>Returns the index within this string of the first occurrence of the specified substring.</th>
                </tr>
                <tr>
                    <th>int lastIndexOf(String str)</th>
                    <th>Returns the index within this string of the rightmost occurrence of the specified substring.</th>
                </tr>
                <tr>
                    <th>int length()</th>
                    <th>Returns the length of this string.</th>
                </tr>
                <tr>
                    <th>String replaceAll(String regex, String replacement</th>
                    <th>Replaces each substring of this string that matches the given regular expression with the given replacement.</th>
                </tr>
                <tr>
                    <th>String[] split(String regex)</th>
                    <th>Splits this string around matches of the given regular expression.</th>
                </tr>
                <tr>
                    <th>boolean startsWith(String prefix)</th>
                    <th>Tests if this string starts with the specified prefix.</th>
                </tr>
                <tr>
                    <th>String substring(int beginIndex)</th>
                    <th>Returns a new string that is a substring of this string.</th>
                </tr>
                <tr>
                    <th>String toLowerCase()</th>
                    <th>Converts all of the characters in this String to lower case using the rules of the default locale.</th>
                </tr>
                <tr>
                    <th>String toUpperCase(Locale locale)</th>
                    <th>Converts all of the characters in this String to upper case using the rules of the given Locale.</th>
                </tr>
            </tbody>
        </table>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '4', '2', 'The arithmetic operators',
    '<!---->
        <h2 class="chapterTitle">The Arithmetic Operators</h2>
        <p class="chapterDescription">Arithmetic operators are used in mathematical expressions in the same way that they are used in algebra. The following table lists the arithmetic operators.<p>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Operator</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>+ (Addition)</th>
                    <th>Adds values on either side of the operator.</th>
                </tr>
                <tr>
                    <th>- (Subtraction)</th>
                    <th>Subtracts right-hand operand from left-hand operand.</th>
                </tr>
                <tr>
                    <th>* (Multiplication)</th>
                    <th>Multiplies values on either side of the operator.</th>
                </tr>
                <tr>
                    <th>/ (Division)</th>
                    <th>Divides left-hand operand by right-hand operand.</th>
                </tr>
                <tr>
                    <th>% (Modulus)</th>
                    <th>Divides left-hand operand by right-hand operand and returns remainder.	</th>
                </tr>
                <tr>
                    <th>++ (Increment)</th>
                    <th>Increases the value of operand by 1.</th>
                </tr>
                <tr>
                    <th>-- (Decrement)</th>
                    <th>Decreases the value of operand by 1.	</th>
                </tr>
            </tbody>
        </table>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '5', '2', 'The relation operators',
    '<!---->
        <h2 class="chapterTitle">The Relational Operators</h2>
        <p class="chapterDescription">There are following relational operators supported by Java language.</p>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Operator</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>== (equal to)</th>
                    <th>Checks if the values of two operands are equal or not, if yes then condition becomes true.</th>
                </tr>
                <tr>
                    <th>!= (not equal to)</th>
                    <th>Checks if the values of two operands are equal or not, if values are not equal then condition becomes true.</th>
                </tr>
                <tr>
                    <th> > (greater than)</th>
                    <th>Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true.</th>
                </tr>
                <tr>
                    <th>< (less than)</th>
                    <th>Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true.</th>
                </tr>
                <tr>
                    <th>>= (greater than or equal to)</th>
                    <th>Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.</th>
                <tr>
                    <th><= (less than or equal to)</th>
                    <th>Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.</th>
                </tr>
            </tbody>
        </table>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '6', '2', 'The logical operators',
    '<!---->
        <h2 class="chapterTitle">The Logical Operators</h2>
        <p class="chapterDescription">The following table lists the logical operators −</p>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Operator</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>&& (logical and)</th>
                    <th>Called Logical AND operator. If both the operands are non-zero, then the condition becomes true.</th>
                </tr>
                <tr>
                    <th>|| (logical or)</th>
                    <th>Called Logical OR Operator. If any of the two operands are non-zero, then the condition becomes true.</th>
                </tr>
                <tr>
                    <th>! (logical not)</th>
                    <th>Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true then Logical NOT operator will make false.</th>
                </tr>
            </tbody>
        </table>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '7', '2', 'The logical operators',
    '<!---->
        <h2 class="chapterTitle">Precedence of Java Operators</h2>
        <p class="chapterDescription">Operator precedence determines the grouping of terms in an expression. This affects how an expression is evaluated. Certain operators have higher precedence than others; for example, the multiplication operator has higher precedence than the addition operator −<br>
        For example, x = 7 + 3 * 2; here x is assigned 13, not 20 because operator * has higher precedence than +, so it first gets multiplied with 3 * 2 and then adds into 7.<br>
        Here, operators with the highest precedence appear at the top of the table, those with the lowest appear at the bottom. Within an expression, higher precedence operators will be evaluated first.</p>
        <table class="examples">
            <thead class="examplesHead">
                <tr>
                    <th>Category</th>
                    <th>Operator</th>
                    <th>Associativity</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>Postfix</th>
                    <th>expression++ expression--</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Unary</th>
                    <th>++expression –-expression +expression –expression ~ !	</th>
                    <th>Right to left</th>
                </tr>
                <tr>
                    <th>Multiplicative</th>
                    <th>* / %</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Additive</th>
                    <th>+ -</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Shift</th>
                    <th><< >> >>></th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Relational</th>
                    <th>< > <= >= instanceof</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Equality </th>
                    <th>== !=</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Bitwise AND</th>
                    <th>&</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Bitwise XOR/th>
                    <th>^</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Bitwise OR</th>
                    <th>|</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Logical AND</th>
                    <th>&&</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Logical OR</th>
                    <th>||</th>
                    <th>Left to right</th>
                </tr>
                <tr>
                    <th>Conditional</th>
                    <th>?</th>
                    <th>Right to left</th>
                </tr>
                <tr>
                    <th>Assignment</th>
                    <th>= += -= *= /= %= ^= |= <<= >>= >>>=</th>
                    <th>Right to left</th>
                </tr>
            </tbody>
        </table>
    <!---->'
);


