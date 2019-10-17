FROM ruby:2.6.4-slim

RUN apt update && apt upgrade -y && apt install -y curl gnupg && \
    curl -sL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt update  && apt install -y libpq-dev sudo gcc make patch unzip cron cronutils

ARG UID
ARG GID
ARG UNAME

ENV UID ${UID}
ENV GID ${GID}
ENV UNAME ${UNAME}

RUN useradd --uid ${UID} --create-home --shell /bin/bash -G sudo,root ${UNAME}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Add a script to be executed every time the container starts.
COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
