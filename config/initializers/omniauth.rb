OmniAuth.config.logger = Rails.logger


# Staging
#Rails.application.config.middleware.use OmniAuth::Builder do
# provider :facebook, '459313674097872', '404d919b5b953506336a4802f7ae4396'
#end


#Local
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '206130946151276', '6ea925d5c0f83b29abcda46ec0d01cbf'
end