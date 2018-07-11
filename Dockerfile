FROM ruby

RUN apt update
RUN apt install -y sudo
RUN gem install bundler --no-doc
RUN mkdir -p /usr/app
RUN useradd -m -s /bin/bash itamae -b/home
RUN mkdir -p /home/itamae
ADD . /usr/app
WORKDIR /usr/app
RUN bundle install
RUN bundle exec itamae local examples/cookbook/pyenv/recipe.rb -y examples/role/pyenv_system.yml
RUN bundle exec itamae local examples/cookbook/pyenv/recipe.rb -y examples/role/pyenv_user.yml
