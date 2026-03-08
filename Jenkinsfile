#!groovy
node {

    def HUB_ORG = env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY = env.CONNECTED_APP_CONSUMER_KEY_DH

    def toolbelt = tool 'toolbelt'

    stage('Checkout Source') {
        checkout scm
    }

    stage('Verify Salesforce CLI') {
        bat "\"${toolbelt}\\bin\\sf.cmd\" --version"
    }

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {

        stage('Authorize DevHub') {

            def rc = bat(
                returnStatus: true,
                script: "\"${toolbelt}\\bin\\sfdx.cmd\" force:auth:jwt:grant --clientid ${CONNECTED_APP_CONSUMER_KEY} --username ${HUB_ORG} --jwtkeyfile ${jwt_key_file} --setdefaultdevhubusername --instanceurl ${SFDC_HOST}"
            )

            if (rc != 0) {
                error "DevHub authorization failed"
            }

            echo "Authorization successful"
        }

        stage('Deploy Source') {

            def deployOutput = bat(
                returnStdout: true,
                script: "\"${toolbelt}\\bin\\sfdx.cmd\" force:source:deploy -x manifest/package.xml -u ${HUB_ORG}"
            )

            echo deployOutput
        }
    }
}
