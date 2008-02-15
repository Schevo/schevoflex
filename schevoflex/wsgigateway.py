from pyamf.remoting.wsgigateway import WSGIGateway

from schevoflex.service import DEBUG_SERVICES, SERVICES


def app_factory(global_config, **local_config):
    services = SERVICES.copy()
    if local_config['debug'] == 'true':
        services.update(DEBUG_SERVICES)
    app = WSGIGateway(services)
    return app
