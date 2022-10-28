module UserFeedRepository
    class UserFeed < Irepository
  
      def self.find(id)
        ::UserFeed.find(id)
      end
  
      def self.create(parameters)
        ::UserFeed.create!(parameters)
      end

      def self.find_by_relation_ids(user_id, feed_id)
        ::UserFeed.where(user_id: user_id, feed_id: feed_id)&.last
      end

      def self.fetch_by_user_id(user_id)
        ::UserFeed.where(user_id: user_id)
      end

      def self.update(id, parameters)
        ::UserFeed.find(id)&.update(parameters)
      end

      def self.find_or_create(parameters)
        ::UserFeed.find_or_create_by!(parameters)
      end
    end
end