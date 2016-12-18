module Web::Controllers::Clients
  class Index
    include Web::Action

    expose :clients

    def call(params)
      @clients = ClientRepository.new.all
    end
  end
end
