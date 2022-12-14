module CommentRepository
    class Comment < Irepository
  
      def self.find(id)
        ::Comment.find(id)
      end
  
      def self.create(parameters)
        ::Comment.create!(parameters)
      end

      def self.fetch_by_relation_ids(user_id, feed_id)
        ::Comment.joins(feed: [site: :user_sites])&.where("user_sites.user_id = :user_id AND feeds.id = :feed_id", user_id: user_id, feed_id: feed_id)
      end
    end
end