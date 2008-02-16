/*
  Tests for schevo.Service class.
  
  Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
 */

package schevo
{

import mx.messaging.ChannelSet;
import mx.messaging.channels.AMFChannel;

import flexunit.framework.TestCase;

import schevo.Service;

public class SchevoTestCase extends TestCase 
{
  public function SchevoTestCase(methodName:String=null) 
  {
    super(methodName);
  }

  protected static function channelSet(uris:Array):ChannelSet
  {
    var amfChannelSet:ChannelSet = new ChannelSet();
    for (var key:String in uris) {
      amfChannelSet.addChannel(new AMFChannel(null, uris[key]));
    }
    return amfChannelSet;
  }

  protected static function defaultChannelSet():ChannelSet
  {
    return channelSet(["http://localhost:10101/gateway"]);
  }

  protected static function noDebugChannelSet():ChannelSet
  {
    return channelSet(["http://localhost:10101/gateway-nodebug"]);
  }

}

}
