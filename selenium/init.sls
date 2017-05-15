
{%- if pillar.selenium is defined %}
include:
{%- if pillar.selenium.hub is defined %}
- selenium.hub
{%- endif %}
{%- if pillar.selenium.node is defined %}
- selenium.node
{%- endif %}
{%- endif %}
