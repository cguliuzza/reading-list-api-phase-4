class UserBooksController < ApplicationController
    def create
      user_book = current_user.user_books.build(user_book_params)
      if user_book.save
        render json: user_book, status: :created
      else
        render json: user_book.errors, status: :unprocessable_entity
      end
    end
  
    def update
      user_book = UserBook.find(params[:id])
      if user_book.update(user_read_book_params)
        render json: user_book, status: :ok
      else
        render json: user_book.errors, status: :unprocessable_entity
      end
    end

    private
  
    def user_book_params
      params.permit(:book_id)
    end

    def user_read_book_params
      params.permit(:read)
    end
  end