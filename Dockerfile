FROM sphinxdoc/sphinx:4.2.0

LABEL "maintainer"="Dovecot <dovecot@dovecot.org>"

RUN pip install -U \
	pip \
	wheel
RUN pip install \
	sphinx-copybutton==0.4.0 \
	sphinx-removed-in==0.2.1 \
	pygments>=2.7.4

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

USER runner
ENTRYPOINT ["/entrypoint.py"]
