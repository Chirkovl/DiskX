class DisksController < ApplicationController
  before_action :authenticate_user!
  before_action :calculate_available_space, only: %i[index create new]

  def index
    documents = current_user.documents
  end

  def new
    document = current_user.documents.new
  end

  def create
    document = current_user.documents.new(document_params)
    if @available_space - document.file_size < 0 || document.file_size > 4
      redirect_to disks_path,
                  alert: 'Суммарный размер файлов не должен превышать 10MB, а загружаемый не должен превышать 4MB'
    elsif document.save
      redirect_to disks_path, notice: 'Файл успешно загружен'
    else
      redirect_to disks_path, alert: document.errors.full_messages.join('. ')
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

  def calculate_available_space
    @available_space = (10 - current_user.documents.with_attached_file.sum(&:file_size)).round(3)
  end
end
