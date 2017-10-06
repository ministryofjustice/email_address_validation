require_relative 'mx_checker'
require 'mail'

module EmailAddressValidation
  class Checker
    def initialize(original_address)
      @original_address = original_address
      @parsed = parse_address(original_address)
    end

    def error
      @error ||= compute_error.to_s.inquiry
    end

    def message
      I18n.t(error, scope: 'email_checker.errors')
    end

    def valid?
      error.valid?
    end

    private

    attr_reader :original_address, :parsed

    def compute_error
      format_error || mx_records_error || :valid
    end

    def format_error
      return :unparseable unless parsed
      return :malformed unless well_formed_address?
      return :domain_dot if domain_dot_error?
    end

    def mx_records_error
      return :no_mx_record unless mx_records?
    end

    def domain
      parsed.domain
    end

    def parse_address(addr)
      Mail::Address.new(addr)
    rescue Mail::Field::ParseError
      nil
    end

    def domain_dot_error?
      domain.start_with?('.') || domain.match(/\.{2,}/)
    end

    def well_formed_address?
      parsed.local && parsed.domain &&
        parsed.address == original_address && parsed.local != original_address
    end

    def mx_records?
      ActiveSupport::Notifications.instrument(:mx, category: :mx) do
        MxChecker.new.records?(domain)
      end
    end
  end
end
