import pkg_resources


def getDatabaseNames(config):
    # XXX: Do something interesting.
    return []


def getVersion(config):
    """Return the string version number of installed SchevoFlex."""
    return pkg_resources.require('SchevoFlex')[0].version
