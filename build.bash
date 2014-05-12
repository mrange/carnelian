pushd ./src
gem build ./carnelian.gemspec
gem install --local --user-install ./carnelian-0.0.1.gem
popd

pushd ./tests
ruby ./test.rb
popd
