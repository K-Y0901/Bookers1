class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
  end
  
  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if book.save
       flash[:notice] = "successfully"
    # ３. トップ画面へリダイレクト
       redirect_to books_path
    else
        flash[:notice] = "error"
        redirect_to books_path
    end
  end
  
  def show
    @book=Book.find(params[:id])
  end
  
  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    @book.save
    if @book.save
      flash[:notice]="Book was successfully updated."
      redirect_to books_path
    else
      flash[:notice]="error"
      redirect_to edit_book_path
    end
  end
  
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end



