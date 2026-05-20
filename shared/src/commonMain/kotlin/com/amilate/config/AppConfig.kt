package com.amilate.config

object AppConfig {
    const val API_BASE_URL = "https://dev.api.amilate.com"
    const val ENV = "dev"
    const val APP_NAME = "Amilate"

    val isDev: Boolean get() = ENV == "dev"
    val isStaging: Boolean get() = ENV == "staging"
    val isProd: Boolean get() = ENV == "production"
}