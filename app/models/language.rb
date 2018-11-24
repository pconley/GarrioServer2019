class Language < ApplicationRecord

    validates :name, :presence => true

    # 2 character ISO 639-1 code for the language
    # https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes

    validates_length_of :code, minimum: 2, maximum: 2, allow_blank: false

end
