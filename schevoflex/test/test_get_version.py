import pkg_resources

from pyamf.remoting import client


class TestGetVersion(object):

    def setUp(self):
        self.gw = client.RemotingService('http://localhost:10101/gateway')
        self.service = self.gw.getService('service')

    def tearDown(self):
        del self.gw
        del self.service

    def test_get_version(self):
        expected = pkg_resources.require('SchevoFlex')[0].version
        version = self.service.getVersion()
        assert expected == version
