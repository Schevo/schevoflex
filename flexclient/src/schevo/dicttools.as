package schevo
{

import flash.utils.Dictionary;


public class dicttools extends Object
{
  /*
    Return an Array containing keys of the given dictionary.
  */
  public static function keys(d:*):Array
  {
    var keys:Array = [];
    for (var key:Object in d) {
      keys.push(key);
    }
    return keys;
  }
}

}