module GCStats

  # ActionController hook to inject runtime info into the request notification
  # event
  module GCLogger
    extend ActiveSupport::Concern

    module ClassMethods

      # ActionController hook to add the process ID and GC info on to the info
      # message to be logged as part of the request event.
      # @param [Hash] payload hash containing additional info to be logged
      def log_process_action(payload)
        messages = super
        messages << "PID: #{Process.pid}"

        gc_time = GC::Profiler.total_time
        if gc_time > 0
          messages << "GC: [total_gc_time: #{gc_time*1000} ms |" \
            " num_events: #{GC::Profiler.raw_data.count} | major/minor/count:" \
            " #{GC.stat[:major_gc_count]}/#{GC.stat[:minor_gc_count]}/#{GC.count}]"
        end

        messages
      end

    end
  end
end
