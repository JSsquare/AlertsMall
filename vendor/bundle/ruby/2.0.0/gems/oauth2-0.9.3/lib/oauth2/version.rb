module OAuth2
  class Version
    MAJOR = 0
    MINOR = 9
    PATCH = 3
    PRE = nil

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH, PRE].compact.join('.')
      end
    end
  end
end
