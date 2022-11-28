FROM ubuntu:22.04
LABEL org.opencontainers.image.source https://github.com/divvun/taskcluster-decision-task-image

RUN apt-get update -q && apt-get install -qy --no-install-recommends \
        git \
        python3-pip \
        python3-setuptools \
    && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip install \
        # Output of "pip freeze" in a virtualenv after "pip install taskcluster pyyaml"
        aiohttp==3.8.3\
        aiosignal==1.3.1\
        async-timeout==4.0.2\
        attrs==22.1.0\
        certifi==2022.9.24\
        charset-normalizer==2.1.1\
        frozenlist==1.3.3\
        idna==3.4\
        mohawk==1.1.0\
        multidict==6.0.2\
        requests==2.28.1\
        six==1.16.0\
        slugid==2.0.0\
        taskcluster==44.23.4\
        taskcluster-urls==13.0.1\
        urllib3==1.26.13\
        yarl==1.8.1\
        PyYAML==6.0\
    && \
    python3 -c 'import taskcluster'  # check that it was installed correctly
