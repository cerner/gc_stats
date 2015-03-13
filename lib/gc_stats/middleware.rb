module GCStats
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      GC::Profiler.clear
      @status, @headers, @response = @app.call(env)

      [@status, @headers, @response]
    end

  end
end