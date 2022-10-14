module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    def current_user
      context[:current_user]
    end

    def associate_images(image_ids, record)
      images = Image.where(id: image_ids)
      images.each do |image|
        image.update(imageable: record)
      end
    end
  end
end
