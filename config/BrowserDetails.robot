*** Settings ***
Resource    ./EnvDetails.robot


*** Variables ***
# Extecution Browser
${COMMON_OPTS}              add_argument("--lang=fr");add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
# ${COMMON_OPTS}    add_argument:--headless add_argument:--no-sandbox add_argument:--disable-dev-shm-usage
# ${TEST_BROWSER}    headlesschrome
# ${TEST_BROWSER}    headlessfirefox
${BROWSER}                  chrome
${LOCAL_BROWSER_OPTIONS}    add_argument("--lang=fr");
${DEV_BROWSER_OPTIONS}      ${COMMON_OPTS}
${PROD_BROWSER_OPTIONS}     ${COMMON_OPTS}
${TEST_BROWSER_OPTIONS}     ${${ENV}_BROWSER_OPTIONS}
# ${TEST_BROWSER}    firefox
# ${TEST_BROWSER}    safari
