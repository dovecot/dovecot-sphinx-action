FROM sphinxdoc/sphinx:5.3.0

LABEL "maintainer"="Dovecot <dovecot@dovecot.org>"

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action
RUN pip install -r requirements.txt

RUN useradd -u 1001 -s /bin/sh -m -d /home/runner runner
USER runner

ENTRYPOINT ["python3"]
CMD ["/entrypoint.py"]
