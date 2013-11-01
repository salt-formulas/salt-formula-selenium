
include:
{% if pillar.selenium.server is defined %}
- selenium.server
{% endif %}
{% if pillar.selenium.hub is defined %}
- selenium.hub
{% endif %}
{% if pillar.selenium.node is defined %}
- selenium.node
{% endif %}
