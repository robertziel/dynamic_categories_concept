module ApiDescHelper
  def self.with_common_headers(auth: true, headers: {})
    if auth
      headers.merge!(
        AUTHENTICATION_TOKEN_HEADER => {
          description: 'Authentication token',
          required: true
        }
      )
    end

    headers
  end
end
