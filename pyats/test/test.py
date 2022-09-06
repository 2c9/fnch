'''
test.py
'''

__author__ = 'Cisco Systems Inc.'
__copyright__ = 'Copyright (c) 2019, Cisco Systems Inc.'
__contact__ = ['pyats-support-ext@cisco.com']
__credits__ = ['list', 'of', 'credit']
__version__ = 1.0

import logging
from pyats import aetest

logger = logging.getLogger(__name__)

class CommonSetup(aetest.CommonSetup):
    @aetest.subsection
    def connect(self, testbed):
        assert testbed, 'Testbed is not provided!'
        testbed.connect()

class basic(aetest.Testcase):
    @aetest.test
    def connectivity(self, testbed, steps):
        for device_name, device in testbed.devices.items():
            with steps.start( f"Test Connection Status of {device_name}", continue_=True ) as step:
                if device.connected:
                    logger.info(f"{device_name} connected status: {device.connected}")
                else:
                    logger.error(f"{device_name} connected status: {device.connected}")
                    step.failed()
    
    @aetest.test
    def internet(self, testbed, steps):
        check_devs = [ ( device_name, device ) for device_name, device in testbed.devices.items() if device_name.startswith("ios") ]
        for device_name, device in check_devs:
            with steps.start( f"Test Internet Connection Status of {device_name}", continue_=True ) as step:
                try:
                    device.ping("8.8.8.8")
                except Exception as e:
                    logger.error(f'{device_name} failed to reach the internet')
                    step.failed()
                else:
                    logger.info(f"{device_name} has the internet connectivity")

if __name__ == '__main__':
    import argparse
    from pyats import topology

    parser = argparse.ArgumentParser(description = "standalone parser")
    parser.add_argument('--testbed', dest = 'testbed',
                        help = 'testbed YAML file',
                        type = topology.loader.load,
                        default = None)

    args = parser.parse_known_args()[0]
    aetest.main(testbed = args.testbed)