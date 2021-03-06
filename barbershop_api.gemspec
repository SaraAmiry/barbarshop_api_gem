lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/barbershop_api/version'

Gem::Specification.new do |spec|
  spec.name          = "barbershop_api"
  spec.version       = BarbershopApi::VERSION
  spec.authors       = ["saraamiry"]
  spec.email         = ["saraamiry24@gmail.com"]

  spec.summary       = %q{barbershop CLI gem}
  spec.description   = %q{Provides a CLI you can run to see info about the list of barbershop in your area from Barbershop API.}
  spec.homepage      = "https://github.com/SaraAmiry/barbarshop_api"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #spec.bindir        = "exe"
  spec.executables   = ["barbershop_cli"]
  spec.require_paths = ["lib"]

  #sepc.add_dependency "httparty"
  spec.add_dependency "http"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "pry"
end
