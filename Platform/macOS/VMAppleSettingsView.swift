//
// Copyright © 2021 osy. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import SwiftUI

@available(macOS 12, *)
struct VMAppleSettingsView: View {
    let vm: UTMVirtualMachine?
    @ObservedObject var config: UTMAppleConfiguration
    
    @State private var infoActive: Bool = true
    @State private var selectedDriveIndex: Int?
    
    var body: some View {
        NavigationLink(destination: VMConfigInfoView(config: config).scrollable(), isActive: $infoActive) {
            Label("Information", systemImage: "info.circle")
        }
        NavigationLink(destination: VMConfigAppleSystemView(config: config).scrollable()) {
            Label("System", systemImage: "cpu")
        }
    }
}

@available(macOS 12, *)
struct VMAppleSettingsView_Previews: PreviewProvider {
    @StateObject static var config = UTMAppleConfiguration()
    static var previews: some View {
        VMAppleSettingsView(vm: nil, config: config)
    }
}
