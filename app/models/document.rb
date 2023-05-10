class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  def file_size
    file.attached? ? (file.blob.byte_size.to_f / 1.megabyte).round(3) : 0
  end

  def filename
    file.attached? ? File.basename(file.filename.to_s, ".*") : ""
  end
end