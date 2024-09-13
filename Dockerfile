FROM bitnami/ruby:2.7.4

WORKDIR /app

COPY *.rb ./
COPY Gemfile Gemfile
COPY modules modules

ENV LANG=en_us.UTF-8
ENV LC_ALL=C.UTF-8
ENV RACK_ENV=custom

RUN gem install sinatra --no-document
RUN gem install redis --no-document

### hack to allow the setup of the pg gem (which would fail otherwise)
RUN apt-get update
RUN apt-get install libpq-dev -y
### end of hack (this would require additional research and optimization)
RUN gem install pg --no-document

WORKDIR /
ADD startup.sh startup.sh

CMD ["./startup.sh"]


