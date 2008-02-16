from schevoflex.service import debug as debug_mod
from schevoflex.service import service


class Configuration(object):
    
    def __init__(self, dbs, debug):
        self.dbs = dbs
        self.debug = debug


def _wrapped_service(config, service):
    def _wrapped(*args, **kw):
        return service(config, *args, **kw)
    _wrapped.__name__ = service.__name__
    return _wrapped


def services_factory(dbs, debug):
    config = Configuration(dbs, debug)
    def w(service):
        return _wrapped_service(config, service)
    services = {
        'service.getDatabaseNames': w(service.getDatabaseNames),
        'service.getVersion': w(service.getVersion),
        }
    if debug:
        debug_services = {
            'debug.cleanSlate': w(debug_mod.cleanSlate),
            }
        services.update(debug_services)
    return services
