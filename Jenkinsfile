node {
	stage 'Checkout'
		checkout scm

	stage 'Build'
		bat 'nuget restore RoboBlather.sln'
		bat "\"${tool 'MSBuild'}\" RoboBlather.sln /p:Configuration=Release /p:Platform=\"Any CPU\" /p:ProductVersion=1.0.0.${env.BUILD_NUMBER}"

	stage 'Archive'
		archive 'RoboBlather/bin/Release/**'

}