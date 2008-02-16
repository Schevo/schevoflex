/*
  schevo.Service class.

  Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
 */

package schevo
{

import mx.messaging.ChannelSet;
import mx.rpc.AsyncToken;     
import mx.rpc.remoting.RemoteObject;

public class Service extends Object
{
  private var remoteObj:RemoteObject;
  
  public function Service(channelSet:ChannelSet)
  {
    var remoteObj:RemoteObject = new RemoteObject("schevo");
    remoteObj.channelSet = channelSet;
    this.remoteObj = remoteObj;
  }

  public function cleanSlate():AsyncToken
  {
    return this.remoteObj.getOperation("debug.cleanSlate").send();
  }

  public function getDatabaseNames():AsyncToken
  {
    return this.remoteObj.getOperation("service.getDatabaseNames").send();
  }

  public function getVersion():AsyncToken
  {
    return this.remoteObj.getOperation("service.getVersion").send();
  }
}

}