Swift 启程
**********

按照编程传统，使用一门新的编程语言编码的第一个程序往往应当是在屏幕上打印“Hello, world!”。那么对于 Swift 而言，仅需一行代码即可完成：

.. code-block:: swift
    :linenos:

    print("Hello, world!")
    // 打印“Hello, world!”

如果你曾编写过 C 或 Objective-C 的代码，那么这样的语法对你来说可能是很熟悉的。在 Swift 中，这样的一行代码就已经是一个完整的程序了。你甚至无需为此导入一个独立的库来支持类似于输入或输出、字符串处理的功能。写在全局范围内的代码被视为程序的执行起点，所以你也无需为此添加一个 ``main()`` 函数。甚至，你也无需在每行代码语句的末尾添加分号。

这场 Swift 之旅将向你展示如何完成各种各样的编程任务，并以此来为你提供开始用 Swift 编程的足够信息。不必担心你可能对某些内容不够理解，因为初程中介绍的每个内容，后续章节中都会有详细的解释说明。

.. hint::

    为了最佳的练习体验，可将本章内容作为一个 Playground 内容在 Xcode 中打开。Playground 可以让你编辑完代码就可以立即看到它们的运行结果。

    `下载 Playground <https://docs.swift.org/swift-book/GuidedTour/GuidedTour.playground.zip>`_

简单值
======

使用 ``let`` 关键字可以创造一个常量，而使用 ``var`` 关键字可以创造一个变量。编译阶段不必确定常量的具体值，但一定要你一次性地为它赋予一个确定值。也就是说，你可以用一个常量来作为你可以一次性确定又要在很多地方使用到的值。

.. code-block:: swift
    :linenos:

    var myVariable = 42
    myVariable = 50
    let myConstant = 42

无论是常量还是变量，其类型都必须要与为其赋予的值的类型一致。然而，你无需总是要显式地指定值的类型。当你创造一个常量或变量并对其进行赋值时，编译器就会自动按照所赋值的类型推导其类型。在上面的例子中，编译器推导出 ``myVariable`` 是整数类型，因为它的初始值就是一个整数。

当然，如果初始值无法提供足够的信息（或者甚至都没有初始值），可以在变量（常量）名之后指定其具体类型，中间用冒号 ``:`` 隔开。

.. code-block:: swift
    :linenos:

    let implicitInteger = 70
    let implicitDouble = 70.0
    let explicitDouble: Double = 70

.. note::

    创造一个常量，将其类型指定为 Float 并为其赋值为 4

值永远不会隐式转换为另一种类型。如果你需要将值转换为一个不同的类型，则需要显示地构造一个所需类型的实例。

.. code-block:: swift
    :linenos:

    let label = "The width is "
    let width = 94
    let widthLabel = label + String(width)

.. note::

    尝试从最后一行代码中移除掉 ``String`` 。看看这时编译器会向你提示什么错误？

其实，当字符串中包含一些值时，有一种更简单的写法：可以将目标值写在小括号（ ``(`` 和 ``)`` ）内，并且在左括号前加一个反斜杠（ ``\`` ）。举个例子：

.. code-block:: swift
    :linenos:

    let apples = 3
    let oranges = 5
    let appleSummary = "I have \(apples) apples."
    let fruitSummary = "I have \(apples + oranges) pieces of fruit."

.. note::

    使用 ``\()`` 来将一个浮点数算式放入一个字符串中，并且尝试将某个人的名字放到一句问候的字符串中。

可以使用三个双引号（ ``"""`` ）来界定那些可能占据多行文本的字符串。引号界定范围内的每行文本前的缩进都将被移除，直到它匹配到终止界定引号符。举个例子：

.. code-block:: swift
    :linenos:
    :force:

    let quotation = """
    I said "I have \(apples) apples."
    And then I said "I have \(apples + oranges) pieces of fruit."
    """

创建数组和字典这样的容器时，可以使用中括号（ ``[`` 和 ``]`` ），并且访问它们的元素时，只需要在中括号中填写要访问的下标或键值即可。（需要给定其字面值时，可以用元素列表的形式，元素间用逗号（ ``,`` ）分隔，）列表中最后一个元素的后面也可以跟填一个逗号。

.. code-block:: swift
    :linenos:

    var shoppingList = ["catfish", "water", "tulips"]
    shoppingList[1] = "bottle of water"

    var occupations = [
        "Malcolm": "Captain",
        "Kaylee": "Mechanic",
    ]
    occupations["Jayne"] = "Public Relations"

当你向数组中添加元素时，数组自然也会随之增长。

.. code-block:: swift
    :linenos:

    shoppingList.append("blue paint")
    print(shoppingList)

当需要创造一个空的数组或字典时，就需要使用初始化语句（注意需要填充指定元素类型）。

.. code-block:: swift
    :linenos:

    let emptyArray = [String]()
    let emptyDictionary = [String: Float]()

如果容器的类型信息可以被推导出来，那么你就可以用 ``[]`` 来表示一个空数组，用 ``[:]`` 来表示一个空字典。比如说，当你为一个（已经确定类型的）变量赋予新值或者传递参数给一个函数时，那这个新值、参数值就可以是这样的空数组、空字典。

.. code-block:: swift
    :linenos:

    shoppingList = []
    occupations = [:]

控制流
======

使用 ``if`` 和 ``switch`` 关键字来创建条件语句，使用 ``for-in`` ， ``repeat-while`` 关键字来创建循环语句。条件或循环变量两边的小括号是可选的，而控制语句逻辑内的主体则必须要用大括号来界定。

.. code-block:: swift
    :linenos:

    let individualScores = [75, 43, 103, 87, 12]
    var teamScore = 0
    for score in individualScores {
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }
    print(teamScore)
    // 打印 “11”

对于一个 ``if`` 语句，其条件语句必须是一个布尔类型的表达式，这也就是说对于类似 ``if score { ... }`` 这样的代码就是错误的，因为条件本身并不会（像 C 语言一样）是一个隐式判断是否为零的布尔表达式。

你可以使用 ``if`` 和 ``let`` 组合来应对那些值可能不存在的情况。这些值可能不存在的类型被称为可选值类型，可选值类型的变量或常量就是可选值。一个可选值要么确实拥有一个值，要么就只是一个 ``nil`` 来表示它的值的确不存在。在一个值的类型标识后使用问号符（ ``?`` ）来表示这个值是一个可选值。

.. code-block:: swift
    :linenos:

    var optionalString: String? = "Hello"
    print(optionalString == nil)
    // 打印 “false”

    var optionalName: String? = "John Appleseed"
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }

.. note::

    将 ``optionalName`` 的值改为 ``nil`` 。此时你得到的问候语句内容是什么？针对 ``optionalName`` 为 ``nil`` 的情况添加一个 ``else`` 语句来设定一个不同的问候（ ``greeting`` 变量）内容。

如果可选值是 ``nil`` ，那么条件语句的结果将会是 ``false`` ，继而大括号中的逻辑内容将会被跳过执行。否则，可选值就会被解包并且赋值给 ``let`` 关键字后面的常量，而这个常量就可以使得解包后的值可以在这段代码块中被使用了。

另一种处理可选值的方式是使用 ``??`` 操作符（ operator ，在 C 、 C++ 中常被译为运算符）来为其提供一个默认值。如果可选值的确缺失了，那么就将使用默认值来替换。

.. code-block:: swift
    :linenos:

    let nickName: String? = nil
    let fullName: String = "John Appleseed"
    let informalGreeting = "Hi \(nickName ?? fullName)"

你也可以用一种更简短的编码来解包一个值，这时可以对这个解包后的值使用相同的名字。

.. code-block:: swift
    :linenos:

    if let nickname {
        print("Hey, \(nickname)")
    }

switch 语句支持任意类型的数据以及更加广泛的比较操作，这些比较不只适用于整数型，且比较不止判断是否相等这一种。

.. code-block:: swift
    :linenos:

    let vegetable = "red pepper"
    switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("Everything tastes good in soup.")
    }

.. note::

    尝试移除上面的默认情况（ default case ），看看这时编译器会提示什么错误？

请留意 ``let`` 是如何被用于模式条件匹配情况时给常量赋值的。

当执行完一段 switch 语句的条件匹配逻辑时，程序执行流程将会从 switch 语句中退出。程序并不会（像 C 那样）在下一个条件匹配逻辑中继续执行，所以你也无需在每个条件匹配逻辑流程最后显示地指定退出。

你可以用一对标识符来表示一个键值对，并用这样的方式来迭代遍历一个字典中的所有元素。**字典是一个无序的集合（容器）**，所以遍历得到的也可能是一个按照随意的顺序排列的结果。

.. code-block:: swift
    :linenos:

    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibnoacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25],
    ]
    var largest = 0
    var kindLabel = ""
    for (_, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
            }
        }
    }
    print(largest)
    // 打印最大值 “25”

.. note::

    用一个变量名替换 ``_`` ，并且追踪哪种数列中的值是最大值。

使用 ``while`` 关键字来循环执行一段代码直到循环条件发生变化（不再满足继续循环的条件）。循环语句的循环条件可以在循环体后来给定，此时可以确保这个循环体至少执行了一次。

.. code-block:: swift
    :linenos:

    var n = 2
    while n < 100 {
        n *= 2
    }
    print(n)
    // 打印 “128”

    var m = 2
    repeat {
        m *= 2
    } while m < 100
    print(m)
    // 打印 “128”

你也可以用 ``..<`` 来为下标创建一个区间。

.. code-block:: swift
    :linenos:

    var total = 0
    for i in 0..<4 {
        total += i
    }
    print(total)

使用 ``..<`` 可以创建一个不包括右界（区间最大值）的区间（左闭右开区间），也可以使用 ``...`` 来创建一个包含左右界的区间（闭区间）。

函数与闭包
==========

使用 ``func`` 关键字来声明一个函数，而调用这个函数的时候只需要函数名字后跟小括号和参数列表即可。声明函数时，使用 ``->`` 来分隔函数的参数列表（由参数名字和参数类型组成）和函数的返回值。

.. code-block:: swift
    :linenos:

    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    greet(person: "Bob", day: "Tuesday")

.. note::

    移除掉函数参数 ``day`` ，添加一个参数来将今天的特价午餐置入问候句中。

默认情况下，函数外部使用其参数名称作为其调用时的参数标签。你也可以为参数单独添加一个调用时使用的参数标签，或者使用 ``_`` 来表示调用时不需要填写参数标签。

.. code-block:: swift
    :linenos:

    func greet(_ person: String, on day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    greet("John", on: "Wednesday")

使用元组来创建一个组合值。比如一些函数就希望返回多种类型的组合值，访问这样的组合值时，既可以用它们的字段名来访问，也可以用它们按序出现的下标来访问（下标从 0 开始）。

.. code-block:: swift
    :linenos:

    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0

        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }

        return (min, max, sum)
    }
    let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
    print(statistics.sum)
    // 打印“120”
    print(statistics.2)
    // 打印“120”

函数是可以被嵌套定义的，嵌套的函数可以访问外层函数体的变量。你可以使用嵌套函数来整理代码更多或逻辑更复杂的函数。

.. code-block:: swift
    :linenos:

    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    returnFifteen()

在 Swift 中，函数是第一类型[^1]，这也就意味着函数本身也是可以作为函数返回值的。

.. code-block:: swift
    :linenos:

    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    var increment = makeIncrementer()
    increment(7)

同理，一个函数也可以作为另一个函数的参数。

.. code-block:: swift
    :linenos:

    func hasAnyMaches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    var numbers = [20, 19, 7, 12]
    hasAnyMaches(list: numbers, condition: lessThanTen)

实际上，在 Swift 中，函数是一种特殊的闭包（ closure ），而闭包指的就是可以稍后被调用的一段代码。当闭包被定义时，闭包内的代码是可以访问此闭包所在范围内的其他变量的，尽管这个闭包实际执行时可能已经不再属于这个范围内。当然，前面关于嵌套函数的示例代码已经证明了这一点。更简便地，你也可以直接用大括号（ ``{}`` ）来界定一段代码从而定义一个匿名闭包。使用 ``in`` 关键字来分隔闭包声明和闭包实现逻辑代码。

.. code-block:: swift
    :linenos:

    numbers.map({ (number: Int) -> Int in
        let result = 3 * number
        return result
    })

.. note::

    重写这个闭包来实现传入奇数时返回零。

其实，很多场景下你还可以让这个闭包的定义更加精简。比如对于一个代理的回调闭包，此时的闭包类型（传入参数类型、返回值类型）都可以确定，那么此时就可以进一步省略它的参数类型声明或返回值类型声明。如果闭包中只包含一行语句，那么闭包就将返回这行语句的值，并认为这行语句值的类型就是闭包的返回值类型。

.. code-block:: swift
    :linenos:

    let mappedNumbers = numbers.map({ number in 3 * number })
    print(mappedNumbers)

进一步地，你还可以使用标号来访问传入参数来取代使用其名字访问，这样一来，对于简短的闭包来说这将格外适用。当闭包作为一个函数的最后一个参数时，它就可以直接跟在函数调用的小括号后面。当这个闭包同时是这个函数的唯一参数时，你甚至可以省略掉函数调用的小括号。

.. code-block:: swift
    :linenos:

    let sortedNumbers = numbers.sorted { $0 > $1 }
    print(sortedNumbers)
    // 打印“[20, 19, 12, 7]”

对象与类
========

使用 ``class`` 关键字后跟一个类名标识符来创建一个类。类中定义字段的方式和以前定义常量、变量的方式一致，区别就是此时定义的字段的上下文是类空间。同理，函数方法的声明也与之前一致。

.. code-block:: swift
    :linenos:

    class Shape {
        var numberOfSides = 0
        func simpleDescription() -> String {
            return "A shape with \(numberOfSides) sides."
        }
    }

.. note::

    使用 ``let`` 关键字创建一个常量字段，并且添加另一个需要传入一个参数的函数方法。

使用类名后跟小括号的方式就可以构造一个属于此类的对象。使用圆点符号来访问这个对象的指定字段或调用这个对象的指定方法。

.. code-block:: swift
    :linenos:

    var shape = Shape()
    shape.numberOfSides = 7
    var shapeDescription = shape.simpleDescription()

这样定义的 ``Shape`` 类是缺少了很重要的一部分内容的，这部分内容就是就是类的初始化构造器（构造函数），构造器用于定义创建对象时初始化的一些逻辑。使用 ``init`` 关键字来定义构造函数。

.. code-block:: swift
    :linenos:

    class NamedShape {
        var numberOfSides = 0
        var name: String

        init(name: String) {
            self.name = name
        }

        func simpleDescription() -> String {
            return "A shape with \(numberOfSides) sides."
        }
    }

请注意，在构造函数中使用 ``self`` 来区分哪个 name 是传入参数，哪个 name 是类的字段。当你创建一个类的对象时，相应参数就和函数参数一样传递给构造函数。无论是在声明时（就像 ``numberOfSides`` ），还是在构造函数中（就像 ``name`` ），每个字段都需要被赋值。

如果在对象被销毁前你需要执行一些必要的清理逻辑，你可以用 ``deinit`` 关键字来创建一个析构函数。

子类可以在定义时通过分号后跟父类名字来实现继承。对于类来说没有必须要严格继承的根类型，所以你可以按需继承或省略一个父类。

在子类中覆写父类的方法需要用 ``override`` 关键字来标识，如果你没有使用 ``override`` 却又覆写了父类的方法实现，那么此时编译器就会认为这是个错误。当然，如果你用了 ``override`` 来标识，编译器却发现你并未覆写任何父类方法实现，编译器也会认为这是个错误。

.. code-block:: swift
    :linenos:

    class Square: NamedShape {
        var sideLength: Double

        init(sideLength: Double, name: String) {
            self.sideLength = sideLength
            super.init(name: name)
            numberOfSides = 4
        }

        func area() -> Double {
            return sideLength * sideLength
        }

        override func simpleDescription() -> String {
            return "A square with sides of length \(sideLength)."
        }
    }
    let test = Square(sideLength: 5.2, name: "my test square")
    test.area()
    test.simpleDescription()

.. note::

    创建一个名为 ``Circle`` 的 ``NamedShape`` 的子类，这个子类需要一个半径值和名字作为它构造时所需的参数。请为这个 ``Circle`` 类实现它的 ``area()`` 和 ``simpleDescription()`` 函数方法。

属性字段除了用于简单的存储，还可以为他们设定 get 方法和 set 方法。

.. code-block:: swift
    :linenos:

    class EquilateralTriangle: NamedShape {
        var sideLength: Double = 0.0

        init(sideLength: Double, name: String) {
            self.sideLength = sideLength
            super.init(name: name)
            numberOfSides = 3
        }

        var perimeter: Double {
            get {
                return 3.0 * sideLength
            }
            set {
                sideLength = newValue / 3.0
            }
        }

        override func simpleDescription() -> String {
            return "An equilateral triangle with sides of length \(sideLength)."
        }
    }
    var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
    print(triangle.perimeter)
    // 打印“9.3”
    triangle.perimeter = 9.9
    print(triangle.sideLength)
    // 打印“3.3000000000000003”

在 ``perimeter`` 的 set 方法中，新值有一个隐式的名字： ``newValue`` 。你也可以在 ``set`` 后面在小括号中设定一个指定的名字。

请注意， ``EquilateralTriangle`` 类的构造函数有三个步骤：

 1. 为子类中声明的字段赋值
 2. 调用父类的构造函数
 3. 修改父类定义的字段值。任何其余的函数方法、 get 函数或 set 函数也都会在这个准备阶段完成准备。

如果你无需计算属性值却又需要在更新一个字段值前后做一些逻辑，那么你就可以使用 ``willSet`` 和 ``didSet`` 关键字。这部分逻辑代码将会在除构造函数之外，任何修改指定变量的时候被执行。举例来说，下面这个类中的 triangle 的长度将会一直和它的 square 的长度保持一致。

.. code-block:: swift
    :linenos:

    class TriangleAndSquare {
        var triangle: EquilateralTriangle {
            willSet {
                square.sideLength = newValue.sideLength
            }
        }
        var square: Square {
            willSet {
                triangle.sideLength = newValue.sideLength
            }
        }
        init(size: Double, name: String) {
            square = Square(sideLength: size, name: name)
            triangle = EquilateralTriangle(sideLength: size, name: name)
        }
    }
    var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
    print(triangleAndSquare.square.sideLength)
    // 打印“10.0”
    print(triangleAndSquare.triangle.sideLength)
    // 打印“10.0”
    triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
    print(triangleAndSquare.triangle.sideLength)
    // 打印“50.0”

当处理可选值时，你可以在调用函数方法、访问字段属性和下标访问这类操作前加 ``?``。如果 ``?`` 之前的值是一个 ``nil`` ，那么 ``?`` 之后的任何内容都将会被忽略并且整个表达式将返回一个 ``nil`` 。否则，这个可选值就将被正常解包，并且 ``?`` 之后的内容都可以正常执行解包后的值的指定逻辑。这两种情况下，表达式返回值类型都是可选值类型。

.. code-block:: swift
    :linenos:

    let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
    let sideLength = optionalSquare?.sideLength

枚举与结构体
============

使用 ``enum`` 关键字来创建枚举类。与类和其他命名类型一样，枚举值也有它们自己的函数方法。

.. code-block:: swift
    :linenos:

    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king

        func simpleDescription() -> String {
            switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    let ace = Rank.ace
    let aceRawValue = ace.rawValue

.. note::

    定义一个函数来实现通过 ``Rank`` 类的原始值来对其枚举值进行比较。

默认情况下，Swift 会为枚举值从零开始赋值给其原始值，逐个递增 1 。但你也可以改变这种默认的行为通过显式指定枚举值的具体原始值。比如上面的示例代码， ``Ace`` 就被显式指定原始值为 1 ，然后接下来每个枚举值的原始值都按序递增 1 。你也可以用字符串或浮点数来作为一个枚举值的原始值。使用 ``rawValue`` 来访问一个枚举值的原始值。

使用 ``init?(rawValue:)`` 这样的构造函数获取一个通过原始值构造的枚举值。如果原始值正确匹配了相应的枚举值，它就会返回相应的枚举值，否则将会返回一个 ``nil`` 。

.. code-block:: swift
    :linenos:

    if let convertedRank = Rank(rawValue: 3) {
        // let threeDescription = convertedRank.simpleDescription()
        let _ = convertedRank.simpleDescription()
    }

枚举值就是一个实际的值，而不是他们原始值的另一种写法。实际上，为了避免枚举值可能难以确定一个有意义的原始值的情况，你甚至无需指定或使用它们的原始值。

.. code-block:: swift
    :linenos:

    enum Suit {
        case spades, hearts, diamonds, clubs

        func simpleDescription() -> String {
            switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
            }
        }
    }
    let hearts = Suit.hearts
    let heartsDescription = hearts.simpleDescription()

.. note::

    为 ``Suit`` 枚举类定义一个 ``color()`` 函数方法，当枚举值为黑桃、梅花时返回 ``"black"`` ，当枚举值为红心和方块时返回 ``"red"`` 。

请注意示例代码中，指定 ``hearts`` 枚举值时有用到两种写法。当赋值给 ``hearts`` 常量时，枚举值使用了完整的 ``Suit.hearts``，这是因为这个常量在赋值前对于枚举值的类型一无所知。而在 switch 语句中，可以通过一种简短的 ``hearts`` 来指定相应枚举值，这是因为此时的 ``self`` 的类型已经确定是一个 ``Suit`` 枚举类型了。你可以在任意已知变量类型为枚举类的情况下使用相应的简短模式来确定相应的枚举值。

如果枚举类拥有原始值，那么这些原始值就被认为是相应枚举类定义内容的一部分，这也就意味着两个不同的枚举值实例有着相同的原始值。而枚举值可以拥有另一种属性值类型——绑定值。这些绑定值只有在创建了具体的枚举值实例时才被确定下来。你可以认为绑定值就像是枚举值实例的存储字段。举例来说，有一种场景需要向服务器请求获取日出、日落的时间。那么对于服务器的响应内容来说，要么返回相应的日出、日落时间信息，要么返回请求失败并附带相应的错误原因。

.. code-block:: swift
    :linenos:

    enum ServerResponse {
        case result(String, String)
        case failure(String)
        // EXPERIMENT:
        //   Add a third case to `ServerResponse` and to the switch.
        case offline(Void)
    }

    let success = ServerResponse.result("6:00 am", "8:09 pm")
    let failure = ServerResponse.failure("Out of cheese.")

    switch success {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
    case let .failure(message):
        print("Failure... \(message)")
    }
    // 打印 "Sunrise is at 6:00 am and sunset is at 8:09 pm."

.. note::

    为 ``ServerResponse`` 枚举类添加第三种枚举值，并完善示例代码中的 switch 语句。

请留意 switch 语句中，日出、日落时间是如何从 ``ServerResponse`` 类型的枚举值中提取出来的。

使用 ``struct`` 关键字来创建一个结构体。结构体支持和类相同的诸多行为，比如函数方法和构造函数。二者最大的区别就是，结构体在传递给新的值时需要完整拷贝，是值传递，而类传递给新的值时只是传递一个引用，是引用传递。

.. code-block:: swift
    :linenos:

    struct Card {
        var rank: Rank
        var suit: Suit
        func simpleDescription() -> String {
            return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
        }
    }
    let threeOfSpades = Card(rank: .three, suit: .spades)
    let threeOfSpadesDescription = threeOfSpades.simpleDescription()

.. note::

    创建一个可以返回一整副包含所有牌面值和花色组合的牌的函数方法。

并发
====

使用 ``async`` 来标识一个函数运行时异步执行。

.. code-block:: swift
    :linenos:

    func fetchUserID(from server: String) async -> Int {
        if server == "primary" {
            return 97
        }
        return 501
    }

按照异步方式调用一个异步函数时需要在其前方填写 ``await`` 。

.. code-block:: swift
    :linenos:

    func fetchUsername(from server: String) async -> String {
        let userID = await fetchUserID(from: server)
        if userID == 501 {
            return "John Appleseed"
        }
        return "guest"
    }

使用 ``async let`` 来调用一个异步函数，这样可以使得它与其他异步代码并发执行。当你需要使用它的返回值时，就填写 ``await`` 。

.. code-block:: swift
    :linenos:

    func connectUser(to server: String) async {
        async let userID = fetchUserID(from: server)
        async let username = fetchUsername(from: server)
        let greeting = await "Hello \(username), user ID `(userID)"
        print(greeting)
    }

使用 ``Task`` 来调用由异步代码定义且无需等待返回值的异步函数。

.. code-block:: swift
    :linenos:

    Task {
        await connectUser(to: "primary")
    }
    // 打印 "Hello Guest, user ID 97"

协议与拓展
==========

使用 ``protocol`` 关键字来定义一个协议。

.. code-block:: swift
    :linenos:

    protocol ExampleProtocol {
        var simpleDescription: String { get }
        mutating func adjust()
    }

类、枚举类以及结构体都可以遵循协议。

.. code-block:: swift
    :linenos:

    class SimpleClass: ExampleProtocol {
        var simpleDescription: String = "A very simple class."
        var anathorProperty: Int = 69105
        func adjust() {
            simpleDescription += " Now 100% adjusted."
        }
    }
    var a = SimpleClass()
    a.adjust()
    let aDescription = a.simpleDescription

    struct SimpleStructure: ExampleProtocol {
        var simpleDescription: String = "A simple structure"
        mutating func adjust() {
            simpleDescription += " (adjusted)"
        }
    }
    var b = SimpleStructure()
    b.adjust()
    let bDescription = b.simpleDescription

.. note::

    为 ``ExampleProtocol`` 添加另一个必要内容。那么你需要如何修改来确保 ``SimpleClass`` 和 ``SimpleStructure`` 依然遵守这一协议？

注意在 ``SimpleStructure`` 的声明中使用 ``mutating`` 关键字来标识一个可能改变自身属性字段值的函数方法。而 ``SimpleClass`` 无需对其方法做类似的标记，是因为类的函数方法修改的总是自身的属性字段。

使用 ``extention`` 来为一个已存在的类型添加拓展功能，比如新的函数方法或计算属性。你可以使用拓展来确保其他地方定义的类、或是你导入的库或框架中所含的类能够遵循指定的协议。

.. code-block:: swift
    :linenos:

    extension Int: ExampleProtocol {
        var simpleDescription: String {
            return "The number \(self)"
        }
        mutating func adjust() {
            self += 42
        }
    }
    print(7.simpleDescription)
    // 打印 "The number 7"

.. note::

    使用拓展来为 ``Double`` 类添加一个 ``absoluteValue`` （绝对值）属性字段。

你可以像其他命名类型一样使用协议的名字，比如说你可以创建一个遵循相同协议的集合，尽管集合中元素的具体类型可能不尽相同。当你使用一个类型为协议的值时，那么不是由协议声明的函数方法将不再可用。

.. code-block:: swift
    :linenos:

    let protocolValue: ExampleProtocol = a
    print(protocolValue.simpleDescription)
    // 打印"A very simple class.  Now 100% adjusted."
    // print(protocolValue.anotherProperty)  // 移除注释符，看看编译器会提示什么错误？

尽管 ``protocolValue`` 的运行时类型为 ``SimpleClass`` ，但编译器仍将其视为给定的 ``ExampleProtocol`` 类型。这也就表明你不能错误地访问那些由类额外定义而非其类所遵从的协议声明的函数方法或属性字段。

错误处理
========

你可以使用遵从 ``Error`` 协议的类型来表示错误。

.. code-block:: swift
    :linenos:

    enum PrinterError: Error {
        case outOfPaper
        case noToner
        case onFire
    }

使用 ``throw`` 来抛出一个错误并用 ``throws`` 来标识一个可能抛出错误的函数。如果你在一个函数中抛出了错误，那么这个函数会立即返回并执行能够处理相应错误的代码逻辑。

.. code-block:: swift
    :linenos:

    func send(job: Int, toPrinter printerName: String) throws -> String {
        if printerName == "Never Has Toner" {
            throw PrinterError.noToner
        }
        return "Job sent"
    }

有几种方式来处理错误。一种方式是使用 ``do-catch`` 。在 ``do`` 的代码块中，你可以在那些可能抛出错误的代码前标记 ``try`` 。而在 ``catch`` 代码块中，被抛出的错误就会被自动命名为 ``error`` ，你也可以为它赋予另一个不同的名字。

.. code-block:: swift
    :linenos:

    do {
        let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
        print(printerResponse)
    } catch {
        print(error)
    }
    // 打印 "Job sent"

.. note::

    将打印机的名字修改为 "Never Has Toner" (从来没有碳粉)，以此来保证 ``send(job: toPrinter:)`` 函数会抛出一个错误。

你也可以提供多种 ``catch`` 块来处理具体的错误类型。你可以在 ``catch`` 后面添加匹配条件，模式和 switch 语句中 ``case`` 后面的匹配条件类似。

.. code-block:: swift
    :linenos:

    do {
        let printerResponse = try send(job: 1040, toPrinter: "Gutenberg")
        print(printerResponse)
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).")
    } catch {
        print(error)
    }
    // 打印 "Job sent"

.. note::

    补充代码以使得 ``do`` 代码块中会抛出异常。那么你需要抛出什么类型的错误才能使得错误被第一个 ``catch`` 块处理？那为了被第二个、第三个代码块处理，又该如何呢？

另一种处理错误的方式是使用 ``try?`` 来将结果转换为一个可选值。如果函数内抛出了错误，那么这个错误就直接被丢弃并且外层得到的结果就是一个 ``nil`` 。否则，结果就是拥有函数返回值的可选值。

.. code-block:: swift
    :linenos:

    let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
    let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

使用 ``defer`` 来定义那些在函数返回前务必执行的代码。这些代码即使是函数内抛出了错误也会被执行到。你可以使用 ``defer`` 来将函数中初始执行代码和结束时执行代码相邻放置，尽管他们实际上需要在不同时机来执行。

.. code-block:: swift
    :linenos:

    var fridgeIsOpen = false
    let fridgeContent = ["milk", "eggs", "leftovers"]

    func fridgeContains(_ food: String) -> Bool {
        fridgeIsOpen = true
        defer {
            fridgeIsOpen = false
        }

        let result = fridgeContent.contains(food)
        return result
    }
    fridgeContains("banana")
    print(fridgeIsOpen)
    // 打印 "false"

泛型
====

在尖角括号中添加名字来创建一个泛型函数或类型。

.. code-block:: swift
    :linenos:

    func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }
    makeArray(repeating: "knock", numberOfTimes: 4)

你可以创建泛型类型的函数、方法、类、枚举类以及结构体。

.. code-block:: swift
    :linenos:

    // 对 Swift 标准库中的可选值类型进行重新定义实现
    enum OptionalValue<Wrapped> {
        case none
        case some(Wrapped)
    }
    var possibleInteger: OptionalValue<Int> = .none
    possibleInteger = .some(100)

在函数体前用 ``where`` 来指定泛型需要满足的条件。比如，需要这个类型实现了具体的一个协议，需要两个类型彼此相同，或者是需要这个类型拥有特定的父类。

.. code-block:: swift
    :linenos:

    func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
        where T.Element: Equatable, T.Element == U.Element
    {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
    }
    anyCommonElements([1, 2, 3], [3])

.. note::

    修改 ``anyCommonElements(_: _:)`` 函数来实现一个返回一个数组的函数，这个数组包含了任意两个输入数组的所有共有元素。

``<T: Equatable>`` 与 ``<T> .. where T: Equatable`` 这两种写法效果是相同的。
