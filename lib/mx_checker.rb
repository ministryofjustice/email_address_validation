# frozen_string_literal: true

require 'resolv'
require_relative 'email_address_validation/dummy_mx_checker'

class MxChecker # :nodoc:
  include Dummy
  def initialize(resolver = ::Resolv::DNS.new)
    @resolver = resolver
  end

  def records?(domain)
    @resolver.getresource(domain, ::Resolv::DNS::Resource::IN::MX)
  rescue ::Resolv::ResolvError
    false
  rescue ::Resolv::ResolvTimeout
    true
  end
end
