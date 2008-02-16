/*
  Tests for schevo.Service class.
  
  Copyright(c) 2008 Orbtech, L.L.C.  Licensed under the LGPL license.
 */

package schevo
{

import flash.events.Event;

import mx.collections.ItemResponder;
import mx.messaging.Channel;
import mx.messaging.ChannelSet;
import mx.messaging.channels.AMFChannel;
import mx.rpc.AsyncToken;     
import mx.rpc.events.ResultEvent;

import schevo.Service;

import schevo.SchevoTestCase;

public class ServiceTest extends SchevoTestCase 
{
  public function ServiceTest(methodName:String=null) 
  {
    super(methodName);
  }

  public function testGetVersion():void 
  {
    var service:Service = new Service(defaultChannelSet());
    var call:AsyncToken = service.getVersion();
    var check:Function = function (event:Event):void
      {
        assertTrue(event.toString(), event is ResultEvent);
        var data:Object = ResultEvent(event).result;
        assertEquals(data, "1.0a1dev");
      };
    var asyncDone:Function = addAsync(check, 2000);
    var handler:Function = function (event:Event, token:Object=null):void
      {
        asyncDone(event);
      };
    call.addResponder(new ItemResponder(handler, handler));
  }

  public function testCleanSlate():void
  {
    var service:Service = new Service(defaultChannelSet());
    var call:AsyncToken = service.cleanSlate();
    var check:Function = function (event:Event):void
      {
        assertTrue(event.toString(), event is ResultEvent);
        var data:Object = ResultEvent(event).result;
        assertEquals(data, null);
      };
    var asyncDone:Function = addAsync(check, 2000);
    var handler:Function = function (event:Event, token:Object=null):void
      {
        asyncDone(event);
      };
    call.addResponder(new ItemResponder(handler, handler));
  }

}

}
