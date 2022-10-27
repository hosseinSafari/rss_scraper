module Api
    module V1
        module Feed
            class Show
                include Peafowl

                attribute :id, ::String

                validates :id, presence: true

                def call
                    @feed = ::FeedRepository::Feed.find(@id)
                    context[:feed] = @feed
                end
                
            end
        end
    end
end