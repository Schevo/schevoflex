/*
Tests for schevo.util.Set class.

Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
*/

package schevo.util
{

import flexunit.framework.TestCase;
import flexunit.framework.TestSuite;

import schevo.util.Set;


public class SetTest extends TestCase {
  public function SetTest(methodName:String=null) {
    super(methodName);
  }

  public function test_fromArray():void {
    var a:Array = [1, 2, 3];
    var s:Set = Set.fromArray(a);
    assertEquals(s.size, 3);
    assertTrue("1 not in s", s.contains(1));
    assertTrue("2 not in s", s.contains(2));
    assertTrue("3 not in s", s.contains(3));
  }
}

}
