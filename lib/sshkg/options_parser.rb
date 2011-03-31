require 'choice'

Choice.options do
  header ''
  header '  Specific options:'

  option :config, :required=>true do
    short '-c'
    long '--config'
    desc 'The yaml config file'
  end 
  
  option :user, :required=>true do
    short '-u'
    long '--user'
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
