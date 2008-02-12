/*
SchevoFlex client test runner.

Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
*/

import flexunit.framework.TestSuite;

import schevo.HelloWorldTest;

			
private function onCreationComplete():void
{
  testRunner.test = createSuite();
  testRunner.startTest();	
}

private function createSuite():TestSuite
{
  var ts:TestSuite = new TestSuite();
  ts.addTestSuite(HelloWorldTest);
  return ts;
}
