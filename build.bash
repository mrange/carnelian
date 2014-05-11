pushd ./src
gem build ./carnelian.gemspec
sudo gem install ./carnelian-0.0.1.gem
popd

pushd ./tests
ruby ./test.rb
popd
