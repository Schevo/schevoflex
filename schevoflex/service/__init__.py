from schevoflex.service import debug
from schevoflex.service import service


SERVICES = {
    'service.getVersion': service.getVersion,
    }


DEBUG_SERVICES = {
    'debug.cleanSlate': debug.cleanSlate,
    }
