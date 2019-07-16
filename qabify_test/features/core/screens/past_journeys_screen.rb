class PastJourneys

    def initialize
        @journey_list = 'journeyList'
        @journey_title = 'journeyTitle'
    end

    def wait_title_visible
        wait_for_element(@journey_list)
    end

    def verify_list_journeys
        find_element(:id, @journey_title).text
    end

    def get_jorney(journey_points)
        "#{journey_points[:start_point]} - #{journey_points[:end_point]}"
    end
end