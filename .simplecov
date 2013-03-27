require 'simplecov-vim/formatter'

SimpleCov.configure do
  minimum_coverage 90
  maximum_coverage_drop 10

  start('rails') do
    formatter SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::VimFormatter
    ]

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Presenters', 'app/presenters'
    add_group 'Mailers', 'app/mailers'
    add_group 'Libraries', 'lib'
    add_group "Long files" do |src_file|
      src_file.lines.count > 100
    end
  end
end
