require 'rails_helper'

class TestParent
  def log_process_action(payload)
    ['test message']
  end
end

class TestController < TestParent
  include GCStats::GCLogger::ClassMethods
end

describe TestController do

  it 'Execute controller action that succeeds' do
    GC.start
    message = subject.log_process_action(@payload)
    expect(message[0]).to include("test message")
    expect(message[1]).to match(/PID: \d*/)
    expect(message[2]).to match(/GC: \[total_gc_time: \d*.\d* ms \| num_events: \d* \| major\/minor\/count: \d*\/\d*\/\d*\]/)
  end

end
