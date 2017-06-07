SparkFun Inventor's Kit: Circuit #2
=====

We will use **Arduino** as the programming language for our SparkFun Inventor's Kit circuits. The code has already been written for you. For every circuit, our goal is to:

1. Read the code and understand what it does.
2. Build it in Circuits.io to familiarize yourself with the components.
3. Build the circuit with real components.
4. Run the code to show real-life behavior.
5. Modify the code to change the circuit's behavior.


Read this document **first** before reading the comments in the Arduino **sketch**.

*All sketches were written by SparkFun Electronics,
with lots of help from the Arduino community.
This code is completely free for any use.
Visit http://learn.sparkfun.com/products/2 for SIK information.
Visit http://www.arduino.cc to learn about the Arduino.*


Overview
---------------------------------------
Circuit #2: POTENTIOMETER

> Measure the position of a potentiometer and use it to
control the blink rate of an LED. Turn the knob to make
it blink faster or slower!  

A potentiometer, aka **pot**, is a variable resistor. As you turn the knob, the resistance changes. it is like swapping out resistors of higher and lower values. The change of resistance will change the voltage measured at different points in the circuit.

Circuit #2 looks similar to Circuit #1. What's the difference?

* In Circuit #1, we pre-determined the amount of time the code waited through `delay(1000)`
* Pre-deteriminating is also known as **hard-coding**. The two values **hard-coded** were:
  * the pin number **13**
  * the delay of **1000 milliseconds**
* Instead of **hard-coding**, we will use **variables**.
* In Circuit #2, we will tell the circuit to listen to the voltage measured by `Analog 0` pin. The voltage will change as the *potentiometer* is turned in either direction.



    int sensorPin = 0;
    int ledPin = 13;

    void setup()
    {
        pinMode(ledPin, OUTPUT);
    }

    void loop()
    {
      int sensorValue;
      sensorValue = analogRead(sensorPin);    
      digitalWrite(ledPin, HIGH);     
      delay(sensorValue);             
      digitalWrite(ledPin, LOW);
      delay(sensorValue);   
    }

Variables
----


In programming, we use **variables** to allow the value value of a variable to change easily or to be based on a sensor reading. Think of a **variable** like a container that has a label. The label is the **name** of the variable. In the container, one value can be placed at a time.

You must **declare** variables before you use them, so that the computer knows about them. Here we'll declare two integer variables, and at the same time, **initialize** them to specific values. We're doing this so that further down, we can refer to
the pins by name rather than number.
* If we change our mind about the **value** of a **variable**, we only need to change the value once when it is **initialized**. Then, all instances of that **variable** will change its value.

* Note that variable names are case-sensitive! If you get an "(variable) was not declared in this scope" error, double-check that you typed the name correctly.*


In particular, these two variables are **global** meaning that they can be used throughout the entire code. There will be one **local** variable declared within the `loop()` block.

    int sensorPin = 0;
    int ledPin = 13;



Setup
----

This is identical to Circuit #1 except instead of using `13` as the channel, we use the **variable** `ledPin`. What is the value of `ledPin`? It is initiatlized in the section above the `setup()` block.

    void setup()
    {
        pinMode(ledPin, OUTPUT);
    }


Loop
----

The bottom four lines of code have a similar behavior compared to Circuit #1. The first two lines of code are important to making Circuit #2 work.


The first line is declares the **local** variable `sensorValue`. This **variable** will be used to store the value that is read from the `Analog 0` pin. `sensorValue` would not be accessible to any other **functions** written in the program. It is only accessible within `loop()`.

The second line says to set `sensorValue` to whatever value the function `analogRead()` reads.

`analogRead()` is a function that reads the value from the `Analog 0` pin. How do we know it is Channel 0? The **argument** in `analogRead()` is the variable `sensorPin`. That was initialized to the value of `0` earlier.


    int sensorValue;
    sensorValue = analogRead(sensorPin);

Circuit #2 is set up so that `Analog 0` is reading from the wiper (middle pin) of the potentiometer. As the potentiometer is turned, that voltage reading from the wiper will change. The voltage reading is read by `Analog 0` which in turn is assigned to `sensorValue`. 

How is `sensorValue` used?

    digitalWrite(ledPin, HIGH);     
    delay(sensorValue);             
    digitalWrite(ledPin, LOW);
    delay(sensorValue); 


Summary
---
To conclude, Circuit #2 is similar to Circuit #1 in behavior. The difference is that we now use `Analog 0` as an **input** channel to "listen" or measure the voltage at a certian point in the circuit.

The voltage at that measurement point will change when you turn the knob of the potentiomter. The measured voltage is then used to tell the circuit how long to `delay()`.

The `loop()` repeats the instructions continuously. At any piont in time, if the potentiometer is turned, then the measured voltage changes, thus changing  `sensorValue` and thus changing the `delay`.

The simple way to describe the beavhior is: **as you turn the potentiometer knob one way or the other, the LED will blink faster or slower**.

    int sensorPin = 0;
    int ledPin = 13;

    void setup()
    {
        pinMode(ledPin, OUTPUT);
    }

    void loop()
    {
      int sensorValue;
      sensorValue = analogRead(sensorPin);    
      digitalWrite(ledPin, HIGH);     
      delay(sensorValue);             
      digitalWrite(ledPin, LOW);
      delay(sensorValue);   
    }