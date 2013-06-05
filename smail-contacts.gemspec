$:.push File.expand_path('../lib', __FILE__)
require 'contacts/version'

Gem::Specification.new do |s|
  s.name = "smail-contacts"
  s.version = Contacts::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Lucas Carlson","Brad Imbierowicz", "Wong Liang Zan", "Mateusz Konikowski", "Laurynas Butkus", "Xiaolin Zhu"]
  s.email = "zan@liangzan.net"
  s.homepage = "https://github.com/5523183/contacts"
  s.summary = "grab contacts from Yahoo, AOL, Gmail, Hotmail, Plaxo, GMX.net, Web.de, inbox.lt, seznam.cz, t-online.de"
  s.description = "A universal interface to grab contact list information from Yahoo, AOL, Gmail, Hotmail, Plaxo, GMX.net, Web.de, inbox.lt, seznam.cz, t-online.de. Now supporting Ruby 1.9."

  s.add_dependency "json", "~> 1.7.3"
  s.add_dependency 'oauth2'
  s.add_dependency 'nokogiri', '~> 1.5.0'

  s.files = Dir.glob("lib/**/*") + Dir.glob("examples/**/*") + %w(LICENSE README.rdoc Rakefile)
  s.require_path = "lib"
end
