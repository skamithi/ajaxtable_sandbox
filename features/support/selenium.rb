Webrat.configure do |config|
  config.mode = :selenium
  config.application_environment = :test
  config.selenium_browser_key = '*firefox /usr/lib/firefox-3.0.7/firefox'
end

def empty_database
  connection = ActiveRecord::Base.connection
  connection.tables.each do |table|
    connection.execute "DELETE FROM #{table}"
  end
end
