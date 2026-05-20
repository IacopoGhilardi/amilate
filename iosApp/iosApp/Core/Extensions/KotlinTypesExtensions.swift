//
//  KotlinTypesExtensions.swift
//  iosApp
//
//  Created by Iacopo Ghilardi on 29/03/2026.
//

import Shared
import Foundation

extension KotlinBoolean {
    var asBool: Bool {
        return self.boolValue
    }
}

extension KotlinInt {
    var asInt: Int {
        return self.intValue
    }
}

extension KotlinDouble {
    var asDouble: Double {
        return self.doubleValue
    }
}

extension KotlinFloat {
    var asFloat: Float {
        return self.floatValue
    }
}

extension KotlinLong {
    var asInt64: Int64 {
        return self.int64Value
    }
}
