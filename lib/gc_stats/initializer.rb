require 'gc_stats/gc_logger'
require 'gc_stats/middleware'

module GCStats

  class Initializer < Rails::Railtie

    config.before_initialize do
      # enable the GC Profiler
      GC::Profiler.enable

      # Add the GCStats::Middlware to the application's middleware
      config.app_middleware.insert_before ::Rack::Runtime, GCStats::Middleware

      # Include the GCStats::GCLogger mixin to base controller
      ActiveSupport.on_load(:action_controller) do
        include GCStats::GCLogger
      end
    end

  end

end
