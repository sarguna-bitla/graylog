class UsersController < ApplicationController
    def index
        # test_method

        render json:{
            status: true,
            data: []
        }
    end
end