FROM ruby:2.5-alpine
MAINTAINER Alexander Kadyrov <gruz0.mail@gmail.com>

RUN apk add --no-cache make gcc libc-dev postgresql-client postgresql-dev libpq

# To avoid installing documentation for gems
# https://coderwall.com/p/u1xpag/a-faster-bundle-install
COPY .gemrc $HOME/.gemrc

WORKDIR /app
COPY . /app
RUN bundle install -j $(nproc) --quiet

EXPOSE 2300
ENTRYPOINT ["bundle", "exec"]
