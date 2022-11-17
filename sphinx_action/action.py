import collections
import subprocess
import tempfile
import os
import shlex
from glob import glob
from sphinx.cmd import build

def prepare_manpages():
    for path in glob('source/man') + glob('source/*-man'):
        subprocess.check_call(['make', '-C', path])

def build_docs():
    try:
        os.mkdir('build')
        os.chmod('build', 0o7777)
    except FileExistsError:
        pass
    except PermissionError:
        pass

    print("::notice:: Building html documentation - please wait long while")
    build.main(['-M', 'dirhtml', 'source/', 'build', '-W', '-q'])
    os.mkdir('build/mans')
    for path in glob('source/man') + glob('source/*-man'):
        tag = os.path.basename(path)
        print("::notice:: Building man pages to build/mans/" + tag)
        build.main(['-M', 'man', 'source/', 'build', '-t', tag, '-q'])
        subprocess.check_call(['mv', 'build/man', 'build/mans/' + tag])
