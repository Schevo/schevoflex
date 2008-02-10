from os.path import abspath, dirname, join


BASE_DIR = abspath(dirname(__file__))

FLEX3_SDK = join(BASE_DIR, '../flex3sdk_b3_121207')


if os.name == 'nt':
    FCSH_EXE = join(FLEX3_SDK, 'fcsh.exe')
else:
    FCSH_EXE = join(FLEX3_SDK, 'fcsh')


FLEXUNIT = join(BASE_DIR, '../flexunit-trunk')

