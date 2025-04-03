pipeline {
    agent any  // Runs the pipeline on any available agent

    environment {
        // Set the path to the Flutter SDK (adjust this path based on your system)
        FLUTTER_HOME = '/path/to/flutter'  // Update with your Flutter SDK path
        PATH = "${env.PATH}:${env.FLUTTER_HOME}/bin"
    }

    stages {
        // Checkout the repository
        stage('Checkout') {
            steps {
                // Pull the code from the Git repository
                git url: 'https://github.com/username/flutter-app.git', credentialsId: 'your-credentials-id'
            }
        }

        // Install Flutter dependencies
        stage('Install Dependencies') {
            steps {
                script {
                    // Ensure that Flutter dependencies are properly installed
                    sh 'flutter doctor'
                    sh 'flutter pub get'
                }
            }
        }

        // Build the Flutter APK (for Android)
        stage('Build APK') {
            steps {
                script {
                    // Build the APK in release mode
                    sh 'flutter build apk --release'
                }
            }
        }

        // Archive the built APK file as a Jenkins artifact
        stage('Archive APK') {
            steps {
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/*.apk', allowEmptyArchive: true
            }
        }
    }

    post {
        // Clean up workspace after build
        always {
            cleanWs()
        }
    }
}
