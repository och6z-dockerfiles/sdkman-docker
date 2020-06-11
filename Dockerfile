ARG DEBIAN_VERSION

FROM debian:${DEBIAN_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    zip \
    unzip \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && curl https://get.sdkman.io | bash

ENV PATH "$PATH:$HOME/.sdkman/bin"

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["bash"]
