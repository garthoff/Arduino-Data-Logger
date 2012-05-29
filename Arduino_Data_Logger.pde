import processing.serial.*;
import cc.arduino.*;


// --- Global Variables --- //
String port;
final int baudRate = 57600;


// ---- Class Objects ----  //
Arduino arduino;    // Library to communicate with arduino running firmata.
Firmata firmata;    // Wrapper class for Arduino library.


void setup() 
{
    // Set the window size:
    size( 200, 200);
    
    // Initialize the Arduino library:
    port = Arduino.list()[0];
    arduino = new Arduino( this, port, baudRate );
    println( "Connected to Arduino at port: \"" + port + "\"." ); 
    
    // Initialize the Arduino wrapper class:
    firmata = new Firmata( arduino );
}


void draw()
{
   potFlasher();
}

