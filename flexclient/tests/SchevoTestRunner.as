/*
SchevoFlex client test runner.

Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
*/

import flexunit.framework.TestSuite;

import schevo.HelloWorldTest;
import schevo.ServiceTest;

			
private function onCreationComplete():void
{
  testRunner.test = createSuite();
  testRunner.startTest();	
}

private function createSuite():TestSuite
{
  var ts:TestSuite = new TestSuite();

  // Examples. XXX: to be removed at some point.
  ts.addTestSuite(HelloWorldTest);

  // Service-level tests.
  ts.addTestSuite(ServiceTest);

  return ts;
}
