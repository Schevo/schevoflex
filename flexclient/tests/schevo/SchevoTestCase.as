/*
  Tests for schevo.Service class.
  
  Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
 */

package schevo
{

import flash.events.Event;

import mx.collections.ItemResponder;
import mx.messaging.ChannelSet;
import mx.messaging.channels.AMFChannel;
import mx.rpc.AsyncToken;     

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

  protected static function defaultService():Service
  {
    return new Service(defaultChannelSet());
  }

  protected static function noDebugChannelSet():ChannelSet
  {
    return channelSet(["http://localhost:10101/gateway-nodebug"]);
  }

  protected static function noDebugService():Service
  {
    return new Service(noDebugChannelSet());
  }

  protected function checkCallResult(call:AsyncToken, check:Function, 
                                     timeout:int=2000):void
  {
    var asyncDone:Function = addAsync(check, timeout);
    var handler:Function = function (event:Event, token:Object=null):void
      {
        asyncDone(event);
      };
    call.addResponder(new ItemResponder(handler, handler));
  }

}

}
