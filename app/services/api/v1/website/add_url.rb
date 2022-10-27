module Api
    module V1
        module Website
            class AddUrl
                include Peafowl

                attribute :url, ::String
                attribute :current_user, ::User

                validates :url, presence: true
                validates :current_user, presence: true

                def call
                    ActiveRecord::Base.transaction do
                        @site = ::WebsiteRepository::Site.find_or_create({url: @url})
                        @user_site = ::UserSiteRepository::UserSite.create({user: @current_user, site: @site})
                    end
                end
                
            end
        end
    end
end