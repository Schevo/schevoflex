from pyamf.remoting.wsgigateway import WSGIGateway

from schevoflex.service import SERVICES


def app_factory(global_config, **local_config):
    app = WSGIGateway(SERVICES)
    return app
