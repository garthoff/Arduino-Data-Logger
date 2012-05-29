// Get the value from the potentiometer
// and alternate from one led to another 
// with a delay based on the pot position.
void potFlasher()
{
    int potVal = firmata.sensorSample( 3, Firmata.pot );
    int dTime = potVal / 2;
    print( "Pot value: " + potVal + " | " );
    println( "dTime: " + dTime + "." );
   
    // Turn on the red LED:
    firmata.ledControl( Firmata.ledR, true );
    firmata.ledControl( Firmata.ledG, false );
    delay( dTime );
    // Turn on the green LED:
    firmata.ledControl( Firmata.ledR, false );
    firmata.ledControl( Firmata.ledG, true );
    delay( dTime ); 
}
