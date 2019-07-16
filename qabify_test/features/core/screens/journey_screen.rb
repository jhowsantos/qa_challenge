class JourneyScreen

    def initialize
        @pick_up_point = 'pick_up_point'
        @drop_off_point = 'drop_off_point'
        @type_car_lite = 'liteCheckBox'
        @type_car_executive = 'executiveCheckBox'
        @token = 'captcha_text'
        @price = 'price_text'
        @estimate_button = 'estimate_button'
        @request_button = 'request_button'
        @message = 'message'
        @alert_title = 'alertTitle'
    end

    def list_pick_up_point
        id(@pick_up_point).click
    end

    def choose_pick_up_point(origin)
        xpath("//*[@text='#{origin}']").click
    end

    def list_drop_off_point
        find_element(:id, @drop_off_point).click
    end

    def choose_drop_off_point(destination)
        find_element(:xpath, "//*[@text='#{destination}']").click
    end

    def select_type_car(type)
        @type_car = find_element(:xpath, "//*[@text='#{type}']")
        @car_lite = find_element(:id, @type_car_lite)

        if type == 'Lite'
            @type_car.click if @type_car.checked? != 'true'
        elsif
            type == 'Executive'
            @car_lite.click if @car_lite.checked?
            @type_car.click
        end
    end

    def set_token(token)
        find_element(:id, @token).send_keys(token)
    end

    def tap_estimate_button
        if is_keyboard_shown
            hide_keyboard
        end
        find_element(:id, @estimate_button).click
    end

    def wait_alert_visible
        wait_for_element(@alert_title)
    end

    def get_price
        find_element(:id, @price).text
    end

    def select_origin_point
        @start_point = find_element(:xpath, "//*[@text='Atocha']").text
        find_element(:xpath, "//*[@text='Atocha']").click
    end

    def select_drop_off_point
        @end_point = find_element(:xpath, "//*[@text='Calle Pradillo, 42']").text
        find_element(:xpath, "//*[@text='Calle Pradillo, 42']").click
    end

    def choose_type_car
        @car_lite = find_element(:id, @type_car_lite)
        @car_lite.click if @car_lite.checked? != 'true'
    end

    def get_alert_message
        find_element(:id, @message).text
    end

    def fill_in_valid_information(token)
        list_pick_up_point
        select_origin_point
        list_drop_off_point
        select_drop_off_point
        choose_type_car
        set_token(token)
        tap_estimate_button
    end

    def save_journey_points
        @journey_points = {}
        @journey_points[:start_point] = @start_point
        @journey_points[:end_point] = @end_point
        @journey_points
    end

    def tap_request_car
        find_element(:id, @request_button).click
    end

    def select_two_type_car
        @car_lite = find_element(:id, @type_car_lite)
        @car_executive = find_element(:id, @type_car_executive)
        @car_lite.click if @car_lite.checked? != 'true'
        @car_executive.click if @car_executive.checked? != 'true'
    end

    def without_select_type_car
        @car_lite = find_element(:id, @type_car_lite)
        @car_executive = find_element(:id, @type_car_executive)
        @car_lite.click if @car_lite.checked? == 'true'
        @car_executive.click if @car_executive.checked? == 'true'
    end
end