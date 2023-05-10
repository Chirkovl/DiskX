class DisksController < ApplicationController
  before_action :authenticate_user!

  def index
    @documents = current_user.documents
    @available_space = (10 - (current_user.documents.sum(&:file_size))).round(3)
  end

  def new
    @available_space = (10 - (current_user.documents.sum(&:file_size))).round(3)
    document = current_user.documents.new
  end

  def create
    @available_space = (10 - (current_user.documents.sum(&:file_size))).round(3)
    document = current_user.documents.new(document_params)
    if @available_space - document.file_size < 0 && document.file_size < 4
      redirect_to disks_path, alert: "Суммарный размер файлов не должен превышать 10MB, а загружаемый не должен превышать 4MB"
    else
      if document.save
        redirect_to disks_path, notice: 'Файл успешно загружен'
      else
        redirect_to disks_path, alert: document.errors.full_messages.join('. ')
      end
    end
  end

  def destroy
    document = current_user.documents.find(params[:id])
    document.destroy
    redirect_to disks_path, notice: 'Файл успешно удален'
  end

  private

  def document_params
    params.require(:document).permit(:file)
  end
end

