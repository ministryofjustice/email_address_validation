require_relative 'dummy_mx_checker'

if defined?(Rails) && Rails.env.test?
  EmailAddressValidation.configure do |config|
    config.mx_checker =  MxChecker::Dummy.new
  end
end
