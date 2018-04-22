### 问题

- koa 框架到底为我们做了什么
- 它的内部到底是什么样子
- 他向下一直到nodejs底层，到底是怎么处理事件循环的
- 一个异步的HTTP过程，到底是怎么进行的


### 特性

- 只提供封装好http上下文、请求、响应，以及基于async/await的中间件容器。
- 利用ES7的async/await的来处理传统回调嵌套问题和代替koa@1的generator，但是需要在node.js 7.x的harmony模式下才能支持async/await。
- 中间件只支持 async/await 封装的，如果要使用koa@1基于generator中间件，需要通过中间件koa-convert封装一下才能使用