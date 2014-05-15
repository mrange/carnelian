Gem::Specification.new do |s|
  s.name                  = "carnelian"
  s.version               = "1.0.0"
  s.date                  = %q{2014-05-09}
  s.authors               = ["Mårten Rånge"]
  s.summary               = %q{Carnelian is code generation tool}
  s.description           = %q{Carnelian is code generation tool written in ruby. It's inspired by T4, a product shipped with Microsoft VisualStudio}
  s.email                 = %q{marten_range@hotmail.com}
  s.homepage              = %q{https://github.com/mrange/carnelian}
  s.license               = "MS-PL"
#  s.required_ruby_version = "1.9.3"
  s.files =
    [
      "lib/carnelian/executor.rb" ,
      "lib/carnelian/runtime.rb" ,
    ]
#  s.test_files = ["test/test_carnelian_executor.rb"]
end
