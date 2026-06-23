package com.amilate

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform
