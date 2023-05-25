

*** Settings ***

Library    String

Documentation           Test suite for CRT starter.
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers



*** Test Cases ***


Test the home page
    [Documentation]     Go to the web shop, and verify that the slogan text appears on the page.
    [tags]              sample
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Find your spirit animal

Check the navigation menu items
    [Documentation]     Go to the shop homepage and verify the menu items.
    [tags]              cart    sample
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact

Shop for products
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    [tags]              cart
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

# Pro Tip: Make sure that when each test case starts, your application is in a well-defined
#          initial state. The test cases above use GoTo with a fixed URL to set the initial
#          application state, but we recommend starting each test case with the dedicated
#          AppState QWord. The test case below starts with AppState Home, where Home is an
#          initial state defined in the Keywords section at the end of the file. More initial
#          states could be defined as needed.

Continue shopping
    [Documentation]     Add a second product to the cart.
    AppState            Home
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText          $9.00
    ClickText           Add to cart
    ClickText           Continue shopping
    # Check if we've exited the "cart" by looking for text in the footer.
    VerifyText          Fur, Inc.

Add to Cart
    [Documentation]   Test Case created using the QEditor
    GoTo              https://qentinelqi.github.io/shop/
    ClickText         Sacha the Deer
    ClickText         Add to cart
    ${RandomString} =     Generate Random String    length=5          chars=[NUMBERS]
    ClickText         Promo Code?
    TypeText          Promo code        ${RandomString}
    ClickText         Apply


Create Contact
    GoTo              https://qentinelqi.github.io/shop/
    ClickText         Contact
    TypeText    Enter your name...    trupti
    TypeText    Enter your email...    Truptichaudhary.sfdc.gmail.com
    TypeText    Enter your message...    please contact
    ClickText    Send Message



*** Keywords ***

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/

# Pro Tip: In this Keywords section, you could combine QWords to make your own keywords using
#          the structure shown above. The pro way is to define them in a separate file and import
#          that file un