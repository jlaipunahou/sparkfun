SparkFun Inventor's Kit: Circuit #3
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
Visit the [SparkFun website](https://learn.sparkfun.com/tutorials/sik-experiment-guide-for-arduino---v33/experiment-1-blinking-an-led) for SIK information.
Visit http://www.arduino.cc to learn about the Arduino.*


Overview
---------------------------------------
Circuit #3: RGB LEDs

> Cycle through a set of 7 distinct colors on the RGB LED. Then, cycle through a much larger set of colors.

---

Click [here](https://learn.sparkfun.com/tutorials/sik-experiment-guide-for-arduino---v33/experiment-3-driving-an-rgb-led) for images and further explanation from the SparkFun website.

---
A RGB LED consists of 3 LEDs in one—red, green, and blue!

The first part of the code should look familiar. Variables are declared and ports are initialized through `pinMode`.

The `loop()` calls two yet-to-be-defined functions, `mainColors()` and `showSpectrum()`. The moment when either of the functions are called, then it will search the entire code for where `mainColors()` and `showSpectrum()` are defined.

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

## Functions

### mainColors()

So far, we have dealt with writing our own `setup()` and `loop()` functions, in addition to built-in functions such as `pinMode()` and `digitalWrite()`. Let's talk about creating **functions** that consist of code that we want to use again and again.

In the function `mainColors()`, three `digitalWrite()` commands create the color. If all three LEDs are `LOW`, that means no LEDs are on. Look through the Red, Green, and Blue sections of the code to verify that for each one, only the respective Pin is `HIGH`.

Also, each color section has a `delay()` that shows that color for the time of `DISPLAY_TIME`. Does each color show for the same amount of time? If not, how would you change that?

    void mainColors()
    {
      // all LEDs off
      digitalWrite(RED_PIN, LOW);
      digitalWrite(GREEN_PIN, LOW);
      digitalWrite(BLUE_PIN, LOW);
      delay(DISPLAY_TIME);

      // Red
      digitalWrite(RED_PIN, HIGH);
      digitalWrite(GREEN_PIN, LOW);
      digitalWrite(BLUE_PIN, LOW);
      delay(DISPLAY_TIME);

      // Green
      digitalWrite(RED_PIN, LOW);
      digitalWrite(GREEN_PIN, HIGH);
      digitalWrite(BLUE_PIN, LOW);
      delay(DISPLAY_TIME);

      // Blue
      digitalWrite(RED_PIN, LOW);
      digitalWrite(GREEN_PIN, LOW);
      digitalWrite(BLUE_PIN, HIGH);
      delay(DISPLAY_TIME);

      // Yellow (Red and Green)
      digitalWrite(RED_PIN, HIGH);
      digitalWrite(GREEN_PIN, HIGH);
      digitalWrite(BLUE_PIN, LOW);
      delay(DISPLAY_TIME);

      // Cyan (Green and Blue)
      digitalWrite(RED_PIN, LOW);
      digitalWrite(GREEN_PIN, HIGH);
      digitalWrite(BLUE_PIN, HIGH);
      delay(DISPLAY_TIME);

      // Purple (Red and Blue)
      digitalWrite(RED_PIN, HIGH);
      digitalWrite(GREEN_PIN, LOW);
      digitalWrite(BLUE_PIN, HIGH);
      delay(DISPLAY_TIME);

      // White (turn all the LEDs on)
      digitalWrite(RED_PIN, HIGH);
      digitalWrite(GREEN_PIN, HIGH);
      digitalWrite(BLUE_PIN, HIGH);
      delay(DISPLAY_TIME);
    }

### showSpectrum()

`showSpectrum()` includes a sub-function called `RGB()` located within it. Also, there is the `delay()` function, which will wait for `10` milliseconds, which is a tenth of a second. *Why is this important in seeing the LED behave?*


## For loops

In `'showSpectrum()`, there is a **for loop**. The for loop will repeat the same code (the code within the curly braces `{}`) for a certain number of times.

    void showSpectrum()
    {
      for (int x = 0; x <= 767; x++)
      {
        RGB(x);      // Increment x and call RGB() to progress through colors.
        delay(10);   // Delay for 10 ms (1/100th of a second) - to help the "smoothing"
      }
    }

Within the parentheses `()`, there are three settings for any **for loop**.
1.  Initialize the variable
2.  How far will it go
3.  What to do after each step

In our specific for loop, these are the settings
1.  An integer named `x`, starting at the value of `0`
2.  The loop will **stop** once `x` is equal to `768`
3.  After each time the code in the braces `{}` is executed by the program, `x` will **increment** by one, which is a fancy way to say **increase**.

*How many times will the for loop execute?*

    for (int x = 0; x <= 767; x++)
    {
      /* Repeated code goes here, where some variable `x` is increased (incremented)
      each time the program goes through this code*/
    }

### RGB()

Based on the commenting in the original Arduino code, we know that `RGB()` it will take a color value based on an `int` (integer) number and show that color. That is **what** it does. Now let's learn **how** does it show that color?

Why do we have the parentheses `()` after the function name? So far, there has been nothing there. However, `RGB()`'s definition has something. The code in the parentheses is called the **argument**. `RGB()` **function** will take that **argument** and do something to it. At the end of the function, there will be a result based on whatever you've programmed. In this case, the RGB LED will show a specific color.

    void RGB(int color)
    /* If you think of RGB() as a verb, then the argument (int color) is a direct object*/



Within `RGB()`, there are three parts. The first part of initializing variables is familiar.

    void RGB(int color)
    {
      int redIntensity;
      int greenIntensity;
      int blueIntensity;
    }
    color = constrain(color, 0, 767);

* Initializing **local** variables: `redIntensity`, `greenIntensity`, `blueIntensity`
  * These variables are only accessible within `RGB()`. A **global** variable is accessible everywhere.
* Making decisions based on the `color` variable, using an **if-then** statement.
* Sending the intensity values to the LEDs via `analogWrite()`

We also see `constrain()`. Arduino has documentation on what the function does. Learning new functions as you need them is an important skill. Click [here](https://www.arduino.cc/en/Reference/Constrain) to see how to use `constrain()`.

---

## IF-then statements

**If-then statements** are another essential building block in programming. If the statement in the parentheses `()` are true, then do what is in the braces `{}`. An `else if` can be used to define other possible true statements. The `else` says if nothing in the `if` or `else if` was true, then do what is after `else`.



The if statement breaks down `color` into three numberical ranges, where the values of `redIntensity`, `greenIntensity`, `blueIntensity` may or may not be changed, depending on what is in the braces `{}`.
1.  (0 - 255) - red to green
2.  (256 - 511) - green to blue
3.  (>= 512)- blue to red

Whatever are the values of `redIntensity`, `greenIntensity`, `blueIntensity` at the end of this big **if-then** statement, the values are then sent to the LED via `analogWrite()`.

    if (color <= 255)
    {
      redIntensity = 255 - color;    // red goes from on to off
      greenIntensity = color;        // green goes from off to on
      blueIntensity = 0;             // blue is always off
    }
    else if (color <= 511)
    {
      redIntensity = 0;                     // red is always off
      greenIntensity = 511 - color;         // green on to off
      blueIntensity = color - 256;          // blue off to on
    }
    else
    {
      redIntensity = color - 512;         // red off to on
      greenIntensity = 0;                 // green is always off
      blueIntensity = 767 - color;        // blue on to off
    }

    // "send" intensity values to the Red, Green, Blue Pins using analogWrite()
    analogWrite(RED_PIN, redIntensity);
    analogWrite(GREEN_PIN, greenIntensity);
    analogWrite(BLUE_PIN, blueIntensity);
    }

Summary
---
There was a lot covered in Circuit #3.
* The essential concept is that the RGB will show a color based on a stored variable.
  * In Circuit #2, the variable changed based on the potentiometer.
  * However, in this circuit, it is based on pre-programmed values.
  * It changes using a combination of a **for loop** and an **if-then statement**.

Three functions were written specfically for the Circuit #3 programming, which were called in the main `loop()`
* `mainColors()`: defined a sequence of seven distinct colors, each of which was a combination of the R, G, B either on or off.
*  `showSpectrum()`: **for loop** cycled through hundreds of shades of color, separated by a tenth of a second
  * `RGB()`: took an **argument** variable, `x` from the **for loop**, and matched it in one of three ranges. Using the **if-then**, it assigned a value


### **How might you program you own sequence of colors?**

    const int RED_PIN = 9;
    const int GREEN_PIN = 10;
    const int BLUE_PIN = 11;
    const int DISPLAY_TIME = 1000;

    void setup()
    {
      pinMode(RED_PIN, OUTPUT); pinMode(GREEN_PIN, OUTPUT); pinMode(BLUE_PIN, OUTPUT);
    }
    void loop()
    {
      mainColors(); /* Cycles between 7 distinct colors*/
      showSpectrum(); /* Fades from red to green to blue*/
    }
    void mainColors()
    {
      // all LEDs off, Red, Green, Yellow, Cyan, Purple, White all defined and shown for `DISPLAY_TIME`

    }
    void showSpectrum()
    {
      for (int x = 0; x <= 767; x++)
      {
        RGB(x);      // Increment x and call RGB() to progress through colors.
        delay(10);   // Delay for 10 ms (1/100th of a second) - to help the "smoothing"
      }
    }
    void RGB(int color)
    {
      int redIntensity;
      int greenIntensity;
      int blueIntensity;
    }
    color = constrain(color, 0, 767);

[Go back to Index](index.html)

1.  [Blinking an LED](circuit1.html)
2.  [Reading a Potentiometer](circuit2.html)
3.  *Driving an RGB LED*
4.  [Driving Multiple LEDs](circuit4.html)
5.  [Push Buttons](circuit5.html)
6.  [Reading a Photoresistor](circuit6.html)

    if (color <= 255)
    {
      redIntensity = 255 - color;    // red goes from on to off
      greenIntensity = color;        // green goes from off to on
      blueIntensity = 0;             // blue is always off
    }
    else if (color <= 511)
    {
      redIntensity = 0;                     // red is always off
      greenIntensity = 511 - color;         // green on to off
      blueIntensity = color - 256;          // blue off to on
    }
    else
    {
      redIntensity = color - 512;         // red off to on
      greenIntensity = 0;                 // green is always off
      blueIntensity = 767 - color;        // blue on to off
    }

    // "send" intensity values to the Red, Green, Blue Pins using analogWrite()
    analogWrite(RED_PIN, redIntensity);
    analogWrite(GREEN_PIN, greenIntensity);
    analogWrite(BLUE_PIN, blueIntensity);
    }
