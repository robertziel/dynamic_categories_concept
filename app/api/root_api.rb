class RootApi < Grape::API
  format :json

  helpers ApiAuthHelper
  helpers SerializersHelper

  namespace :auth do
    mount Auth::SignInApi
    mount Auth::SignOutApi
  end
  mount SearchApi

  add_swagger_documentation(
    hide_documentation_path: true,
    mount_path: '/swagger_doc',
    hide_format: true
  )
end
