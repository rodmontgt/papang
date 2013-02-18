package
{
   import flash.display.MovieClip;
   import flash.ui.Keyboard;
   import flash.events.KeyboardEvent;
   import fl.transitions.Tween;
   import fl.transitions.easing.*;
   import fl.transitions.TweenEvent;
   
   public class DisparadorVertical extends MovieClip
   {
      private var estaDisparando : Boolean;
      private var dragonVolando : Tween;
      
      private const PASOS : uint = 5;
      private const ANCHO_DEL_CABALLERO : uint = 75;
      private const LIMITE_IZQUIERDA : uint = 0;
      private const LIMITE_DERECHA : uint = 475;
      
      public function DisparadorVertical()
      {
         iniciarVuelo();
         iniciarDragon();
         detenerAnimaciones();
         agregarListeners();
      }
      
      private function iniciarVuelo() : void
      {
         dragonVolando = new Tween(dragon, "x", None.easeIn, 550, -dragon.width, 5, true);
      }
      
      private function iniciarDragon() : void
      {
         dragonVolando.stop();
         moverDragon();
      }
      
      private function moverDragon(evento : TweenEvent = null) : void
      {
         dragonVolando.start();
         dragonVolando.addEventListener(TweenEvent.MOTION_FINISH, moverDragon);
         dragonVolando.addEventListener(TweenEvent.MOTION_CHANGE, detectarDisparo);
      }
      
      private function detectarDisparo(evento : TweenEvent) : void
      {
         if(flecha.hitTestObject(dragon))
         {
            iniciarDragon();
         }
      }
      
      private function detenerAnimaciones() : void
      {
         caballero.cuerpo.stop();
         caballero.piernas.stop();
      }
      
      private function agregarListeners() : void
      {
         stage.addEventListener(KeyboardEvent.KEY_UP, detenerCaballero);
         stage.addEventListener(KeyboardEvent.KEY_DOWN, revisarInteraccion);      
      }

      private function revisarInteraccion(evento : KeyboardEvent) : void
      {
         if(evento.keyCode == Keyboard.LEFT)
         {
            moverCaballero(-PASOS);
         }
         else if(evento.keyCode == Keyboard.RIGHT)
         {
            moverCaballero(PASOS);
         }
         if(evento.keyCode == Keyboard.UP)
         {
            if(!estaDisparando) dispararFlecha();
         }
      }
      
      private function moverCaballero(distancia : int) : void
      {
         var nuevaPosicion : int = caballero.x + distancia;
         if(nuevaPosicion > LIMITE_IZQUIERDA && nuevaPosicion < LIMITE_DERECHA)
         {
            caballero.x += distancia;
            caballero.piernas.play();
         }
         else
         {
            detenerCaballero();
         }
      }
      
      private function detenerCaballero(evento : KeyboardEvent = null) : void
      {
         caballero.piernas.gotoAndStop(1);
      }
      
      private function dispararFlecha() : void
      {
         estaDisparando = true;
         caballero.cuerpo.play();
         flecha.x = caballero.x + ANCHO_DEL_CABALLERO / 2;
         var disparar : Tween = new Tween(flecha, "y", None.easeIn, caballero.y, -50, 1, true);
         disparar.addEventListener(TweenEvent.MOTION_FINISH, flechaDisparada);
      }
      
      private function flechaDisparada(evento : TweenEvent) : void
      {
         estaDisparando = false;
      }
   }
}