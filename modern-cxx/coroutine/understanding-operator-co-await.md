# 理解 `co_await` 运算符

## 编译器与库的交互

The facilities the C++ Coroutines TS provides in the language can be thought of as a *low-\
level assembly-language* for coroutines. These facilities can be difficult to use directly in \
a safe way and are mainly intended to be used by library-writers to build higher-level \
abstractions that application developers can work with safely.

The **Promise** interface specifies methods for customising the behaviour of the coroutine \
itself. The library-writer is able to customise what happens when the coroutine is called, \
what happens when the coroutine returns (either by normal means or via an unhandled exception) \
and customise the behaviour of any `co_await` or `co_yield` expression within the \
coroutine.

The **Awaitable** interface specifies methods that control the semantics of a `co_await` \
expression. When a value is `co_await`-ed, the code is translated into a series of calls to \
methods on the awaitable object that allow it to specify: whether to suspend the current \
coroutine, execute some logic after it has suspended to schedule the coroutine for later \
resumption, and execute some logic after the coroutine resumes to produce the result of the \
`co_await` expression.

## 辨析 Awaiters & Awaitables

A type that supports the `co_await` operator is called an **Awaitable** type.



