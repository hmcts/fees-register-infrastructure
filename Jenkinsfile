#!groovy
properties(
        [[$class: 'GithubProjectProperty', projectUrlStr: 'https://github.com/contino/moj-fees-register-infrastructure'],
         pipelineTriggers([[$class: 'GitHubPushTrigger']])]
)

@Library('Infrastructure')

def product = "fees-register"

withInfrastructurePipeline(product)
