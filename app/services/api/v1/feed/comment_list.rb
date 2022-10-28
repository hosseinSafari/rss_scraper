module Api
    module V1
        module Feed
            class CommentList
                include Peafowl

                attribute :id, ::String
                attribute :current_user, ::User

                validates :id, presence: true
                validates :current_user, presence: true

                def call
                    @feed_id = @id
                    @comments = ::CommentRepository::Comment.fetch_by_relation_ids(@current_user.id, @feed_id)
                    
                    context[:comments] = @comments&.uniq
                end
                
            end
        end
    end
end