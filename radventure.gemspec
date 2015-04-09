# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name           = 'radventure'
  spec.version        = '1.0'
  spec.authors        = ['Rick Rezinas']
  spec.email          = ['rrezinas@gmail.com']
  spec.summary        = %q{An interactive fiction interpreter and game}
  spec.description    = %q{An interactive fiction interpreter created as part of my adventures in Learning Ruby the Hard Way.}
  spec.homepage       = 'http://domainforproject.com'
  spec.license        = 'MIT'

  spec.files          = ['lib/radventure.rb', 'lib/radventure/world.rb','lib/radventure/game.rb','lib/radventure/sentence.rb','lib/radventure/activity.rb','lib/radventure/player.rb','lib/radventure/container.rb','lib/radventure/thing.rb','lib/radventure/room.rb', 'lib/radventure/output.rb', 'lib/radventure/serialize.rb' ]
  spec.executables    = ['radventure']
  spec.test_files     = ['tests/test_radventure.rb']
  spec.require_paths  = ['lib']
end
