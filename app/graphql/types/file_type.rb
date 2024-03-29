module Types
  class FileType < BaseScalar
    description "A valid URL, transported as a string"

    def self.coerce_input(file, context)
      ActionDispatch::Http::UploadedFile.new(
        filename: file.original_filename,
        type: file.content_type,
        headers: file.headers,
        tempfile: file.tempfile
      )
    end
  end
end
