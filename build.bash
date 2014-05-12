pushd ./src
gem build ./carnelian.gemspec
gem install --user-install --local ./carnelian-0.0.1.gem
popd

pushd ./tests
ruby ./test.rb
popd
