require 'toml'
module Puppet::Parser::Functions
  newfunction(:orcus_config, type: :rvalue, doc: <<-EOS
    @summary
      Convert hash to Orcus TOML config.
    @param [Hash] Settings for Orcus.
    @return [Toml] Orcus configuration content.
    EOS
             ) do |args|

    if args.size != 1
      raise Puppet::ParseError, _('orcus_config(): Wrong number of arguments given (%{args_length} for 1)') % { args_length: args.length }
    end

    args.each do |arg|
      if arg.class != Hash
        raise Puppet::ParseError, _('orcus_config(): Wrong type of arguments given (%{args_class} for Hash)') % { args_class: args.class }
      end
    end

    TOML::Generator.new(args[0]).body
  end
end
