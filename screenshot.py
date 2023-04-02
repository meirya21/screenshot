from selenium import webdriver
from selenium.webdriver.firefox.service import Service as FirefoxService
from webdriver_manager.firefox import GeckoDriverManager
from pyvirtualdisplay import Display
import os

display = Display(visible=0, size=(1024, 768))
display.start()

options = webdriver.FirefoxOptions()
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')

driver = webdriver.Firefox(service=FirefoxService(GeckoDriverManager().install()))
driver.get(os.getenv('url'))
driver.save_screenshot('/screen/screen.png')
driver.quit()
