package
{
   import flash.display.MovieClip;
   import flash.ui.Keyboard;
   import flash.events.KeyboardEvent;
   
   public class DisparadorVertical extends MovieClip
   {
      private const PASOS : uint = 5;
      
      public function DisparadorVertical()
      {
         detenerAnimaciones();
         agregarListeners();
      }
      
      private function detenerAnimaciones() : void
      {
         caballero.cuerpo.stop();
         caballero.piernas.stop();
      }
      
      private function agregarListeners() : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN, revisarInteraccion);
      }

      private function revisarInteraccion(evento : KeyboardEvent) : void
      {
         if(evento.keyCode == Keyboard.LEFT)
         {
            caballero.x -= PASOS;
         }
         else if(evento.keyCode == Keyboard.RIGHT)
         {
            caballero.x += PASOS;
         }
      }
   }
}