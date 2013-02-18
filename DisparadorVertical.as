package
{
   import flash.display.MovieClip;
   
   public class DisparadorVertical extends MovieClip
   {
      public function DisparadorVertical()
      {
         detenerAnimaciones();
      }
      
      private function detenerAnimaciones() : void
      {
         caballero.cuerpo.stop();
         caballero.piernas.stop();
      }
   }
}