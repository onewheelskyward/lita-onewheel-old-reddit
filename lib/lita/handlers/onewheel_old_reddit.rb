module Lita
  module Handlers
    class OnewheelOldReddit < Handler
      route(/(https:\/\/.*reddit.com\/[^\s]+)/i, :old_reddit)

      def old_reddit(response)
        reddit_uri = response.matches[0][0]
        Lita.logger.debug "Incoming URI: #{reddit_uri}"
        reddit_uri.sub! /https:\/\/www.reddit.com/, 'https://old.reddit.com'
        reddit_uri.sub! /https:\/\/reddit.com/, 'https://old.reddit.com'
        Lita.logger.debug "Modified URI: #{reddit_uri}"
        response.reply reddit_uri
      end

      Lita.register_handler(self)
    end
  end
end
