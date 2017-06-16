FROM ruby:2.4

RUN apt update
RUN apt install sudo
RUN gem install bundler --no-doc
RUN mkdir -p /usr/app
RUN useradd -m -s /bin/bash itamae -b/home
RUN mkdir -p /home/itamae
WORKDIR /usr/app
COPY Gemfile Gemfile
COPY . /usr/app
RUN bundle install
RUN itamae local examples/cookbook/pyenv/recipe.rb -y examples/role/pyenv_system.yml
RUN itamae local examples/cookbook/pyenv/recipe.rb -y examples/role/pyenv_user.yml
RUN bundle exec rake test
