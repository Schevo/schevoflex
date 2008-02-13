/*
Tests for schevo.Service class.

Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
*/

package schevo
{
import flex.messaging.services.RemotingService;

import flexunit.framework.TestCase;
import flexunit.framework.TestSuite;

public class ServiceTest extends TestCase {
  public function ServiceTest(methodName:String=null) {
    super(methodName);
  }

  public function testGetVersion():void {
    // Connect to test server gateway.
    var gatewayUrl:String = "http://localhost:10101/gateway";
    var gw:RemotingService = new RemotingService(gatewayUrl);
    var service = gw.getService("service");
    var expected:String = "1.0a1dev";
    var version:String = service.getVersion();
    assertTrue("Version mismatch.", expected == version);
  }
}

}
