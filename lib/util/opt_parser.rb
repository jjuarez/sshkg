require 'choice'

Choice.options do
  header ''
  header '  Specific options:'

  option :config do
    short '-c'
    long '--config=DOMAIN'
    desc 'The yaml config file'
  end 
  
  option :user do
    short '-u'
    long '--user=USER_ID'
    desc 'The user identificator'
  end

  separator ''
  separator '  Common options:'

  option :help do
    short '-h'
    long '--help'
    desc "Show this screen"
  end 
  
  separator ''
end
