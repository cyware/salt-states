# Source: https://github.com/cowboyd/therubyracer
# Author: Charles Lowell

include:
  - cyware.packages.ruby
  - cyware.packages.ruby-dev
  - cyware.packages.build-essential

therubyracer:
  gem.installed:
    - require:
      - pkg: ruby
      - pkg: ruby-dev
      - pkg: build-essential
