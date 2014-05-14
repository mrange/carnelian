Gem::Specification.new do |s|
  s.name              = "carnelian"
  s.version           = "0.0.1"
  s.date              = %q{2014-05-09}
  s.authors           = ["Mårten Rånge"]
  s.summary           = %q{Carnelian is code generation tool}
  s.description       = %q{Carnelian is code generation tool written in ruby. It's inspired by T4, a product shipped with Microsoft VisualStudio}
  s.email             = %q{marten_range@hotmail.com}
  s.homepage          = %q{https://github.com/mrange/carnelian}
  s.license           = "MS-PL"
  s.files =
    [
      "lib/carnelian_executor.rb" ,
      "lib/carnelian_runtime.rb" ,
    ]
#  s.test_files = ["test/test_carnelian_executor.rb"]
end
