from pyamf.remoting.wsgigateway import WSGIGateway


def app_factory(global_config, **local_config):
    app = WSGIGateway()
    return app
