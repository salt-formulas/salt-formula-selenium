
{% if pillar.selenium.server.version is defined %}
{% set selenium_version = pillar.selenium.server.version %}
{% elif pillar.selenium.hub.version is defined %}
{% set selenium_version = pillar.selenium.hub.version %}
{% elif pillar.selenium.node.version is defined %}
{% set selenium_version = pillar.selenium.node.version %}
{% else %}
{% set selenium_version = '2.37.0' %}
{% endif %}