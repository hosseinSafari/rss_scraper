module CommentRepository
    class Comment < Irepository
  
      def self.find(id)
        ::Comment.find(id)
      end
  
      def self.create(parameters)
        ::Comment.create!(parameters)
      end
    end
end