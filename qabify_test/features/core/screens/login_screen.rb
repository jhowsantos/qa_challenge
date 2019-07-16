class LoginScreen

    def initialize
        @field_username = 'user_name_edit_text'
        @field_password = 'password_edit_text'
        @login_button = 'login_button'
    end

    def set_username(username)
        find_element(:id, @field_username).send_keys(username)
    end

    def set_password(password)
        find_element(:id, @field_password).send_keys(password)
    end

    def tap_login_button
        find_element(:id, @login_button).click
    end

    def login_app(username, password)
        set_username(username)
        set_password(password)
        tap_login_button
    end

end