pipeline {
    agent any

    environment {
        FLUTTER_HOME = "/opt/flutter"
        ANDROID_HOME = "${HOME}/android-sdk"
        PATH = "${FLUTTER_HOME}/bin:${ANDROID_HOME}/cmdline-tools/latest/bin:${env.PATH}"
        JAVA_HOME = "/usr/lib/jvm/java-17-openjdk-amd64"
        MY_ENV_VAR = "Custom Value for Flutter Build"
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    def gitRepoUrl = 'https://github.com/sayali2004/meal_app.git'
                    checkout([$class: 'GitSCM',
                        branches: [[name: '*/main']],
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

        stage('Install Android SDK Command Line Tools') {
            steps {
                sh '''
                echo "🛠️ Checking for sdkmanager..."
                if ! command -v sdkmanager > /dev/null; then
                    echo "📦 Installing Android Command Line Tools..."
                    mkdir -p ${ANDROID_HOME}/cmdline-tools
                    cd ${ANDROID_HOME}/cmdline-tools
                    wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O tools.zip
                    unzip -q tools.zip -d latest
                    rm tools.zip
                    echo "✅ Android Command Line Tools installed."
                else
                    echo "✅ sdkmanager already available."
                fi
                '''
            }
        }

        stage('Accept Android Licenses') {
            steps {
                sh '''
                echo "📄 Accepting Android SDK Licenses..."
                yes | sdkmanager --licenses || { echo "❌ Failed to accept licenses!"; exit 1; }
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
