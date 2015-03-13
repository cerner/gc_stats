module GCStats
  class Initializer < Rails::Railtie

    config.before_initialize do
      GC::Profiler.enable
      config.app_middleware.insert_before ::Rack::Runtime, GCStats::Middleware

      ActiveSupport.on_load(:action_controller) do
        include GCStats::GCLogger
      end
    end

  end
end