# coding: utf-8
require 'action_view/helpers'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/enumerable'
require 'active_support/core_ext/object/blank'

module ActionView
  module Helpers
    module ErrorMessageForMobile
      def error_message_for_mobile(object, method, *args)
        options = args.extract_options!
        unless args.empty?
          ActiveSupport::Deprecation.warn('error_message_for_mobile takes an option hash instead of separate ' +
                                          'prepend_text, append_text, and color arguments', caller)

          options[:prepend_text] = args[0] || ''
          options[:append_text] = args[1] || ''
          options[:color] = args[2] || '#ff0000'
        end
        options.reverse_merge!(:prepend_text => '', :append_text => '', :color => '#ff0000')

        object = convert_to_model(object)

        if (obj = (object.respond_to?(:errors) ? object : instance_variable_get("@#{object}"))) &&
          (errors = obj.errors[method]).presence
          html = content_tag("span",
                   (options[:prepend_text].html_safe << errors.first).safe_concat(options[:append_text]),
                   :style => "color:#{options[:color]};"
                 )
          html << '<br />'
        else
          ''
        end
      end

      module FormBuilderMethods
        def error_message_for_mobile(method, *args)
          @template.error_message_for_mobile(@object || @object_name, method, *args)
        end
      end
    end

    class FormBuilder
      include ErrorMessageForMobile::FormBuilderMethods
    end
  end
end
