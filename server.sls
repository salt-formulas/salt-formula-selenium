{% from 'params.sls' import selenium_version with context %}

{%- if pillar.selenium.server.enabled %}

include:
  - java

selenium_home_dir:
  file:
  - directory
  - name: /srv/selenium
  - mode: 755
  - makedirs: true

selenium_download:
  cmd.run:
  - name: wget http://selenium.googlecode.com/files/selenium-server-standalone-{{ selenium_version }}.jar
  - unless: "[ -f /root/selenium-server-standalone-{{ selenium_version }}.jar ]"
  - require:
    - file: selenium_home_dir

selenium_copy_war:
  cmd.run:
  - name: cp selenium-server-standalone-{{ selenium_version }}.jar /srv/selenium/selenium.jar
  - unless: "[ -f /srv/selenium/selenium.jar ]"
  - require:
    - cmd: selenium_download

/etc/init.d/selenium-server:
  file.managed:
  - source: salt://selenium/conf/selenium-server
  - template: jinja
  - mode: 755
  - require:
    - cmd: selenium_copy_war

selenium_service:
  service.running:
  - enable: true
  - name: selenium-server
  - require:
    - file: /etc/init.d/selenium-server

{%- for driver in pillar.selenium.drivers %}

{#
{% if driver == 'firefox' %}
selenium_firefox_packages:
  pkg:
  - installed
  - names:
    - firefox 
  - require:
    - cmd: deploy_selenium
{% endif %}

{% if driver == 'chrome' %}
selenium_chrome_packages:
  pkg:
  - installed
  - names:
    - google-chrome-stable
  - require:
    - cmd: deploy_selenium

selenium_chrome_home:
  file:
  - directory
  - name: /var/lib/selenium/chrome-driver/
  - mode: 755
  - makedirs: true
  - require:
    - cmd: deploy_selenium
# http://code.google.com/p/chromedriver/downloads/detail?name=chromedriver_linux64_2.0.zip
{% endif %}
#}

{%- endfor %}

{#
{%- for suite in pillar.selenium.suites %}

selenium_suites_home:
  file:
  - directory
  - name: /srv/selenium/suites
  - makedirs: true
  - require:
    - file: selenium_home

/srv/selenium/suites/{{ suite }}Suite.html:
  file.managed:
  - source: salt://selenium/suites/{{ suite }}.html
  - template: jinja
  - require:
    - file: selenium_suites_home

{%- endfor %}

{%- for test in pillar.selenium.tests %}

selenium_tests_home:
  file:
  - directory
  - name: /srv/selenium/tests
  - makedirs: true
  - require:
    - file: selenium_home

/srv/selenium/tests/{{ test.suite }}_{{ test.browser }}_{{ test.address }}.sh:
  file.managed:
  - source: salt://selenium/conf/test.sh
  - template: jinja
  - mode: 755
  - defaults:
    test_suite: "{{ test.suite }}" 
    test_browser: "{{ test.browser }}" 
    test_address: "{{ test.address }}" 
  - require:
    - file: selenium_tests_home

{%- endfor %}
#}

{%- endif %}
