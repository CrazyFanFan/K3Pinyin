# K3Pinyin
translate chinese hanzi to pinyin by swift


##  Installation


### CocoaPods


To integrate K3Pinyin into your Xcode project using CocoaPods, specify it in your Podfile:

    platform :ios, '8.0'

    target 'TargetName' do
    use_frameworks!
    pod 'K3Pinyin', '~> 0.0.2'
    end

Then, run the following command:

    $ pod install

## Usage

### simple way

    // code
    let string = "中国"
    print(string.k3.pinyin)
    print(string.k3.pinyin(nil))
    string.k3.pinyin(nil) { (pinyin) in
        print(pinyin)
    }


    // result
    zhōngguó
    zhōngguó
    zhōngguó

### option

    print(string.k3.pinyin([.stripCombiningMarks,
                            .separator(""),
                            .onlyFirstCharacter,
                            .allFirstLetter,
                            .capitalized]))

    Z

## Issues

- Polyphone

## Author
crazy凡, [ccrazyfan@gmail.com](ccrazyfan@gmail.com)
## License
K3Pinyin is released under the MIT license. See [LICENSE](https://github.com/CrazyFanFan/K3Pinyin/blob/master/LICENSE) for details.
