# 理解 `promise_type`

## 协程初始挂起点（The initial-suspend point）

协程帧创建并初始化完成后，在返回的对象被获取之后，其执行的第一个语句就是 `co_await promise.initial_suspend();`。

`co_await promise.initial_suspend();` 表达式的执行结果会被 **丢弃**，所以此调用返回的 awaiter 对象的 `await_resume()` 成员函数的返回值类型应当是 `void`。

## 通过 `co_return` 从协程返回

如果协程执行到逻辑体最后也没有一条 `co_return` 语句，此时就相当于默认在逻辑体最后执行 `co_return;`。这种情况下，如果定义的 `promise_type` 本身没有定义 `return_void` 成员函数，那么**此时的执行就可能是未定义的**。

## 协程最终挂起点（The final-suspend point）

对一个在最终挂起点被挂起的协程来说，对其调用 `resume()` 本身会是一个未定义的行为。对于一个在此时被挂起的协程来说，唯一可以对其进行的操作，只能是 `destroy()`。

## 编译器选择适当的 `promise_type` 的原则

编译器通过 `coroutine_traits` 来选择合适的 `promise_type`。对于以下签名的协程：

```cpp
task<float> foot(std::string x, bool flag);
```

来说，编译器会将协程返回值类型、参数类型作为模板参数传递给 `corotine_traits` 来获取合适的 `promise_type`。所以其最终选择的类型如下：

```cpp
typename coroutine_traits<task<float>, std::string, bool>::promise_type;
```

对于非静态的成员协程来说，还需要把类型作为第二个模板参数传递。需要注意的是，对于使用了左值引用的成员协程，此时第二个模板参数也会是一个左值引用。

```cpp
task<void> my_class::method1(int x) const;
task<foo> my_class::method2() &&;
```

此时编译器会使用如下版本的 `promise_type`：

```cpp
// method1 promise type
typename coroutine_traits<task<void>, const my_class&, int>::promise_type;

// method2 promise type
typename coroutine_traits<task<foo>, my_class&&>::promise_type;
```

默认情况下，`coroutine_traits` 会查询返回值类型内是否定义了 `promise_type` 并将其作为最终的 `promise_type`，其可能实现如下：

```cpp
namespace std {
    template<typename RET, typename... ARGS>
    struct coroutine_traits<RET, ARGS...> {
        using promise_type = typename RET::promise_type;
    };
}
```

如果对于这里的返回值类型可以自行定义，那么就可以简单地在其内部指定相应的 `promise_type`：

```cpp
template<typename T>
struct task {
    using promise_type = task_promise<T>;
    ...
};
```

但如果不能自行定义，那么就可以尝试让 `coroutine_traits` 偏特化来实现定义指定：

```cpp
namespace std {
    template<typename T, typename... ARGS>
    struct coroutine_traits<std::optional<T>, ARGS...> {
        using promise_type = optional_promise<T>;
    };
}
```
