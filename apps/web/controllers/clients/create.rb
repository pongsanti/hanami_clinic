module Web::Controllers::Clients
  class Create
    include Web::Action

    expose :client

    params do
      required(:client).schema do
        required(:name).filled(:str?)
        required(:email).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @client = ClientRepository.new.create(params[:client])

        redirect_to '/clients'
      else
        self.status = 422
      end
    end
  end
end
