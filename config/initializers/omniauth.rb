Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
    {
        scope: 'userinfo.email', 'userinfo.profile',
        prompt: 'select_account'
        image_aspect_ratio: 'square',
        image_size: 50
    }
end