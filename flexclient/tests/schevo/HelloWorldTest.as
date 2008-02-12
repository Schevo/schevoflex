/*
Sample unit test for HelloWorld package.

Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
*/

package schevo
{
import flexunit.framework.TestCase;
import flexunit.framework.TestSuite;

import schevo.HelloWorld;

public class HelloWorldTest extends TestCase {
  public function HelloWorldTest(methodName:String=null) {
    super(methodName);
  }

  public function testSameStringSuccess():void {
    assertTrue("Strings do not match.", HelloWorld.sameString("abc") == "abc");
  }

  public function testSameStringFailure():void {
    assertTrue("Strings do not match.", HelloWorld.sameString("abc") == "xyz");
  }
}
}
