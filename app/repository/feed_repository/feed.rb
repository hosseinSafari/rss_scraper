module FeedRepository
    class Feed < Irepository
  
      def self.find(id)
        ::Feed.find(id)
      end
  
      def self.create(parameters)
        ::Feed.create!(parameters)
      end

      def self.find_or_create(parameters)
        ::Feed.find_or_create_by!(parameters)
      end

      def self.current_user_feeds(email)
        ::Feed.joins(user_feeds: :user)&.where("users.email = :email", email: email)
      end

      def self.update(id, parameters)
        ::Feed.find(id)&.update!(parameters)
      end

      def self.update_or_create(url, parameters)
        feed = ::Feed.find_by(url: url)
        feed.present? ? feed.update(parameters) : ::Feed.create!(parameters)
      end
    end
end