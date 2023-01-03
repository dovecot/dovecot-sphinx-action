FROM sphinxdoc/sphinx:4.2.0

LABEL "maintainer"="Dovecot <dovecot@dovecot.org>"

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action
RUN pip install \
        'sphinx-copybutton==0.4.0' \
        'sphinx-removed-in==0.2.1' \
        'sphinx-design==0.3.0' \
        'pygments>=2.7.4'

RUN useradd -u 1001 -s /bin/sh -m -d /home/runner runner
USER runner

ENTRYPOINT ["python3"]
CMD ["/entrypoint.py"]
