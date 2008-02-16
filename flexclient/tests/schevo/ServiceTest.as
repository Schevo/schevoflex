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
import mx.rpc.events.FaultEvent;
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
    var service:Service = defaultService();
    var call:AsyncToken = service.getVersion();
    var check:Function = function (event:Event):void
      {
        assertTrue(event.toString(), event is ResultEvent);
        var data:Object = ResultEvent(event).result;
        var expected:String = "1.0a1dev";
        assertEquals(data, expected);
      };
    checkCallResult(call, check);
  }

  public function testGetDatabaseNamesEmpty():void
  {
    var service:Service = defaultService();
    var call:AsyncToken = service.getDatabaseNames();
    var check:Function = function (event:Event):void
      {
        assertTrue(event.toString(), event is ResultEvent);
        var data:Object = ResultEvent(event).result;
        var expected:Array = [];
        assertEquals(data, expected);
      };
    checkCallResult(call, check);
  }

  public function testCleanSlate():void
  {
    var service:Service = defaultService();
    var call:AsyncToken = service.cleanSlate();
    var check:Function = function (event:Event):void
      {
        assertTrue(event.toString(), event is ResultEvent);
        var data:Object = ResultEvent(event).result;
        var expected:Object = null;
        assertEquals(data, expected);
      };
    checkCallResult(call, check);
  }

  public function testCleanSlateNoDebug():void
  {
    var service:Service = noDebugService();
    var call:AsyncToken = service.cleanSlate();
    var check:Function = function (event:Event):void
      {
        assertTrue(event.toString(), event is FaultEvent);
        var faultString:String = FaultEvent(event).fault.faultString;
        var expected:String = "Unknown service debug.cleanSlate";
        assertEquals(faultString, expected);
      };
    checkCallResult(call, check);
  }

}

}
