module RegexpM17N
  def self.non_empty?(str)
    unless @is_string_monkey_patched
      String.class_eval do
        alias_method :old_encode, :encode
        def encode(enc)
          old_encode
        rescue Encoding::UndefinedConversionError
          self
        end
      end
      @is_string_monkey_patched = true
    end
    
    str =~ /^.+$/
  end
end
