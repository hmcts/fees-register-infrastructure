#!groovy
properties(
        [[$class: 'GithubProjectProperty', projectUrlStr: 'https://github.com/hmcts/fees-register-infrastructure'],
         pipelineTriggers([[$class: 'GitHubPushTrigger']])]
)

@Library('Infrastructure')

def product = "fees-register"

withInfrastructurePipeline(product)
