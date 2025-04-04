pipeline {
    agent any

    environment {
        FLUTTER_HOME = "/opt/flutter"
        PATH = "${FLUTTER_HOME}/bin:${env.PATH}"
        JAVA_HOME = "/usr/lib/jvm/java-11-openjdk-amd64" // Ensure Java is available
        MY_ENV_VAR = "Custom Value for Flutter Build"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    def gitRepoUrl = 'https://github.com/sayali2004/meal_app.git'
                    checkout([$class: 'GitSCM', 
                        branches: [[name: '*/main']], // Change if repo uses 'master'
                        userRemoteConfigs: [[url: gitRepoUrl]],
                        extensions: [[$class: 'CleanBeforeCheckout']]
                    ])
                }
            }
        }

        stage('Flutter Version Check') {
            steps {
                sh '''
                echo "🔍 Checking Flutter version..."
                flutter --version || { echo "❌ Flutter not found!"; exit 1; }
                '''
            }
        }

        stage('Get Dependencies') {
            steps {
                sh '''
                echo "📦 Getting Flutter dependencies..."
                flutter pub get || { echo "❌ Failed to get dependencies!"; exit 1; }
                '''
            }
        }

        stage('Analyze Code') {
            steps {
                sh '''
                echo "🧐 Running Flutter analyze..."
                flutter analyze || { echo "❌ Code analysis failed!"; exit 1; }
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                echo "🧪 Running Flutter tests..."
                flutter test || { echo "❌ Tests failed!"; exit 1; }
                '''
            }
        }

        stage('Build APK') {
            steps {
                sh '''
                echo "📦 Building Flutter APK..."
                flutter build apk --release || { echo "❌ APK build failed!"; exit 1; }
                '''
            }
        }

        stage('Deploy / Output') {
            steps {
                sh '''
                echo "🚀 Build complete! Checking output..."
                echo "ENV VAR: $MY_ENV_VAR"
                ls -lah build/app/outputs/flutter-apk/ || { echo "❌ APK output not found!"; exit 1; }
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
