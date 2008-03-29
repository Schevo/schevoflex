from pyamf.remoting.gateway.wsgi import WSGIGateway

from schevoflex.service import services_factory


def app_factory(global_config, **local_config):
    services = services_factory(
        dbs = local_config['dbs'],
        debug = (local_config.get('debug') == 'true'),
        )
    app = WSGIGateway(services)
    return app
