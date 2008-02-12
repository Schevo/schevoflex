from distutils.cmd import Command
from distutils.command.build import build as _build
import os
import sys
from textwrap import dedent

from setuptools import setup, find_packages


version = '1.0a1'


class build(_build):
    
    def has_swf_apps(self):
        return True

    sub_commands = _build.sub_commands + [
        ('build_swf', has_swf_apps),
        ]


class build_swf(Command):
    pass


setup(
    # Informational.
    name = 'SchevoFlex',
    version = version,
    description = "Flex/Flash UI for creating and using Schevo databases",
    long_description = dedent("""
        """),
    classifiers = [
        ],
    keywords = '',
    author = 'Orbtech, L.L.C. and contributors',
    author_email = 'schevo@googlegroups.com',
    url = 'http://getschevo.org/schevoflex/',
    license = 'LGPL',

    # Basic structure, requirements, entry points.
    packages = find_packages(exclude=['ez_setup', 'examples', 'tests']),
    include_package_data = True,
    zip_safe = False,
    install_requires = [
        'Schevo >= 3.1a1',
        ],
    entry_points = """
        """,

    # Distutils customization.
    cmdclass = dict(
        build = build,
        build_swf = build_swf,
        ),
    )
