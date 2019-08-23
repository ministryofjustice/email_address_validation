lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'email_address_validation/version'

Gem::Specification.new do |spec|
  spec.name          = 'email_address_validation'
  spec.version       = EmailAddressValidation::VERSION
  spec.authors       = ['Kath Pobee-Norris']
  spec.email         = ['kath.Pobee-Norris@digital.justice.gov.uk']

  spec.summary       = 'Email address validator'
  spec.description   = "Gem to validate various aspects of user's email address.
  It will enable checks to take place prior to submission to ensure the user has
  entered a valid email address"
  spec.homepage      = "https://github.com/ministryofjustice/email_address_validation"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing
  # to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-rcov'
  spec.add_runtime_dependency 'activesupport', '~> 5.X'
  spec.add_runtime_dependency 'mail', '>= 2.6.6', '< 2.8.0'
end
