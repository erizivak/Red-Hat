*** Settings ***
Library  Selenium2Library
Test Setup      Open Browser    ${URL}   ${BROWSER}
Test Teardown   Close All Browsers

*** Variables ***
${URL}              http://localhost:8888/?token=d6c1f619f2abdb3a31ce2a57f1c31bacca55352ace7e3c76

${BROWSER}          Chrome

${logo}                    id:ipython_notebook
${select_notebook}         xpath=//*[@id="notebook_list"]/div[4]/div/a/span
${cell_menu}               id:celllink
${run_all_cell}            id:run_all_cells
${plot}                    xpath=//*[@id="notebook-container"]/div[5]/div[2]/div[2]/div[2]/div[3]/img

*** Test Cases ***

Create a new PLOT
    Wait Until Element Is Visible  ${logo}
    capture page screenshot
    click element                  ${select_notebook}
    capture page screenshot
    switch window                   new
    Wait Until Element Is Visible  ${logo}
    capture page screenshot
    click element                  ${cell_menu}
    click element                  ${run_all_cell}
    capture page screenshot
    wait until element is visible  ${plot}
    scroll element into view       ${plot}
    capture page screenshot