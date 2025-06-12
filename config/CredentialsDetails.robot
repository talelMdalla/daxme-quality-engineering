*** Settings ***
Resource    ./EnvDetails.robot


*** Variables ***
# CREATE MISSION
${LOCAL_EMAIL_CREATE_MISSION}       testing.daxme@gmail.com
${DEV_EMAIL_CREATE_MISSION}         testing.daxme@gmail.com
${PROD_EMAIL_CREATE_MISSION}        testing.daxme@gmail.com

${LOCAL_PASS_CREATE_MISSION}        Boutcho123&
${DEV_PASS_CREATE_MISSION}          Boutcho123&
${PROD_PASS_CREATE_MISSION}         Daxme2021&

${TEST_EMAIL_CREATE_MISSION}        ${${ENV}_EMAIL_CREATE_MISSION}
${TEST_PASS_CREATE_MISSION}         ${${ENV}_PASS_CREATE_MISSION}

# AUTH

${LOCAL_EMAIL_AUTH}                 testing1.daxme@gmail.com
${DEV_EMAIL_AUTH}                   testing1.daxme@gmail.com
${PROD_EMAIL_AUTH}                  testing.daxme@gmail.com

${LOCAL_PASS_AUTH}                  Boutcho123&
${DEV_PASS_AUTH}                    Boutcho123&
${PROD_PASS_AUTH}                   Daxme2021&

${TEST_EMAIL_AUTH}                  ${${ENV}_EMAIL_AUTH}
${TEST_PASS_AUTH}                   ${${ENV}_PASS_AUTH}

# CREATE COMPANY AND JOIN COMPANY

${LOCAL_EMAIL_COMPANY}              createcompany@gmail.com
${DEV_EMAIL_COMPANY}                createcompany@gmail.com
${PROD_EMAIL_COMPANY}               createcompany@gmail.com

${LOCAL_PASS_COMPANY}               Boutcho123&
${DEV_PASS_COMPANY}                 Boutcho123&
${PROD_PASS_COMPANY}                Boutcho123&

${TEST_EMAIL_COMPANY}               ${${ENV}_EMAIL_COMPANY}
${TEST_PASS_COMPANY}                ${${ENV}_PASS_COMPANY}

${LOCAL_EMAIL_LOGIN}      createcompany@gmail.com
${LOCAL_PASS_LOGIN}       Boutcho123&
