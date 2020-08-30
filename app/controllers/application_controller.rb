class ApplicationController < ActionController::API
    include Rails.application.routes.url_helpers

    def secret_key
        "mu$ic1$LiF3n@Ti0NaL$t@nDarD$"
    end

    def encode(payload)
        JWT.encode(payload, secret_key, "HS256")
    end

    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: "HS256"})[0]
    end
end
