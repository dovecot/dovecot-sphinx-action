FROM sphinxdoc/sphinx:4.2.0

LABEL "maintainer"="Dovecot <dovecot@dovecot.org>"

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

VOLUME ["/build"]
ENTRYPOINT ["/entrypoint.py"]
