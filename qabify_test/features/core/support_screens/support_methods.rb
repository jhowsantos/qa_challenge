
def wait_for_element(attributes)
    begin
        manage.timeouts.implicit_wait = 5
        find_element(:id, attributes).displayed?
    rescue 
        fail 'element not found'
    end   
end