module PagesHelper
    def distance_of_time_in_words_to_now(from_time, options = {})
        distance_of_time_in_words(from_time, Time.now, options)
    end
end