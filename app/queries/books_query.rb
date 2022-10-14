class BooksQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def run
    if params[:sort_by] == 'viewed_at'
      viewed_books = books.where.not(viewed_at: nil)
      if viewed_books.present?
        viewed_books.order('viewed_at DESC')
      else
        []
      end
    else
      books.order('created_at DESC')
    end
  end

  def books
    @books ||= current_user.books
  end
end
