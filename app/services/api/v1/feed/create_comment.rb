module Api
    module V1
        module Feed
            class CreateComment
                include Peafowl

                attribute :id, ::String
                attribute :current_user, ::User
                attribute :description, ::User

                validates :id, presence: true
                validates :description, presence: true
                validates :current_user, presence: true

                def call
                    ::CommentRepository::Comment.create(parameters)
                end
                
                private

                def parameters
                    @feed_id = @id
                    { user_id: @current_user.id, feed_id: @feed_id, description: @description }
                end
            end
        end
    end
end