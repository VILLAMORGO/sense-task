class Page < ApplicationRecord
    include ActionView::Helpers::DateHelper

    Date::DATE_FORMATS[:stamp] = "%Y%m%d" # YYYYMMDD
end