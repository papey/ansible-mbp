Pry.config.color = true
Pry.config.prompt_name = "pry: / #{Pry::Helpers::Text.green(File.basename(Dir.pwd))}"

Pry.commands.alias_command 'w', 'whereami'

if defined?(Rails)
  def rails_formatted_env
    case Rails.env
    when 'production'
      bold_upcased_env = Pry::Helpers::Text.red(Rails.env.upcase)
      Pry::Helpers::Text.red(bold_upcased_env)
    when 'development', 'test', 'staging'
      Pry::Helpers::Text.yellow(Rails.env)
    else
      Rails.env
    end
  end

  def rails_app_name
    Rails.application.class.module_parent.name.underscore
  end

  Pry::Prompt.add(:custom_rails, 'A prompt that displays Rails app name and env', %w[> *]) do
    |_context, _nesting, pry_instance, sep|
    format(
      '%<in_count>s: %<app_name>s(%<env>s) %<separator>s ',
      in_count: pry_instance.input_ring.count,
      app_name: rails_app_name,
      env: rails_formatted_env,
      separator: sep
    )
  end

  Pry.config.prompt = Pry::Prompt[:custom_rails]
end

Pry.config.commands.command 'pbcopy', 'Copy input to clipboard' do |input|
  input = input ? target.eval(input) : pry_instance.last_result
  IO.popen('pbcopy', 'w') { |io| io << input }
end
