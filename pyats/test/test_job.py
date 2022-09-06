'''
test_job.py
'''
__author__ = 'Cisco Systems Inc.'
__copyright__ = 'Copyright (c) 2019, Cisco Systems Inc.'
__contact__ = ['pyats-support-ext@cisco.com']
__credits__ = ['list', 'of', 'credit']
__version__ = 1.0

import os
from pyats.easypy import run

SCRIPT_PATH = os.path.dirname(__file__)

def main(runtime):
    run(testscript= os.path.join(SCRIPT_PATH, 'test.py'), runtime = runtime)