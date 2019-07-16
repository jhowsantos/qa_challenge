class TokenScreen

    def initialize
        @token = 'captcha_text'
        @next_button = 'captcha_button'
    end

    def save_token
        find_element(:id, @token).text
    end

    def tap_next_button
        find_element(:id, @next_button).click
    end

    def valid_screen_token
        wait_for_element(@next_button)
    end
end
