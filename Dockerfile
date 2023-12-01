FROM ruby:3.0

ENV LANG C.UTF-8
ENV APP_DIR /usr/src/app

RUN apt-get update
RUN apt install -y nodejs
RUN apt install -y postgresql-client

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR ${APP_DIR}

# COPY Gemfile* .
# RUN bundle install

# Add a script to be executed every time the container starts. 
# Fixes a glitch with the pids directory by removing the server.pid file on execute.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

COPY . .

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Runs a rails server command to start the rails server, pointing it to local host.
# CMD ["rails", "server", "-b", "0.0.0.0"]
