#!/usr/bin/env python2.5

from os.path import join
from subprocess import call
from sys import exit

import setup_config as cfg

TEST_RUNNER_SWF = join(cfg.BASE_DIR, 'SchevoTestRunner.swf')
TESTSERVER_INI = join(cfg.BASE_DIR, 'testserver.ini')
TESTSERVER_PID = join(cfg.BASE_DIR, 'testserver.pid')


SKIP_FLEX_TESTS = True


if __name__ == '__main__':
    if not SKIP_FLEX_TESTS:
        print '[-] Compiling SchevoTestRunner.mxml.'
        result = call([
            cfg.MXMLC_EXE,
            '-library-path+=%s' % join(cfg.FLEXUNIT, 'bin'),
            '-source-path+=%s,%s' % (join(cfg.FLEXCLIENT_DIR, 'src'),
                                     join(cfg.FLEXCLIENT_DIR, 'tests')),
            '-output=%s' % TEST_RUNNER_SWF,
            '-incremental=true',
            '-optimize=true',
            '--',
            join(cfg.FLEXCLIENT_DIR, 'tests', 'SchevoTestRunner.mxml'),
            ])
        if result != 0:
            print '[!] Failed to compile SchevoTestRunner.mxml: %i' % result
            exit(result)
    print '[-] Starting test server.'
    result = call([
        'paster',
        'serve',
        '--daemon',
        '--pid-file=%s' % TESTSERVER_PID,
        TESTSERVER_INI,
        ])
    if result != 0:
        print '[!] Failed to start test server: %i' % result
        exit(result)
    try:
        print '[-] Starting Python tests.'
        result = call(['nosetests'])
        if result != 0:
            print '[!] Python tests failed: %i' % result
            exit(result)
        print '[+] Python tests pass.'
        if not SKIP_FLEX_TESTS:
            print '[-] Starting Flash; quit Flash player to finish suite.'
            call([
                cfg.FLASH_PLAYER_EXE,
                TEST_RUNNER_SWF,
                ])
            print '[!] Warning: no test results recorded; continuing.'
    finally:
        print '[-] Shutting down test server.'
        result = call([
            'paster',
            'serve',
            '--stop-daemon',
            '--pid-file=%s' % TESTSERVER_PID,
            TESTSERVER_INI,
            ])
