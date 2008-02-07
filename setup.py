from setuptools import setup, find_packages
import sys, os

version = '1.0a1'

setup(name='SchevoFlex',
      version=version,
      description="Flex/Flash UI for creating and using Schevo databases",
      long_description="""\
""",
      classifiers=[], # Get strings from http://pypi.python.org/pypi?%3Aaction=list_classifiers
      keywords='',
      author='Orbtech, L.L.C. and contributors',
      author_email='schevo@googlegroups.com',
      url='http://getschevo.org/schevoflex/',
      license='LGPL',
      packages=find_packages(exclude=['ez_setup', 'examples', 'tests']),
      include_package_data=True,
      zip_safe=False,
      install_requires=[
          # -*- Extra requirements: -*-
      ],
      entry_points="""
      # -*- Entry points: -*-
      """,
      )
