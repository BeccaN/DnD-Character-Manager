require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#here is where I will mount other controllers

'use Rack::MethodOverride'

run ApplicationController
use CharactersController
use UsersController