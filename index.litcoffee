SparkFun Inventor's Kit Overview Page
=====

We will use **Arduino** as the programming language for our Sparkfun Inventors Kit circuits. The code has already been written for you. For every circuit, our goal is to:

1. Read the code and understand what it does.
2. Build it in Circuits.io to familiarize yourself with the components.
3. Build the circuit with real components.
4. Run the code to show real-life behavior.
5. Modify the code to change the circuit's behavior.


*Modifications have been made from the originals: All sketches were written by SparkFun Electronics,
with lots of help from the Arduino community.
This code is completely free for any use.
Visit http://learn.sparkfun.com/products/2 for SIK information.
Visit http://www.arduino.cc to learn about the Arduino.*

16 circuits in total. Click on the link to go to the page with detailed explanations. Scroll down on this page to see a summary of each circuit.

The latest version of the online guide by SparkFun is found [here](https://learn.sparkfun.com/tutorials/sik-experiment-guide-for-arduino---v33)

1.  [Blinking an LED](circuit1.html)
2.  [Reading a Potentiometer](circuit2.html)
3.  [Driving an RGB LED](circuit3.html)



## Circuit 1

*Turn an LED on for one second, off for one second,
and repeat forever.*

A **function** is a named block of code, that performs a specific task. Many useful, essential **functions** are already built-in to the Arduino; others you'll name and write yourself for your own purposes.


All Arduino sketches MUST have two specific **functions**, named `setup()` and `loop()`. The Arduino runs these functions automatically when it starts up or if you press the reset button.
* `setup()` is run only *once* at the beginning
* `loop()` is run *continuously*

    void setup()
    {
       pinMode(13, OUTPUT);
     }
    void loop()
    {
      digitalWrite(13, HIGH);
      delay(1000);
      digitalWrite(13, LOW);
      delay(1000);
    }


Setup
----

The Arduino has 13 digital input/output pins. These pins can be configured as either **inputs** or **outputs**. **Output** means it is sending out information. **Input** means it is receiving information, often from sensors.

`pinMode()` is a built-in function. It takes two values, which you type in
the parenthesis after the function name. These two values are the **arguments** of the function. **Arguments** may also be known as **parameters** or **inputs**.

* The first value is a pin number.
* The second value is the word `INPUT` or `OUTPUT`.

Here we'll set up pin 13 (the one connected to a LED) to be an output. We're doing this because we need to send voltage
"out" of the Arduino to the LED.

    void setup()
    {
      pinMode(13, OUTPUT);
    }

Loop
----

Each of the 13 digital pins send either an `ON` or an `OFF` signal. Another way to view it is to think of the `ON` being a `HIGH` voltage of 5 Volts or a `LOW` voltage of 0 volts.

Because we have an LED connected to pin 13, if we make that
output HIGH, the LED will get voltage and light up. If we make
that output LOW, the LED will have no voltage and turn off.

`digitalWrite()` is the built-in function we use to make an
output pin HIGH or LOW. It takes two **arguments**
* The first value is a pin number.
* The second value is either `HIGH` or `LOW`
* In other words, `digitalWrite()` *tells the LED to turn on or off*


    void loop()
    {
      digitalWrite(13, HIGH);



`delay()` is a **function** that pauses for a given amount of time. It takes one value, the amount of time to wait, measured in milliseconds. There are 1000 milliseconds in a second, so if you `delay(1000)`, it will pause for exactly one second.

      delay(1000);

To finish this code, `digitalWrite(13, LOW)` turns off the LED and then `delay(1000)` pauses the code.

      digitalWrite(13, LOW);
      delay(1000);


Because all of this is in a `loop()`, after the second `delay()`, your computer will go back to the beginning and follow the instructions in `loop()` again.

Summary
---
To conclude, after the `setup()` function, the `loop()` conists of four simple commands that translate to the behavior of the blinking LED

1. Turn on the LED
2. Wait a second
3. Turn off the LED
4. Wait a second
5. Go back to step 1

    void loop()
    {
      digitalWrite(13, HIGH);
      delay(1000);
      digitalWrite(13, LOW);
      delay(1000);
    }
