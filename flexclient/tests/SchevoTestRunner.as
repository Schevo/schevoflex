/*
SchevoFlex client test runner.

Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
*/

import flexunit.framework.TestSuite;

import schevo.ServiceTest;
import schevo.util.SetTest;

			
private function onCreationComplete():void
{
  testRunner.test = createSuite();
  testRunner.startTest();	
}

private function createSuite():TestSuite
{
  var ts:TestSuite = new TestSuite();

  // Service-level tests.
  ts.addTestSuite(schevo.ServiceTest);

  // Utility class tests.
  ts.addTestSuite(schevo.util.SetTest);

  return ts;
}
