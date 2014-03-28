module Rack
  class Offline
    class Config
      def initialize(root, &block)
        @cache = []
        @dynamic = []
        @network = []
        @fallback = {}
        @version_tag = nil
        @root = root
        instance_eval(&block) if block_given?
      end

      def cache(*names)
        @cache.concat(names)
      end

      def dynamic(*names)
        @dynamic.concat(names)
      end

      def version_tag(version = nil)
        @version_tag = version if version
        @version_tag
      end

      def network(*names)
        @network.concat(names)
      end

      def fallback(hash = {})
        @fallback.merge!(hash)
      end

      def root
        @root
      end
    end
  end
end
