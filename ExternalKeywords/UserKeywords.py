import selenium.webdriver
from selenium.webdriver import Chrome


def DDortext():
    try:
        path = "./Driver/chromedriver.exe"
        driver1 = Chrome(executable_path=path)

        if driver1.find_element_by_xpath('//select[@name="billing_address_id"]').is_displayed():

            result = 'noDD'
            return result
        else:
            result = 'yesDD'
            return result
    finally:
        print("always")