#--
# Ruby Whois
#
# An intelligent pure Ruby WHOIS client and parser.
#
# Copyright (c) 2009-2014 Simone Carletti <weppos@weppos.net>
#++


require 'whois/record/parser/base'
require 'whois/record/parser/whois.centralnic.com.rb'


module Whois
  class Record
    class Parser

      # Parser for the whois.nic.la server.
      #
      # It aliases the whois.centralnic.com parser because
      # the .LA TLD is powered by Centralnic.
      class WhoisNicLa < WhoisCentralnicCom
      end

    end
  end
end
