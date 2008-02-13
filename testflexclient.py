#!/usr/bin/env python2.5

from os.path import join
from subprocess import call
from sys import exit

import setup_config as cfg

TEST_RUNNER_SWF = join(cfg.BASE_DIR, 'SchevoTestRunner.swf')


if __name__ == '__main__':
    result = call([
        cfg.MXMLC_EXE,
        '-library-path+=%s' % join(cfg.FLEXUNIT, 'bin'),
        '-source-path+=%s,%s' % (join(cfg.FLEXCLIENT_DIR, 'src'),
                                 join(cfg.FLEXCLIENT_DIR, 'tests')),
        '-output=%s' % TEST_RUNNER_SWF,
        '--',
        join(cfg.FLEXCLIENT_DIR, 'tests', 'SchevoTestRunner.mxml'),
        ])

    if result != 0:
        exit(result)

    call([
        cfg.FLASH_PLAYER_EXE,
        TEST_RUNNER_SWF,
        ])
