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
    end
end