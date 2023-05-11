class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :file, attached: true, content_type: { in: %w[application/zip application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.openxmlformats-officedocument.wordprocessingml.document] }, size: { less_than: 4.megabyte }

  def file_size
    file.attached? ? (file.blob.byte_size.to_f / 1.megabyte).round(3) : 0
  end

  def filename
    file.attached? ? File.basename(file.filename.to_s, ".*") : ""
  end

  def extension_name
    file.attached? ? File.extname(file.filename.to_s)[1..-1] : ""
  end  
end