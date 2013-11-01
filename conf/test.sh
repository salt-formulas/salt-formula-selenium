#!/bin/bash

# Set the DISPLAY env variable to Firefox and Chrome know where to open the browser.

export DISPLAY=:{{ pillar.selenium.xvfb.display }}

{%- for test in pillar.selenium.tests %}
{%- if test.suite == test_suite and test.browser == test_browser and test.address == test_address %}

{%- if test.browser == 'firefox' %}
java -jar /srv/selenium/selenium.jar -htmlSuite *firefox http://{{ test.address }} "/srv/selenium/suites/{{ test.suite }}Suite.html" "/srv/selenium/results/{{ test.suite }}_firefox_{{ test.address }}.html"
{%- endif %}

{%- if test.browser == 'chrome' %}
java -jar -Dwebdriver.chrome.driver=/srv/selenium/chrome-driver/chromedriver /srv/selenium/selenium.jar -htmlSuite *googlechrome http://{{ test.address }} "/srv/selenium/suites/{{ test.suite }}Suite.html" "/srv/selenium/results/{{ test.suite }}_chrome_{{ test.address }}.html"
{%- endif %}

{%- endif %}
{%- endfor %}
