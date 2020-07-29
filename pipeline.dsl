import java.util.Date
def date = new Date()
def viewName = 'content-weather-app'

pipelineJob("$viewName") {
  description('content-weather-app')
    parameters {
         string {
             name 'SOURCE_BRANCH'
             defaultValue 'master'
             description 'Git branch to use'
             trim true
         }
                     
    }    
  definition {
    cpsScm {
        lightweight(false)
        scm {
            git {
                branch '*/${SOURCE_BRANCH}'
                remote {
                    name 'origin'
                    url 'https://github.com/vggadde/content-weather-app.git'
                }
            }
        }
            scriptPath 'jenkinsfile'
    }
}
}
