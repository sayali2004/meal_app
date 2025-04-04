pipeline {
    agent any

    environment {
        FLUTTER_HOME = "${HOME}/flutter"
        PATH = "${FLUTTER_HOME}/bin:${env.PATH}"
        MY_ENV_VAR = "Custom Value for Flutter Build"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    def gitRepoUrl = 'https://github.com/sayali2004/meal_app.git'
                    checkout([$class: 'GitSCM', 
                        branches: [[name: '*/main']], // change to '*/master' if your repo uses master
                        userRemoteConfigs: [[url: gitRepoUrl]],
                        extensions: [[$class: 'CleanBeforeCheckout']]
                    ])
                }
            }
        }

        stage('Flutter Version Check') {
            steps {
                sh 'flutter --version'
            }
        }

        stage('Get Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }

        stage('Analyze Code') {
            steps {
                sh 'flutter analyze'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'flutter test'
            }
        }

        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
            }
        }

        stage('Deploy / Output') {
            steps {
                sh '''
                echo "APK Build Complete!"
                echo "ENV VAR: $MY_ENV_VAR"
                ls build/app/outputs/flutter-apk/
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Flutter build pipeline completed successfully!'
        }
        failure {
            echo '❌ Flutter build pipeline failed!'
        }
    }
}
