# -*- encoding: utf-8 -*-
module Bluepill
  module ProcessConditions
    class Heartbeat < ProcessCondition
      # Usage: process.checks :heartbeat, :every => 10.seconds, :below => 1.minute, :file => 'lefichierdeheartbeat'

      def initialize(options = {})
        @below = options[:below]
        @file  = options[:file]
      end

      def run(pid)
        File.open(@file).gets
      end

      def check(value)
        Time.now.to_i - value.to_i <= @below.to_i
      end
    end
  end
end
