#
# Brute force...
#
Dir[ 'sshkg/**/*.rb'].sort.each { |lib| require lib }