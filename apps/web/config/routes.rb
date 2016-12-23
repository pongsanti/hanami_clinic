# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/clients', to: 'clients#create'
get '/clients/new', to: 'clients#new'
get '/clients', to: 'clients#index'
root to: 'home#index'
