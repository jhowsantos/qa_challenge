#language: en

Feature: Price calculator
    As a user of the cabify app
    I want to calculate the price of the journey
    To know the value before requesting a car

    Background: Login successfully
        Given that the user logged into the application

    Scenario Outline: Calculate the destination value of the journey successfully
        And selects '<origin>' of the journey
        And the '<destination>' of the journey
        When selects '<type>' car
        And fills in a valid token
        And tap the estimate button
        Then should see the '<value>' of the journey successfully on the screen
    
    @valids   
    Examples:
        | origin |   type    |        destination            |  value  |
        | Atocha | Lite      | Aeropuerto Madrid Barajas, T4 | 35.2 €  |
        | Atocha | Lite      | Calle Pradillo, 42            | 17.5 €  |
        | Atocha | Lite      | Calle Mejía Lequerica, 14     | 24.3 €  |
        | Atocha | Executive | Aeropuerto Madrid Barajas, T4 | 38.72 € |
        | Atocha | Executive | Calle Pradillo, 42            | 19.25 € |
        | Atocha | Executive | Calle Mejía Lequerica, 14     | 26.73 € |

    Scenario Outline: Invalid token
        And selects origin
        And selects the fate of the journey with the type car
        When fills in a invalid '<token>'
        And tap the estimate button
        Then the system should display error '<message>'
    
    @token    
    Examples:
        | token |       message          |
        | 999   | Captcha typed is wrong |
        | aaa   | Captcha typed is wrong |
        |       | Captcha typed is wrong |

    @past_journeys
    Scenario: View past journeys
        And fills in all valid information
        And tap the estimate button
        When tap the request car button
        Then the system should display the calculated journey at the end of the list

    @equal
    Scenario: Starting point equal to destination
        And selects origin
        And selects fate equals origin
        When fill in the other fields with valid data
        And tap the estimate button
        Then the system should not calculate the journey
        And should display an alert

    @together
    Scenario: Choose lite and executive together
        And selects origin
        And selects fate different of the origin
        And selects the two types of car
        When fills in valid token
        And tap the estimate button
        Then the system should not calculate the journey
        And should display an alert

    @whithout
    Scenario: Without choosing any type of car
        And selects origin
        And selects fate different of the origin
        And without choosing any type of car
        When fills in valid token
        And tap the estimate button
        Then the system should not calculate the journey
        And should display an alert