class Item
    attr_reader :genre, :author, :source, :label, :publish_date
    attr_accessor :archived
    def initialize(genre, author, source, label, publish_date, archived: true)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end

    def can_be_archived?
        publish_date > 10.years.ago
    end

    def move_to_archive
        if(can_be_archived?)
            @archived = true
        end
    end

    private :can_be_archived?
end
