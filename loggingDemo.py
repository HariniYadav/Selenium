import logging
#DEBUG INFO WARNING ERROR CRITICAL
#statement will be logged into the file not to display in console
#order need to be printed
logging.basicConfig(filename="C:/Users/Narayana/Desktop/Harini/selelniumLogs/test.log",
                    format="%(asctime)s: %(levelname)s: %(message)s",
                    datefmt="%m/%d/%Y %I:%M:%S %p",
                    level=logging.DEBUG)
logging.debug("This is debug messaging")
logging.info("This is debug message")
logging.warning("This is debug message")
logging.error("This is debug message")
logging.critical("This is debug message")

