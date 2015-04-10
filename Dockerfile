FROM binaryphile/ruby:2.0.0-p247
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN bundle install
ADD . /myapp
RUN bundle install
RUN bundle exec rake db:create db:migrate db:seed

