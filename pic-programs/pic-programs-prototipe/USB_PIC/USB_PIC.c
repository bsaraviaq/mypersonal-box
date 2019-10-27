//Declaración de variables globales
//como búfer de entrada y salida en el USB.
unsigned short Br[64];
unsigned short Bw[64];


//Función de interrupciones.
void interrupt( void )
{
     USB_Interrupt_Proc();
}
void main( void )
{
     //Declaración de variables.
     unsigned short n;
     char DATO;
     //Configuración del PIC, e interrupciones.
     INTCON = 0;
     INTCON2 = 0xF5;
     INTCON3 = 0xC0;
     RCON.IPEN = 0;
     PIE1 = 0;
     PIE2 = 0;
     PIR1 = 0;
     PIR2 = 0;
     //Configuración de puertos.
     TRISD.F0 = 0;

     hid_Enable(&Br,&Bw);//Función de inicio para el puerto USB.
     //Ciclo for para inicializar el búfer en 0.
     for(n=0; n<64; n++)Bw[n]=0;
     while(1) //Bucle infinito.
     {
              PORTD.F0=1;
              delay_ms(500);
              PORTD.F0=0;
              delay_ms(500);
              //Función para verificar los datos de entrada.
              /*
              n=Gen_Read(Br,64,1);
              //Sentencia if para verificar el número bytes de entrada.
              if( n!=0 )
              {
                  PORTB = 255; //Se prende todo el puerto B
                  DATO = Br[0]; //Se lee el dato de entrada.
                  //Se copia el texto, en el búfer de salida.
                  strcpy( Bw, "Se recibio el dato: " );
                  //Se copia el dato de entrada en el búfer.
                  Bw[20]=DATO;
                  //Se anexa el código ASCCI del ENTER en el búfer de salida.
                  Bw[21]=13;
                  //Se anexa el código ASCCI del retroceso del carro en el búfer de salida.
                  Bw[22]=10;
                  //Se envían los datos por el USB.
                  delay_ms(100); //Retardo para el parpadeo del LED.
                  PORTB = 0; //Se apaga el puerto B.
              }
              */
     }
}