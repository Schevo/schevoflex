package schevo
{


public class arraytools extends Object
{
  /*
    Return `true` if arrays are equal, or `false` if not.
  */
  public static function equal(self:Array, other:Array):Boolean
  {
    if (self.length != other.length) {
      return false;
    }
    for (var i:int = 0; i < self.length; ++i) {
      if (self[i] !== other[i]) {
        return false;
      }
    }
    return true;
  }
}

}