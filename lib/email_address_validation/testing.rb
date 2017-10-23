# frozen_string_literal: true

require_relative 'dummy_mx_checker'

if defined?(Rails) && Rails.env.test?
  EmailAddressValidation.configure do |config|
    config.mx_checker = Dummy.new
  end
end
