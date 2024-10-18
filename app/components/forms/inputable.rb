module Components::Forms::Inputable
  def standard_label_class
    "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
  end

  def standard_input_class
    "
      bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500
      block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white
    "
  end

  def floating_label_input_class
    "block py-2.5 px-0 w-full text-sm bg-transparent border-0 border-b appearance-none focus:border-b-2 focus:outline-none focus:ring-0 peer"
  end

  def floating_label_class
    "
      peer-focus:font-medium text-gray-500 peer-focus:text-primary absolute text-sm duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0]
      peer-focus:start-0 rtl:peer-focus:translate-x-1/4 rtl:peer-focus:left-auto peer-placeholder-shown:scale-100
      peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6
    "
  end

  def floating_label_input(form, attr, field_type = :text_field, options = {})
    base_class = "relative z-0 w-full mb-5 group"
    combined_class = [ base_class, options.delete(:class) ].join(" ")
    label_class = floating_label_class
    input_class = floating_label_input_class

    input_data = build_input_data(options.delete(:data) || {})

    RBUI::FormField(class: combined_class) {
      form.send(field_type, attr, class: input_class, placeholder: " ", data: input_data, **options)
      form.label attr, options[:label], class: label_class
      render RBUI::FormFieldError.new(class: "my-2 text-xs")
      if form_has_errors?(form, attr)
        render RBUI::FormFieldError.new(class: "my-2 text-xs") { form.object.errors[attr].join(", ") }
      end
    }
  end

  def form_has_errors?(form, attr)
    form.object && form.object.errors[attr].any?
  end

  def required_attribute?(form, attr)
    form.object.class.validators_on(attr).any? { |v| v.kind == :presence }
  end

  def build_input_data(data)
    data.symbolize_keys!
    data.merge!(rbui__form_field_target: "input")
    data[:action] = [ data[:action], "input->rbui--form-field#onInput invalid->rbui--form-field#onInvalid" ].compact.join(" ")
    data
  end
end
