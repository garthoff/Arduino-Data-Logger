class Firmata
{
    private Arduino a;
    
    // --- Arduino Pin Numbers ---  //
    static final int pot         = 5;      // Potentiometer on Analog Pin 5.
    static final int ledG        = 3;      // Green LED on Digital Pin 3.
    static final int ledR        = 5;      // Red LED on Digital Pin 5.
    static final int btn         = 7;      // Momentary Push-Button on Digital Pin 7.
    
    // ------- Pin Arrays --------  // 
    private final int myInPins[]  = { btn };        // Input pin array.
    private final int myOutPins[] = { ledG, ledR }; // Output pin array.
    
    
    // Constructor:
    Firmata( Arduino arduino )
    {
        a = arduino;    // Internal reference to Arduino class.
        setPinModes();  // Configure pins.
    }
    
    
    // --- Public Methods ---  //
    
    // Sample a sensor x amount of times and return
    // the average value of the readings. This will
    // produce a more accurate and smooth result.
    public int sensorSample( int resolution, int pin )
    {
        int avgReading = 0;         // Return value.
        for ( int i = 0; i < resolution; i++ )
            avgReading += a.analogRead( pin );  // Add reading to running total.
        
        avgReading /= resolution;   // Calculate the average.
        return avgReading;
    }
     
    
    // Flash the LEDs x times with a delay
    // 'dTime' milliseconds apart.
    public void ledFlasher( int x, int dTime )
    {
        for ( int i = 0; i < x; i++ )
        {
            // Turn on the red LED:
            ledControl( ledR, true );
            ledControl( ledG, false );
            delay( dTime );
            // Turn on the green LED:
            ledControl( ledR, false );
            ledControl( ledG, true );
            delay( dTime );
        }
        // Turn off both LEDs
        ledControl( ledR, false );
        ledControl( ledG, false );
    }
    
    
    // Control a given LED based on the pin number
    // and state given. If 'state' is true the LED
    // is on and vice-versa.
    public void ledControl( int led, boolean state )
    {
        if ( state )
            a.digitalWrite( led, Arduino.HIGH );
        else if ( !state )
            a.digitalWrite( led, Arduino.LOW );
    }
    
    
    
    // --- Private Methods --- //
    
    // Sets the pin modes for the input
    // and output pins. The mode must only be set for
    // digital pins as the analog pins can only be used
    // as an input with Firmata.
    private void setPinModes()
    {
        // Set the input pins:
        for ( int i = 0; i < myInPins.length; i++ )
            a.pinMode( myInPins[i], Arduino.INPUT );
  
        // Set the output pins:
        for ( int i = 0; i < myOutPins.length; i++ )
            a.pinMode( myOutPins[i], Arduino.OUTPUT );
  
        println( "Set input & output pin modes." );
        println( "Arduino is now fully configured." );
    }
}
