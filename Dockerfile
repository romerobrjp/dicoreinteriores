FROM ruby:2.2.3

RUN apt-get update && apt-get install -y \
  build-essential \
  imagemagick libmagickwand-dev \
  libreadline6 libreadline6-dev \
  graphviz \
  less \
  libpq-dev postgresql-client-9.4

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs

RUN gem install bundler

RUN npm install gulp bower -g

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ADD Gemfile $INSTALL_PATH
ADD Gemfile.lock $INSTALL_PATH

RUN bundle install

ADD . $INSTALL_PATH

RUN bower install --allow-root

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]

CMD ["rails", "server", "-b", "0.0.0.0"]
