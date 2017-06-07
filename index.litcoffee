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

> Turn an LED on for one second, off for one second,
and repeat forever.

In this circuit, we learned about the two main parts of an Arduino program, `setup()` and `loop()`.

In `setup()` the `pinMode()` function needed to be activated.


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
## Circuit 2

> Measure the position of a potentiometer and use it to
control the blink rate of an LED. Turn the knob to make
it blink faster or slower!

In this circuit, we learned about **variables** and the advantages over **hard-coding** values. We used the **potentiometer** to vary the resistance in a circuit. What are everyday examples of control knobs?

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
