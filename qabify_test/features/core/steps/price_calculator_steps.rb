
Given("that the user logged into the application") do
  @login_screen.login_app('user@qabify.com', '1234Abc')
  @token_screen.valid_screen_token
  @token = @token_screen.save_token
  @token_screen.tap_next_button
end

Given("selects {string} of the journey") do |origin|
  @journey_screen.list_pick_up_point
  @journey_screen.choose_pick_up_point(origin)
end

Given("the {string} of the journey") do |destination|
  @journey_screen.list_drop_off_point
  @journey_screen.choose_drop_off_point(destination)
end

When("selects {string} car") do |type|
  @journey_screen.select_type_car(type)
end

When("fills in a valid token") do
  @journey_screen.set_token(@token)
end

When("tap the estimate button") do
  @journey_screen.tap_estimate_button
end

Then("should see the {string} of the journey successfully on the screen") do |value|
  expect(@journey_screen.get_price).to eql value
end

Given("selects origin") do
  @journey_screen.list_pick_up_point
  @journey_screen.select_origin_point
end

Given("selects the fate of the journey with the type car") do
  @journey_screen.list_drop_off_point
  @journey_screen.select_drop_off_point
  @journey_screen.choose_type_car
end

When("fills in a invalid {string}") do |token|
  @journey_screen.set_token(token)
end

Then("the system should display error {string}") do |message|
  @journey_screen.wait_alert_visible
  expect(@journey_screen.get_alert_message).to eql message
end

Given("fills in all valid information") do
  @journey_screen.fill_in_valid_information(@token)
  @journey_points = @journey_screen.save_journey_points
end

When("tap the request car button") do
  @journey_screen.tap_request_car
end

Then("the system should display the calculated journey at the end of the list") do
  @past_journeys_screen.wait_title_visible
  @info_journey = @past_journeys_screen.get_jorney(@journey_points)
  @list_journeys = @past_journeys_screen.verify_list_journeys
  
  expect(@list_journeys).to eql @info_journey
end

Given("selects fate equals origin") do
  @journey_screen.list_drop_off_point
  @journey_screen.select_origin_point
end

When("fill in the other fields with valid data") do
  @journey_screen.choose_type_car
  @journey_screen.set_token(@token)
  @journey_screen.tap_estimate_button
end

Then("the system should not calculate the journey") do
  expect(@journey_screen.get_price).to eql 'null €'
end

Then("should display an alert") do
  expect(@journey_screen.wait_alert_visible).to be true
end

Given("selects fate different of the origin") do
  @journey_screen.list_drop_off_point
  @journey_screen.select_drop_off_point
end

Given("selects the two types of car") do
  @journey_screen.select_two_type_car
end

When("fills in valid token") do
  @journey_screen.set_token(@token)
end

Given("without choosing any type of car") do
  @journey_screen.without_select_type_car
end