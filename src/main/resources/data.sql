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
<!---->',
    '2'
);
INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '5', 'Next smaller number',
    '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription">Write a function that takes a positive integer and returns the next smaller positive integer containing the same digits.</p>
        <p class="taskDescription">Return -1, when there is no smaller number that contains the same digits. Also return -1 when the next smaller number with the same digits would require the leading digit to be zero.</p>
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
                    <th>21</th>
                    <th>12</th>
                </tr>
                <tr>
                    <th>531</th>
                    <th>513</th>
                </tr>
                <tr>
                    <th>2071</th>
                    <th>2017</th>
                </tr>
            </tbody>
        </table>
    <!---->',
    '1'
);
INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '6', 'Next bigger number',
    '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription">Create a function that takes a positive integer and returns the next bigger number that can be formed by rearranging its digits.</p>
        <p class="taskDescription">If the digits can''t be rearranged to form a bigger number, return -1.</p>
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
                    <th>12</th>
                    <th>21</th>
                </tr>
                <tr>
                    <th>513</th>
                    <th>531</th>
                </tr>
                <tr>
                    <th>2017</th>
                    <th>2071</th>
                </tr>
            </tbody>
        </table>
    <!---->',
    '1'
);
INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '7', 'Quantum teleportation',
    '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription">A new team of engineers in Reply is working on a particular kind of quantum computer and wants you to help them!</p>
        <p class="taskDescription">This quantum computer is composed by a bidimensional grid of size X × Y (all the coordinates start at 0 and a single qubit of which we know the initial position (X0, Y0). The engineers want to use quantum teleportation to execute programs, so they have placed different teleportation portals on the grid; each of them is located in a precise position (Xin,Yin) and has a precise destination (Xout,Yout).</p>
        <p class="taskDescription">In particular the qubit can only travel on the grid moving one cell either horizontally or vertically (that is, without diagonal movements and without leaving the grid) and is attracted by the nearest teleportation portal (the one reachable in the minimum amount of moves). If there are several portals at the same distance, the qubit prefers the one with the smallest Xin coordinate, and in case of same Xout it prefers the one with the smallest Yout, coordinate. Once the qubit reaches a teleportation portal it is immediately teleported to the corresponding destination and the original teleportation portal is removed from the grid (i.e. it is no longer usable). The qubit will continue to move on the grid until no teleportation portals are left</p>
        <p class="taskDescription">As the movement of the qubit is very fast (almost as fast as the speed of light) we want your help to write an algorithm to keep track of the total distance (i.e. number of moves) traveled by the qubit during the “attraction” phase (i.e. not counting any distance for the teleportation’s). Since this number could be very large, you are requested to only print the remainder1 of this number when divided by 100 003. </p>
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
                    <th>3 3 <br>1 1<br> 0 0 1 2 <br> 0 2 2 0 <br> 2 2 1 0</th>
                    <th>5</th>
                </tr>
            </tbody>
        </table>
        <h2 class="taskTitle">Explanation</h2>
        <p class="taskDescription">The qubit isinitially located in (1,1) and allthe teleportation por- tals areatdistance2fromit;theonewiththesmallestxandthe smallest y is the first one located in (0, 0). </p>
        <p class="taskDescription">After the first teleportation, the qubit isin (1, 2) and this time both of the remaning portals are at distance 1, so it moves to the one with the smallest y in (0, 2). </p>
        <p class="taskDescription">Afterthe second teleportation the qubit isin(2, 0). Itthenmoves to the lastremaning portalsin (2, 2) at distance 2 from it.  </p>
        <p class="taskDescription">Thequbitfinishesits execution in(1,0)andthe totaltravelled distance is 2 +1+ 2 = 5.</p>
        <table class="examples">
            <tbody>
                <tr>
                    <th></th>
                    <th>0</th>
                    <th>1</th>
                    <th>2</th>
                </tr>
                <tr>
                    <th>0</th>
                    <th>in0</th>
                    <th>out2</th>
                    <th>out1</th>
                </tr>
                <tr>
                    <th>1</th>
                    <th></th>
                    <th>start</th>
                    <th></th>
                </tr>
                <tr>
                    <th>2</th>
                    <th>in1</th>
                    <th>out0</th>
                    <th>in2</th>
                </tr>
            </tbody>
        </table>
    <!---->',
    '3'
);
INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `level`) VALUES (
    '8', 'Small business',
    '<!---->
        <h2 class="taskTitle">Description</h2>
        <p class="taskDescription">A little girl Yulia firmly decided to open her own toy store in the yard. She decided to sell two types of goods: Teddy bears and bunnies. As you know, in any self-respecting store there are price tags. But Yulia, although she is taking her first steps in business, has not yet learned to write. Then she decided to create price tags from the available number of cubes with numbers, using all to the last, so that none was lost. Yulia is very kind, so she decided that both prices should form a minimum pair, should not be more than 1018, and may even be equal to zero. However, the concept of leading zeros is repugnant to Yulia, so they should not be on the price tags. Let''s support small businesses and help them prepare two price tags from the available cubes. </p>
        <p class="taskDescription">Output two prices. Remember that a minimum pair is a pair where the smaller of the two prices is the minimum, and the lowest possible second price is selected for it.  </p>
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
                    <th>123456</th>
                    <th>1 23456</th>
                </tr>
                <tr>
                    <th>00</th>
                    <th>0 0</th>
                </tr>
                <tr>
                    <th>000</th>
                    <th>-1 -1</th>
                </tr>
            </tbody>
        </table>
    <!---->',
    '1'
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
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('5', '2');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('5', '4');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('6', '2');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('6', '4');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('7', '4');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('7', '5');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('8', '2');
INSERT INTO `cybermind`.`task_tags` (task_id, tags_id) VALUE ('8', '5');


INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('1', 'Java basics');
INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('2', 'Simple data types');
INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('3', 'Complex data types and classes');
INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('4', 'Control instructions');
INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('5', 'Operators');
INSERT INTO `cybermind`.`learn` (`id`, `name`) VALUES ('6', 'Exception Handling');


INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '1', '1', 'The origins of Java',
    '<!---->
        <h2 class="chapterTitle">The Origins of Java</h2>
        <p class="chapterDescription">The Java language was conceived in 199 1 by employees of Sun Microsystems
        James Gosling, Patrick Nathan, Chris Worth, Ed Frank, and
        By Mike Sheridan. It was originally called Oak, but in 1995, when
        marketers took over its promotion, it was renamed Java.
        Surprisingly, at first, the authors of the language themselves did not set themselves the
        tasks of developing Internet applications. Their goal was to create a platform-independent language that could be used to write embedded software for various household electronic equipment, including
        this includes toasters, microwaves, new stoves, and remote controls.
        As a rule, in devices of this type, controllers based on the
        microprocessors of various architectures, and the executable code generated by
        the compilers of most programming languages that existed at that time was focused on certain types of processors. A typical
        example of this is the C++language. </p>
        <p class="chapterDescription">Despite the fact that a program written in C++ can be executed
        on a processor of almost any type, this can only be done by compiling it into the executable code of commands of a specific processor. Creating
        compilers is a long and time-consuming process, so in search of an optimal solution, Gosling and other members of the working group decided
        on a cross-platform language for which the compiler would generate code that
        could run on different processors in different computing
        environments. As a result, their efforts culminated in the creation of the language now known
        as Java.</p>
        <p class="chapterDescription">While the developers of Java were refining the details of the language they were creating, the
        rapid development of the "World Wide Web" began, in order to determine the future of Java.
        If it were not for the formation of the web community, Java would probably find only
        limited use, mainly in the development of programs embedded in
        specialized controllers. But once widely available
        And the Internet became a reality, there was an urgent need for portable programs, which was the reason for pushing Java to the forefront
        as the main language for developing such programs.</p>
        <p class="chapterDescription">As they gain experience, many programmers very quickly come to the
        conclusion that program portability is an elusive ideal.
        The task of creating cross-platform programs appeared almost together with the appearance of the first computers, but it was not possible to take up its solution because of the need to solve other, more important and urgent tasks.
        Whatever it
        was, but with the advent of the Internet, the problem of program portability has shifted
        in the category of absolutely urgent. After all, the Internet also consists of many different types of computers with different processor architectures and different operating systems.</p>
        <p class="chapterDescription">As a result, a fascinating, but, at first glance, not so important task suddenly became extremely relevant. In the year 1,993, it became
        clear to Java developers that the task of portability should be solved not only in the process of programming microprocessor devices, but also in the development of code for Internet applications. In other words, the scope of the Java language has suddenly expanded. And if the programming of microcontrollers was
        the motivation for the creation of Java, the Internet contributed to the rapid spread of this language.</p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '2', '1', 'Portability',
    '<!---->
        <h2 class="chapterTitle">Portability</h2>
        <p class="chapterDescription">Portability is an important property of network programs. The significance of this characteristic is due to the fact that the network may have different types of computers running different operating systems.
        If a Java program is designed to run on an
        arbitrary computer that is not connected to the Internet, then there must be ways to ensure that this program works on various systems. For example, the same application must run on computers with different processors, different operating systems, and different operating systems.
        browsers. Storing different versions of an application for different types of computers is
        too difficult, if not impossible. The same code must be executed on all computers. Thus, it is necessary to support the process of
        generating portable executable code. As will become clear in the future, the
        same tools that provide security help to achieve the
        portability of programs.</p>
        <h2 class="chapterTitle">Magic Java Bytecode</h2>
        <p class="chapterDescription">The Java code generated by the compiler, which is not executable, allows you to achieve security and portability of network programs. This code is called a bytecode. It is an optimized set of commands designed
        to be executed in an executing environment called a Java virtual Machine
        (Java Virtual Machine - JVM). The Java virtual machine is actually a bytecode interpreter. This approach may not seem quite common, since
        compilers that generate executable code are used to improve the performance of most modern languages.
        code. But running a program under the control of a virtual machine allows you to solve many of the difficulties that arise in the operation of web applications .</p>
        <p class="chapterDescription">Translating Java source code into bytecode greatly simplifies the transfer of
        programs from one environment to another, since it is enough to implement a virtual machine on each platform to ensure the code''s operability. If there is an execution environment package on a computer
        , then any program written in Java can be executed on it. Although VMs on different platforms can be implemented in different ways,
        they must interpret the bytecode in the same way. If the original text
        Java programs were compiled into their own code, and for each type of processor that interacts with the Internet, it would be necessary to provide a separate version of this program. This is not an acceptable solution. Therefore, running bytecode under the control of a virtual
        machine is the easiest way to ensure program portability.</p>
        <p class="chapterDescription">Running a program under a virtual machine
        also helps to ensure security. A virtual machine can prevent a program from performing operations whose side effects can affect
        resources outside of the executing environment. In addition, security is achieved by imposing certain restrictions provided for in
        the Java language.</p>
        <p class="chapterDescription">As a rule, an interpreted program runs slower than one
        compiled into machine code. But for Java code, the differences in performance are
        not very significant. After all, the bytecode is optimized, and therefore the program runs under the control of a virtual machine much faster than you would expect.
        Despite the fact that Java was conceived as an interpreted language, there is nothing to
        prevent the use of on-the-fly (i.e., on-the-fly) compilation of bytecode into native processor code to improve performance. To this end, immediately after the first implementation of the JVM, Sun
        Microsystems began work on HotSpot technology, which
        developed a dynamic bytecode compiler. If the virtual
        machine includes a dynamic compiler, the bytecode is converted in parts to its own executable code. It is impractical to convert the entire
        Java program into executable code at once because of the various checks that can be performed only at the program execution stage. Therefore,
        the dynamic compiler performs code transformations in parts as needed.
        of necessity. Hence its other name-JIT (Just ln Time), i.e. a compiler that takes effect only at the right time and. Moreover, not
        all bytecode fragments are compiled, but only those
        whose execution speed can be improved by compilation, and the rest of the code is
        interpreted. Despite all the limitations inherent in dynamic compilation, it still allows you to significantly improve the performance of programs. And despite the dynamic conversion of bytecode to executable code, portability and security are preserved because the JVM
        it is still involved in the program execution process.</p>
        <p class="chapterDescription">And now one more thing. Starting with JDK 9, individual Java environments also
        include an early compiler that can be used to compile bytecode into platform-oriented (machine-based) code.) code before JVM execution, not on the fly. Early compilation is
        a specialized tool that does not replace the traditional approach just
        described in Java. Moreover, early compilation has a number of limitations. At the time of writing, early compilation was used only for
        experimental purposes, and was only available for 64-bit versions of Java
        on the Linux platform, and the precompiled code must run on the same (or similarly configured) system
        on which the code was compiled. This leads to the fact that early compilation reduces the degree of portability. Due to the highly specialized nature of the early compilation, it will not be discussed in detail in this
        book.</p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '3', '1', 'Object-oriented programming',
    '<!---->
        <h2 class="chapterTitle">Object-oriented programming</h2>
        <p class="chapterDescription">One of the main features of Java is its support for object-oriented programming (OOP). The object methodology is inseparable from Java, and
        all Java programs are more or less object-oriented. Therefore, it makes sense to briefly review the principles of OOP before moving on to writing even the simplest Java program. Next, you will
        see how these principles are implemented in practice. </p>
        <p class="chapterDescription">description</p>
        <p class="chapterDescription">The object-oriented approach to programming allows you to develop quite complex programs. Since the introduction of the first
        computer, the programming methodology has undergone a number of significant changes due to the increasing complexity of programs. At the dawn of computer
        technology, the programming process consisted of entering machine commands
        in binary form from the EV M control panel. At that time, the size of the programs did not
        exceed several hundred teams, and therefore this approach was considered quite
        acceptable. Then came the assembly languages. Symbolic representation
        machine commands and the compilation procedure allowed us to move on to creating more complex programs. Due to the further increase in the volume of program code, high-level languages have appeared . They became the tools
        that allowed programmers to cope with the gradual complication
        of programs. The first widely used high-level language was
        FORTRAN. The introduction of FORTRAN was an important step in the development
        of programming languages, but this language was not quite suitable for creating readable programs. </p>
        <p class="chapterDescription">In the 1960s, structural programming began to emerge. Subsequently, languages such as C and Pascal were developed to support this approach
        . Thanks to the structured programming and programming languages, it is
        relatively easy to create programs of medium complexity .
        The main features of structured languages are the support of subroutines, local variables, the presence of an extended set of control
        constructs, and the absence of the GOTO operator. But, despite the fact that structured languages have become powerful programming tools, as
        as the volume and complexity of the projects grew, their capabilities were quickly exhausted</p>
        <p class="chapterDescription">At each successive stage of the development of methodological and instrumental programming
        tools, developers were able to create more and
        more complex programs. Along the way, the next approach inherited the best
        features of its predecessors, and in addition, acquired new qualities that allowed us to move forward. By the time of the development of the principle of OOP, many
        projects had become so complex that it was no longer possible to manage them by means of structural programming. The object-oriented methodology allowed developers to overcome these obstacles. </p>
        <p class="chapterDescription">Object-oriented programming has adopted the best ideas of
        structural programming, adding new concepts to them. As a result, a new way of organizing programs has emerged. In principle, programs can be created in two ways: based on code (performing actions) and based on data (being processed).
        When using only
        structural programming techniques, programs are organized based on code. This approach can be considered as code that affects the data.
        Object-oriented programming implies a different approach. Programs are organized on the basis of data according to the following main
        principle: data controls access to the code. Object-oriented programming
        and programming languages define the data and procedures that are allowed to process this data. Thus, the data type defines the
        operations that are applicable to this data. </p>
        <p class="chapterDescription">All object-oriented programming and programming languages, including
        Java, support three basic principles of OOP: encapsulation, pylymorphism, and inheritance. </p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '4', '2', 'Java Primitive Data Types',
    '<!---->
        <h2 class="chapterTitle">Why are data types so important</h2>
        <p class="chapterDescription">Due to the fact that Java belongs to the category of strongly typed
        programming languages, data types are very important in it. During compilation, the types of operands in all operators are checked. And if
        there are invalid operations in the program, its source code is not converted to bytecode. Type control allows you to reduce the number of errors and increase the reliability of the program. Unlike other
        programming languages, where you can not specify the types of data stored in variables, in Java, all variables, expressions, and values are strictly controlled
        for matching data types. Moreover, the type of a variable determines
        exactly what operations can be performed on it. Operations that are allowed for
        one data type may not be allowed for another</p>
        <h2 class="chapterTitle">Java Primitive Data Types</h2>
        <p class="chapterDescription">Built-in data types in Java fall into two categories: object-oriented and non-object-oriented. Object-oriented
        data types are defined in classes, which will be discussed in later chapters. The Java language is based on the eight primitive data types
        shown in Table 2.1 ( they are also called elementary or simple).
        The term primitive indicates that these data types are not objects, but ordinary binary values. These types of data are provided in the language in order to improve the efficiency of programs. All
        the rest of the Java data types are formed based on primitive types. </p>
        <p class="chapterDescription">Java clearly defines the scope of primitive types and the range of
        valid values for them. These rules must be followed when creating
        all VMs. And since Java programs must be portable, following these rules exactly is one of the main requirements of the language. For example, the int type remains unchanged in any runtime
        environment, which makes it possible to ensure real program portability.
        This means that you don''t have to rewrite the code when switching from one platform to another. Although strict type control can lead to a slight performance degradation in some execution environments, it is a prerequisite for program portability.</p>
        <h2 class="chapterTitle">Built-in primitive Jav data types</h2>
        <table class="examples">
                <thead class="examplesHead">
                    <tr>
                        <th>Type</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>boolean</th>
                        <th>Represents the boolean values t rue and fal se</th>
                    </tr>
                    <tr>
                        <th>byte</th>
                        <th>8-bit integer</th>
                    </tr>
                    <tr>
                        <th>char</th>
                        <th>Symbol</th>
                    </tr>
                    <tr>
                        <th>double</th>
                        <th>Double-precision floating-point numeric value</th>
                    </tr>
                    <tr>
                        <th>float</th>
                        <th>Single-precision floating-point numeric value</th>
                    </tr>
                    <tr>
                        <th>int</th>
                        <th>Integer number</th>
                    </tr>
                    <tr>
                        <th>long</th>
                        <th>Long integer</th>
                    </tr>
                    <tr>
                        <th>short</th>
                        <th>Short number</th>
                    </tr>
                </tbody>
            </table>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '5', '2', 'Variables',
    '<!---->
        <h2 class="chapterTitle">Learn more about variables</h2>
        <p class="chapterDescription">As you already know, a variable is declared like this:
        variable name type;
        where the type denotes the specific type of the variable being declared
        , and the variable name denotes its name. You can declare a variable of any valid type,
        including the simple types discussed earlier. When a variable is declared,
        an instance of the appropriate type is created. Therefore, the capabilities of a variable are determined by its type. For example, a boolean variable cannot be
        used to store a floating-point value. Throughout the lifetime of a variable, its type remains unchanged. So, the variable
        int cannot turn into a cha r variable. </p>
        <p class="chapterDescription">In Java, each variable must be declared before it can be used.
        After all, the compiler needs to know what type of data the variable contains,and only then will he be able to correctly compile the instruction that uses the variable . Declaring variables also allows for
        strict type control in Java.</p>
        <h2 class="chapterTitle">Initializing variables</h2>
        <p class="chapterDescription">Before you can use a variable in an expression, you must assign a
        value to it. You can do this, in particular, by using the assignment operator that you are already familiar with. There is another way: initialize a variable when it is declared. To do this, it is enough to specify
        an equal sign and the required value after the variable name. Here is the general form and initialization of the variable:
        type variable = value ;
        where the value denotes the specific value that the variable receives
        when it is created, and the value type must match the specified type
        a variable. Below are a number of examples of variable initialization. </p>
   <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '6', '3', 'Arrays',
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
    '7', '3', 'Class',
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
    '8', '3', 'String',
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
    '9', '4', 'Conditional IF statement',
    '<!---->
        <h2 class="chapterTitle">Conditional if statement</h2>
        <p class="chapterDescription">This conditional instruction has already been presented in chapter 1, and it will now be
        discussed in more detail. Conditional instructions are also called
        branch commands, because they are used to select the code branch to be executed. The full form of the conditional instruction i f is shown below .
        i f (condition ) manual;
        else instruction; </p>
        <p class="chapterDescription">Here, the condition is some conditional expression, and after
        the keyword i f or else there is a single statement . The else clause does not appear
        it is mandatory. The if and else keywords can also be followed by blocks of
        instructions </p>
        <p class="chapterDescription">If the conditional expression turns out to be true, then the i f branch is executed.
        Otherwise, the else branch is executed, if it exists. It is not possible to execute two branches at once. The conditional expression that controls the if statement must produce a boolean result. </p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '10', '4', 'Switch Statement',
    '<!---->
        <h2 class="chapterTitle">Switch Statement</h2>
        <p class="chapterDescription">The second selection instruction in Java is swi t ch, which provides multi
        -variant branching of the program. This instruction allows you to make a choice among several alternative options (branches) for further execution of the program. Despite the fact that the multivariate check can be
        organized using a sequential series of nested conditional instructions i f, in many cases it is more effective to use
        the swi t ch instruction . It works as follows. The value of the expression is
        compared sequentially with the constants from the specified list. As soon as
        a match is found, and the corresponding sequence of instructions is executed.</p>
        <p class="chapterDescription">In Java versions prior to JDK 7, the expression controlling the swi t ch statement must be of type byte, short, i nt, char, or an enumeration. </p>
        <p class="chapterDescription">Since JDK 7, the expression can be of the String type. This
        means that in modern versions of Java, you can use a character string to control the swi t ch statement
        . (This programming technique will be demonstrated in Chapter 5 when considering the S t ring class.) But often, a simple variable is used instead of a complex expression as the expression that controls the swi t ch structure. </p>
        <p class="chapterDescription">Each value specified in the c a se clauses must be a unique expression that includes constants (for example, the value of an iteral).
        Duplicate case values are not allowed. The type of each value must be
        compatible with the type of the expression. </p>
        <p class="chapterDescription">The sequence of instructions from the de fault branch is executed if none of the selection constants in the ca se branch matches the specified expression. The branch de f a and 1 t is not mandatory . If
        it is missing and the expression does not match any of the conditions in the clean-up, then
        no action is performed at all. If there is a match with
        one of the selection conditions, then the instructions associated with this condition are also executed, up to the break statement. Or, if this sentence is de faul t l for
        the last sentence of cas e, in which everything is filled, up to the end
        of the swit ch statement. </p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '11', '4', 'FOR loop',
    '<!---->
        <h2 class="chapterTitle">For loop</h2>
        <p class="chapterDescription">The for loop has already been introduced in chapter 1, and is discussed in more
        detail here. I bet you will be pleasantly surprised by the efficiency and flexibility of this
        cycle. First of all, let us turn to the most basic and traditional forms
        the for loop.</p>
        <p class="chapterDescription">Here, the initialization is usually represented by the assignment statement that sets the original inoe the value of the control variable , which
        plays the role of the loop; the condition is a Boolean expression that defines
        by which the necessity of repeating the cycle; and iteration - is an expression that determines the amount by which you must change the value of the management
        variable (at each step of the cycle). Note that these three
        components of the for loop definition must be separated by a semicolon. The execution of the for loop will continue until the result
        the condition check will be true. As soon as the check returns a false result, the
        loop will end, and the program will continue with the statement
        following the for loop. </p>
        <p class="chapterDescription">The value of the loop variable can increase or decrease, and the increment value can be selected arbitrarily. For example, in
        the code snippet below, the numbers from 1 00 to -95 are output, and at each step, the value of the loop variable is reduced by 5. </p>
        <p class="chapterDescription">For for loops, it should be emphasized that the condition is always checked at the very beginning of the loop. This means that the code in the loop may not be
        executed at all if the condition being checked turns out to be false from the very beginning.
        Consider the following example. </p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '12', '4', 'WHILE loop',
    '<!---->
        <h2 class="chapterTitle">The while loop</h2>
        <p class="chapterDescription">Another type of loop in Java is the while loop. The following is the general syntax for this loop:
        while (condition ) block;
        where a block is an individual instruction or a block of instructions, and a condition means a specific loop control condition and can be any logical
        expression. In this loop, the block is executed as long as the condition is true.</p>
        <p class="chapterDescription">As soon as the condition becomes false, control of the program is passed to the
        line of code immediately following the loop. </p>
        <p class="chapterDescription>As in the for loop, the whi le loop checks the conditional expression specified at the very beginning of the loop. This means that the code in the body of the loop may
        not be executed at all, and also eliminates the need to perform a separate check before the loop itself. This property of the whi le loop is demonstrated in the following program example, where integer powers of 2 are calculated: from 2
        ° to 2 9</p>
        <p class="chapterDescription">Note that the whi le loop is executed only if the value of the variable e is greater than zero. And when it is zero, as is the
        case in the first step of the for loop, the whi le loop is skipped. </p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '13', '5', 'The arithmetic operators',
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
    '14', '5', 'The relation operators',
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
    '15', '5', 'The logical operators',
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
    '16', '5', 'Operators precedence',
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
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '17', '6', 'What is exception',
    '<!---->
        <h2 class="chapterTitle">Exception</h2>
        <p class="chapterDescription">In this chapter, we will talk about handling exceptional situations, or, as they
        say, exceptions. An exception is an error that occurs during the execution of a program. Using the Java exception handling subsystem, you
        can control the program''s response to errors at runtime. Exception handling tools in one form or another are available in almost all modern programming languages. We can safely say that in Java, such tools are more
        flexible, clearer and more convenient to use compared to most
        other programming languages. </p>
        <p class="chapterDescription">The advantage of exception handling is that it provides an automatic response to many errors, eliminating the need to manually write the corresponding code. For example, some legacy programming languages provide for the return of special code
        when an error occurs during the execution of a method. This code has to
        be checked manually every time the method is called. This approach to
        manually handling errors is time-consuming and fraught with failures. Exception handling simplifies this process by providing the ability to define a block of code in the program,
        called an exception handler and automatically executed when
        an error occurs. This eliminates the need to manually check
        how successfully or unsuccessfully a particular operation was performed. If an error occurs, the exception handler will perform all the necessary actions to resolve it. </p>
        <p class="chapterDescription">Java defines standard exceptions for the most common program errors, including division by zero or attempts to open a non-existent file
        . To provide the required response to a specific error, the program should include the appropriate event handler. Exceptions are widely used in the standard Java API library .
        In other words, for successful programming in Java, you need to be able to
        handle the exception handling subsystem provided in this programming
        language. </p>
    <!---->'
);
INSERT INTO `cybermind`.`chapter` (`id`, `learn_id`, `name`, `text`) VALUES (
    '18', '6', 'Using the try and catch instructions',
    '<!---->
        <h2 class="chapterTitle">General information about exception handling</h2>
        <p class="chapterDescription">Java provides five keywords for exception handling: t ry,
        catch, throw, throws, and finally. They form a single subsystem in which the
        use of one keyword almost always automatically entails
        the use of another. Each of the keywords mentioned above will be
        discussed in detail later. But first, you should get a general idea
        of their role in the exception handling process. Therefore, it is briefly explained below how they work. </p>
        <p class="chapterDescription">Instructions that need to track the occurrence of exceptions are enclosed in the t r y block. If an exception is thrown in the try block, you
        can catch it and handle it as needed. System exceptions are generated automatically. And in order to generate exception
        352 Java: Beginner''s guide, 7th and building
        manually, you should use the throw instruction. And when there is a need to handle exceptions outside of the method in which they occur, in which case you need to specify them using the keyword
        throws. The code that should be executed after exiting the
        t ry block anyway is placed in the finally block. </p>
        <h2 class="chapterTitle">Using the try and catch instructions</h2>
        <p class="chapterDescription">The main language tools for handling exceptions are the try and cat ch instructions. They are used together. This means that you
        cannot specify the cat ch keyword in the code without specifying the t ry keyword.
        Below is a general form of writing the try /ca t ch blocks intended for exception handling. </p>
        <p class="chapterDescription">The brackets following the keyword ca t ch indicate the type of exception and the variable referring to the object of this type. When an exception occurs, it is intercepted by the corresponding ca t ch instruction,
        processing this exception. As follows from the above general
        form of writing, several catch statements can be associated with a single t ry
        block. The exception type determines which cat ch statement will be executed . So, if the exception type corresponds to the specification
        of the cat ch instruction, then it will also be executed, and the rest of the cat ch instructions will be executed. -
        skipped. When the exception is intercepted, the variable specified in parentheses after the cat ch keyword is assigned a reference to the exception object_. </p>
        <p class="chapterDescription">Keep in mind that if no exception is thrown, the try block terminates normally, and none of its catch statements are executed . The program execution continues with the first instruction following
        the last cat ch instruction. Thus, cat ch instructions are executed only when an exception occurs . </p>
    <!---->'
);


