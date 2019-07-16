
Before do
    @login_screen = LoginScreen.new
    @token_screen = TokenScreen.new
    @journey_screen = JourneyScreen.new
    @past_journeys_screen = PastJourneys.new
end

Before do |scenario|
    $driver.start_driver
end

After do |scenario|

    if scenario.failed?
        if !File.directory?("./reports/screenshots")
            FileUtils.mkdir_p("screenshots")
        end

        time_stamp = Time.now.strftime("%Y-%m-%d.%H.%M")
        screenshot_name = time_stamp + ".png"
        screenshot_file = File.join("./reports/screenshots", screenshot_name)
        $driver.screenshot(screenshot_file)
        embed("#{screenshot_file}", "image/png")
    end

    sleep 3
    $driver.driver_quit
end