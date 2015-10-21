import time
from selenium import webdriver
from selenium.webdriver.common.by import By

from selenium.webdriver.common.keys import Keys

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


browser = webdriver.Firefox()

print 'Loaded Browser, Launching google.com'

browser.get('https://google.com')

print 'Loaded google.com, going to search Docker in 10 minutes'

#elems = browser.find_elements_by_tag_name('input');
elem = browser.find_element_by_id('lst-ib');

elem.send_keys("Docker");
elem.submit();

if EC.title_contains('Docker in 10 minutes') :
        print 'Successful validation of Google Search using Selenium in Firefox'

time.sleep(5) # Wait for 5 Seconds and then Quit Browser
browser.quit()


