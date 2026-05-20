package com.amilate.utils

object FormValidator {

    fun isValidEmail(email: String): Boolean {
        val regex = Regex("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        return email.isNotBlank() && regex.matches(email.trim())
    }

    // Min 8 caratteri, almeno 1 maiuscola, 1 numero, 1 carattere speciale
    fun isValidPassword(password: String): Boolean {
        val regex = Regex("^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*()_+\\-=]).{8,}$")
        return regex.matches(password)
    }

    fun validatePasswordStrength(password: String): PasswordStrength {
        return when {
            password.length < 6 -> PasswordStrength.WEAK
            password.length < 8 || !password.any { it.isUpperCase() } -> PasswordStrength.MEDIUM
            isValidPassword(password) -> PasswordStrength.STRONG
            else -> PasswordStrength.MEDIUM
        }
    }

    // Ammette lettere, spazi, apostrofi e trattini (es. "Maria-Grazia", "D'Angelo")
    fun isValidName(name: String): Boolean {
        val regex = Regex("^[A-Za-zÀ-ÖØ-öø-ÿ' -]{2,50}$")
        return name.isNotBlank() && regex.matches(name.trim())
    }

    fun isValidTaxId(cf: String): Boolean {
        val regex = Regex("^[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]$")
        return regex.matches(cf.trim().uppercase())
    }

    fun isValidVatNumber(piva: String): Boolean {
        val clean = piva.trim().removePrefix("IT")
        if (!Regex("^[0-9]{11}$").matches(clean)) return false
        // Algoritmo di controllo Luhn-like per P.IVA italiana
        val digits = clean.map { it.digitToInt() }
        var sum = 0
        for (i in 0 until 10) {
            val d = if (i % 2 == 0) digits[i] else (digits[i] * 2).let { if (it > 9) it - 9 else it }
            sum += d
        }
        return (10 - (sum % 10)) % 10 == digits[10]
    }

    fun isValidBirthDate(date: String): Boolean {
        val regex = Regex("^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/([0-9]{4})$")
        if (!regex.matches(date.trim())) return false
        val parts = date.split("/")
        val day = parts[0].toInt()
        val month = parts[1].toInt()
        val year = parts[2].toInt()
        // Età tra 0 e 120 anni (rudimentale, senza dipendenze da kotlinx-datetime)
        if (year < 1900 || year > 2100) return false
        val daysInMonth = when (month) {
            2 -> if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) 29 else 28
            4, 6, 9, 11 -> 30
            else -> 31
        }
        return day <= daysInMonth
    }

    fun isAdult(date: String, minAge: Int = 18): Boolean {
        if (!isValidBirthDate(date)) return false
        val parts = date.split("/")
        val birthYear = parts[2].toInt()
        val birthMonth = parts[1].toInt()
        val birthDay = parts[0].toInt()
        val currentYear = 2026
        val age = currentYear - birthYear -
                if (birthMonth * 100 + birthDay > 517) 1 else 0
        return age >= minAge
    }

}

enum class PasswordStrength { WEAK, MEDIUM, STRONG }