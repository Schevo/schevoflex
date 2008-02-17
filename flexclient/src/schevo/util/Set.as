/*
  Set type.
 */

package schevo.util
{

import flash.utils.Dictionary;


public class Set extends Object
{
  private var _d:Dictionary;
  private var _size:int;

  public function Set() {
    _d = new Dictionary();
    _size = 0;
  }

  public static function fromArray(a:Array):Set {
    var s:Set = new Set();
    for (var i:int = 0; i < a.length; ++i) {
      s.add(a[i]);
    }
    return s;
  }

  public function add(value:Object):void {
    _d[value] = true;
    _size += 1;
  }

  public function contains(value:Object):Boolean {
    return _d[value] === true;
  }

  public function get size():int {
    return _size;
  }
}

}
