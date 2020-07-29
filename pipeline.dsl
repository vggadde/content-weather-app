import java.util.Date
def date = new Date()
def viewName = 'Sample NodeJS App'

pipelineJob("$viewName") {
  description('Sample NodeJS App')
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
