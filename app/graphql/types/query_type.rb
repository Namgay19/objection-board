module Types
  class QueryType < BaseObject
    include Pagy::Backend

    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, UserType, null: true
    field :task, TaskType, null: true do
      argument :id, ID, required: true
    end
    field :tasks, [TaskType], null: true do
      argument :params, Attributes::TaskQuery, required: false
    end

    field :dream_account, DreamAccountType, null: true do
      argument :id, ID, required: true
    end
    field :dream_accounts, [DreamAccountType], null: true do
      argument :params, Attributes::TaskQuery, required: false
    end

    field :objection, ObjectionType, null: true do
      argument :id, ID, required: true
    end

    field :objections, [ObjectionType], null: true do
      argument :params, Attributes::ObjectionQuery, required: false
    end

    field :book, BookType, null: true do
      argument :id, ID, required: true
    end
    
    field :books, [BookType], null: true do
      argument :params, Attributes::BookQuery, required: false
    end

    field :story, StoryType, null: true do
      argument :id, ID, required: true
    end
    
    field :stories, [StoryType], null: true do
      argument :params, Attributes::BookQuery, required: false
    end

    field :audio, AudioType, null: true do
      argument :id, ID, required: true 
    end
    
    field :audios, [AudioType], null: true do
      argument :params, Attributes::BookQuery, required: false
    end

    field :video, VideoType, null: true do
      argument :id, ID, required: true
    end
    
    field :videos, [VideoType], null: true do
      argument :params, Attributes::BookQuery, required: false
    end

    def user
      User.find_by(id: current_user.id)
    end

    def task(id:)
      Task.find_by(id: id)
    end

    def tasks(params: {})
      TaskQuery.new(params.to_h, current_user).run
    end

    def dream_account(id:)
      DreamAccount.find_by(id: id)
    end

    def dream_accounts(params: {})
      begin
        accounts = DreamAccountsQuery.new(params.to_h, current_user).run
        _, records = pagy(accounts, page: params.to_h.fetch(:page, 1), items: params.to_h.fetch(:per_page, 10))
      rescue Pagy::OverflowError
        records = []
      end
      records
    end

    def objection(id:)
      objection = Objection.find_by(id: id)
      objection.update_column(:view_count, objection.view_count + 1) if objection.present?
      objection
    end

    def objections(params: {})
      begin
        objections = ObjectionsQuery.new(params.to_h, current_user).run
        _, records = pagy(objections, page: params.to_h.fetch(:page, 1), items: params.to_h.fetch(:per_page, 10))
      rescue Pagy::OverflowError
        records = []
      end
      records
    end

    def book(id:)
      book = Book.find_by(id: id)
      book.update_column(:viewed_at, DateTime.now) if book.present?
      book
    end

    def books(params: {})
      begin
        books = BooksQuery.new(params.to_h, current_user).run
        _, records = pagy(books, page: params.to_h.fetch(:page, 1), items: params.to_h.fetch(:per_page, 10))
      rescue Pagy::OverflowError
        records = []
      end
      records
    end

    def audio(id:)
      audio = Audio.find_by(id: id)
      audio.update_column(:viewed_at, DateTime.now) if audio.present?
      audio
    end
    
    def audios(params: {})
      begin
        audios = AudiosQuery.new(params.to_h, current_user).run
        _, records = pagy(audios, page: params.to_h.fetch(:page, 1), items: params.to_h.fetch(:per_page, 10))
      rescue Pagy::OverflowError
        records = []
      end
      records
    end

    def video(id:)
      video = Video.find_by(id: id)
      video.update_column(:viewed_at, DateTime.now) if video.present?
      video
    end
    
    def videos(params: {})
      begin
        videos = VideosQuery.new(params.to_h, current_user).run
        _, records = pagy(videos, page: params.to_h.fetch(:page, 1), items: params.to_h.fetch(:per_page, 10))
      rescue Pagy::OverflowError
        records = []
      end
      records
    end

    def story(id:)
      story = Story.find_by(id: id)
      story.update_column(:viewed_at, DateTime.now) if story.present?
      story
    end

    def stories(params: {})
      begin
        stories = StoriesQuery.new(params.to_h, current_user).run
        _, records = pagy(stories, page: params.to_h.fetch(:page, 1), items: params.to_h.fetch(:per_page, 10))
      rescue Pagy::OverflowError
        records = []
      end
      records
    end

  end
end
