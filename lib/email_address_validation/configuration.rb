module EmailAddressValidation # :nodoc:
  class Configuration # :nodoc:
    attr_accessor :mx_checker

    def initialize
      @mx_checker = MxChecker.new
    end
  end
end
