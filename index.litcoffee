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
Visit http://www.arduino.cc to learn about the Arduino.*

The latest version of the online guide by SparkFun is found [here](https://learn.sparkfun.com/tutorials/sik-experiment-guide-for-arduino---v33).

---
There are 16 circuits in total. Click on the link to go to the page with detailed explanations. Scroll down on this page to see a summary of each circuit.


1.  [Blinking an LED](circuit1.html)
2.  [Reading a Potentiometer](circuit2.html)
3.  [Driving an RGB LED](circuit3.html)
4.  [Driving Multiple LEDs](circuit4.html)
5.  [Push Buttons](circuit5.html)
6.  [Reading a Photoresistor](circuit6.html)
7.  Reading a Temperature Sensor
8.  Driving a Servo Motor
9.  Using a Flex Sensor
10. Reading a Soft Potentiometer
11. Using a Piezo Buzzer
12. Driving a Motor
13. Using Relays
14. Using a Shift Register
15. Using an LCD
16. Simon Says



Circuit 1
---
> Turn an LED on for one second, off for one second, and repeat forever.

---
We learned about the two main parts of an Arduino program, `setup()` and `loop()`.

In `setup()`, the `pinMode()` function needed to be activated.


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

Circuit 2
---
> Measure the position of a potentiometer and use it to
control the blink rate of an LED. Turn the knob to make it blink faster or slower!

---
We learned about **variables** and the advantages over **hard-coding** values. We used the **potentiometer** to vary the resistance in a circuit. What are everyday examples of control knobs?


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

Circuit 3
---
> Cycle through a set of 7 distinct colors on the RGB LED. Then, cycle through a much larger set of colors.

---
We learned about **functions** (like mini-programs that can be used over and over again), **for loops** (repeating a task for a certain number of times), and **if-then statements** (making decisions based on comparing values).

The **RGB LED** allows a variety of colors to be shown, based on the combination of the red, green, and blue LED.

    const int RED_PIN = 9;
    const int GREEN_PIN = 10;
    const int BLUE_PIN = 11;
    const int DISPLAY_TIME = 1000;

    void setup()
    {
      pinMode(RED_PIN, OUTPUT);
      pinMode(GREEN_PIN, OUTPUT);
      pinMode(BLUE_PIN, OUTPUT);
    }

    void loop()
    {
      mainColors(); /* Cycles between 7 distinct colors*/
      showSpectrum(); /* Fades from red to green to blue*/
    }

    void mainColors()
    {
      /*Code shown in the Circuit 3 page */
    }
    void showSpectrum()
    {
      /*for loop, if-then*/
      RGB();
      /*Code shown in the Circuit 3 page */
    }
