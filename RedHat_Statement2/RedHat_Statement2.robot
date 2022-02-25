*** Settings ***
Library  Selenium2Library
Test Setup      Open Browser    ${URL}   ${BROWSER}
Test Teardown   Close All Browsers

*** Variables ***
${URL}              https://amazon.es
${BROWSER}          Chrome

${cookies_accept}          id:sp-cc-accept
${search_form}             id:twotabsearchtextbox
${add_to_cart}             id:add-to-cart-button
${search_result_test_1}    xpath=//div[@class='s-widget-container s-spacing-small s-widget-container-height-small celwidget slot=MAIN template=SEARCH_RESULTS widgetId=search-results_1']
${search_result_test_2}    xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[2]/div/div/div/div/div/div/div[3]/div[2]/h2/a
${search_result_test_2_2}  xpath=//*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[2]/div/div/div/div/div/div/div[2]/div[2]/h2/a/span
${quantity}                id:quantity
${Cart}                    id:nav-cart-count
${Card_Visible}            id:attach-view-cart-button-form
${close_cart}              id:attach-close_sideSheet-link
${select_size}             id:native_dropdown_selected_size_name


*** Test Cases ***


amazon positive testcase happyPath add to cart one product
    Wait Until Element Is Visible  ${search_form}
    capture page screenshot
    click element                  ${cookies_accept}
    Input Text                     ${search_form}   Tilt Strategies for Team Agility: RedHat Participant Workbook (Tilt Workshop Series for RedHat)
    capture page screenshot
    Submit Form
    Wait Until Element Is Visible  ${search_result_test_1}
    capture page screenshot
    click element                  ${search_result_test_1}
    Wait Until Element Is Visible  ${add_to_cart}
    capture page screenshot
    click element                  ${add_to_cart}
    click element                  ${Cart}
    capture page screenshot

amazon positive testcase add several product to the cart
    Wait Until Element Is Visible  ${search_form}
    capture page screenshot
    click element                  ${cookies_accept}
    Input Text                     ${search_form}   Cressi Big Eyes Evolution
    capture page screenshot
    Submit Form
    Wait Until Element Is Visible  ${search_result_test_2}
    capture page screenshot
    click element                  ${search_result_test_2}
    Wait Until Element Is Visible  ${add_to_cart}
    capture page screenshot
    click element                  ${add_to_cart}
    Wait Until Element Is Visible  ${Card_Visible}
    capture page screenshot
    click element                  ${close_cart}
    Sleep    2s
    Wait Until Element Is Visible  ${search_form}
    capture page screenshot
    Input Text                     ${search_form}   chaleco buceo
    capture page screenshot
    Submit Form
    Wait Until Element Is Visible  ${search_result_test_2_2}
    capture page screenshot
    click element                  ${search_result_test_2_2}
    Wait Until Element Is Visible  ${add_to_cart}
    capture page screenshot
    click element                  ${add_to_cart}
    capture page screenshot
    click element                  ${Cart}
    capture page screenshot

amazon negative testcase add same product to the cart and the quantity should increase
    Wait Until Element Is Visible  ${search_form}
    capture page screenshot
    click element                  ${cookies_accept}
    Input Text                     ${search_form}   Tilt Strategies for Team Agility: RedHat Participant Workbook (Tilt Workshop Series for RedHat)
    capture page screenshot
    Submit Form
    Wait Until Element Is Visible  ${search_result_test_1}
    capture page screenshot
    click element                  ${search_result_test_1}
    Wait Until Element Is Visible  ${add_to_cart}
    capture page screenshot
    click element                  ${add_to_cart}
    capture page screenshot
    Input Text                     ${search_form}   Tilt Strategies for Team Agility: RedHat Participant Workbook (Tilt Workshop Series for RedHat)
    capture page screenshot
    Submit Form
    Wait Until Element Is Visible  ${search_result_test_1}
    capture page screenshot
    click element                  ${search_result_test_1}
    Wait Until Element Is Visible  ${add_to_cart}
    capture page screenshot
    click element                  ${add_to_cart}
    click element                  ${Cart}
    capture page screenshot

amazon negative testcase. It's not possible select more than maximun available products
    Wait Until Element Is Visible  ${search_form}
    capture page screenshot
    click element                  ${cookies_accept}
    Input Text                     ${search_form}   chaleco buceo
    capture page screenshot
    Submit Form
    Wait Until Element Is Visible  ${search_result_test_2_2}
    capture page screenshot
    click element                  ${search_result_test_2_2}
    capture page screenshot
    select from list by label      ${quantity}      2
    click element                  ${add_to_cart}
    click element                  ${Cart}
    capture page screenshot