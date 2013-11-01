
# Selenium testing suite

## Sample pillar

### Selenium standalone server with chrome

    selenium:
      server:
        enabled: true
        xvfb:
          host: localhost
          display: 99
        drivers:
        - chrome

### Selenium server grid hub

    selenium:
      hub:
        enabled: true

### Selenium server grid node with firefox and chrome

    selenium:
      node:
        hub:
        - host: hub1.selenium.domain.com
        enabled: true
        xvfb:
          host: localhost
          display: 99
        drivers:
        - firefox
        - chrome

## Read more

* http://alex.nederlof.com/blog/2012/11/19/installing-selenium-with-jenkins-on-ubuntu/
* http://www.seleniumhq.org/download/
* https://sites.google.com/a/chromium.org/chromedriver/
