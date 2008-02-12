import os
from os.path import abspath, dirname, join
import sys


BASE_DIR = abspath(dirname(__file__))

FLEXCLIENT_DIR = join(BASE_DIR, 'flexclient')

FLEX3_SDK = join(BASE_DIR, '../flex3sdk_b3_121207')


if os.name == 'nt':
    MXMLC_EXE = join(FLEX3_SDK, 'bin', 'mxmlc.exe')
else:
    MXMLC_EXE = join(FLEX3_SDK, 'bin', 'mxmlc')


FLEXUNIT = join(BASE_DIR, '../flexunit')


_PLAYER_BASE = join(FLEX3_SDK, 'runtimes', 'player')
if os.name == 'nt':
    FLASH_PLAYER_EXE = join(_PLAYER_BASE, 'win', 'FlashPlayer.exe')
elif sys.platform == 'darwin':
    FLASH_PLAYER_EXE = join(_PLAYER_BASE, 'mac', 'Flash Player.app',
                            'Contents', 'MacOS', 'Flash Player')
else:
    FLASH_PLAYER_EXE = join(_PLAYER_BASE, 'lnx', 'flashplayer')
