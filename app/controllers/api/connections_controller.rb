class Api::ConnectionsController < ApplicationController
    def index
        render json: { total: Connection.all.count }
    end

    def create
        @connection = Connection.new(connection_params)

        if @connection.save
            render json: {status: 200, message: 'Conexão realizada com sucesso!'}
        else
            render json: {status: 500, message: 'Não foi possível criar conexão!'}
        end
    end

    def connection_params
        params.permit(:user_id)
    end
end
