require 'resolv'

class MxChecker # :nodoc:
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

  class Dummy # :nodoc:
    def records?(_)
      true
    end
  end
end
