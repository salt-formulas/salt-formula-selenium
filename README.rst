
================
Selenium Formula
================

Selenium automates browsers. That's it! What you do with that power is
entirely up to you. Primarily, it is for automating web applications for
testing purposes, but is certainly not limited to just that. Boring web-based
administration tasks can (and should!) also be automated as well.


Sample Metadata
===============

Selenium server grid hub

.. code-block::

    selenium:
      hub:
        enabled: true

Selenium server grid node with firefox and chrome

.. code-block::

    selenium:
      node:
        enabled: true
        hub:
          host: hub01.domain.com
        video:
          host: 127.0.0.1
          display: 99
        drivers:
        - firefox
        - chrome


More Information
================

* http://alex.nederlof.com/blog/2012/11/19/installing-selenium-with-jenkins-on-ubuntu/
* http://www.seleniumhq.org/download/
* https://sites.google.com/a/chromium.org/chromedriver/


Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-selenium/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-selenium

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
