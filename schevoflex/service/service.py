import pkg_resources


def getVersion():
    """Return the string version number of installed SchevoFlex."""
    print 'getVersion() called'
    return pkg_resources.require('SchevoFlex')[0].version
