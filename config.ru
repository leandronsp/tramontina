#!/usr/bin/env ruby

require 'adelnor'
require 'chespirito'

require_relative './app/controllers/home_controller'
require_relative './app/controllers/sessions_controller'
require_relative './app/controllers/not_found_controller'

sample_app =
  Chespirito::App.configure do |app|
    app.register_route('GET', '/',        [HomeController, :index])
    app.register_route('POST', '/login',  [SessionsController, :create])
    app.register_route('POST', '/logout', [SessionsController, :destroy])

    app.register_system_route(:not_found, [NotFoundController, :show])
  end

Adelnor::Server.run sample_app, 3000
