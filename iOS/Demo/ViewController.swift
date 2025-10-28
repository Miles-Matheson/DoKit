/**
 * Copyright 2017 Beijing DiDi Infinity Technology and Development Co., Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import DoKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化DoraemonKit - SPM版本
        // 在实际使用时，开发者可以通过Xcode的"Add Package Dependency"功能导入此库
        
        // 创建一个简单的标签来显示SPM导入成功
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 100))
        label.text = "DoraemonKit (SPM版本)"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .blue
        view.addSubview(label)
        
        let subtitleLabel = UILabel(frame: CGRect(x: 20, y: 150, width: view.frame.width - 40, height: 100))
        subtitleLabel.text = "可通过SPM方式导入此开发工具库"
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.textColor = .gray
        view.addSubview(subtitleLabel)
    }

}
