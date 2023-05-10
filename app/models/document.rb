class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validate :file_size_validation

  def file_size
    file.attached? ? (file.blob.byte_size.to_f / 1.megabyte).round(3) : 0
  end

  def filename
    file.attached? ? File.basename(file.filename.to_s, ".*") : ""
  end



  private

  def file_size_validation
    if file.attached? && file.byte_size > 4.megabytes
      errors.add(:file, 'is too big')
    end
  end
end