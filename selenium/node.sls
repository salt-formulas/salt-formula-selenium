{%- from "selenium/map.jinja" import node with context %}
{%- if node.enabled %}

include:
- java

selenium_node_dir:
  file.directory:
  - name: {{ node.dir.base }}
  - mode: 755
  - makedirs: true

selenium_node_download:
  cmd.run:
  - name: wget 
  - unless: "[ -f /root/selenium-server-standalone-{{ selenium_version }}.jar ]"
  - require:
    - file: selenium_node_dir

selenium_node_deploy_war:
  cmd.run:
  - name: cp selenium-sever-standalone-{{ selenium_version }}.jar {{ node.dir.base }}/selenium.jar
  - unless: "[ -f {{ node.dir.base }}/selenium.jar ]"
  - require:
    - cmd: selenium_node_download

/etc/init.d/selenium-node:
  file.managed:
  - source: salt://selenium/conf/selenium-node
  - template: jinja
  - mode: 755
  - require:
    - cmd: selenium_node_deploy_war

selenium_node_service:
  service.running:
  - enable: true
  - name: selenium-node
  - require:
    - file: /etc/init.d/selenium-node

{%- for driver in node.drivers %}

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

{%- endif %}
