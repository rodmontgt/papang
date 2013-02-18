package
{
   import flash.display.MovieClip;
   
   public class VerticalShoot extends MovieClip
   {
      public function VerticalShoot()
      {
         stopAnim();
      }
      
      private function stopAnim() : void
      {
         knight.body.stop();
         knight.legs.stop();
      }
   }
}
