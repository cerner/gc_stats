module GCStats

  # Rack middleware that clears out GC::Profiler's data on each request.
  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      # clear out the profiler's data
      GC::Profiler.clear

      # pass the call onto the next link in the chain
      @status, @headers, @response = @app.call(env)

      # pass the results back
      [@status, @headers, @response]
    end

  end

end
