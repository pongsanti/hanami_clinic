module Web::Controllers::Clients
  class Create
    include Web::Action

    expose :client

    def call(params)
      @client = ClientRepository.new.create(params[:client])

      redirect_to '/clients'
    end
  end
end
