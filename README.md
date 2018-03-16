# NSIvocation_Test

Demo中介绍NSInvocation的简单使用及使用场景


/**
 * 使用场景：用于替换performSelector:withObject:执行方法的调用。 后面称为P方法
 * performSelector:方法最多
 * 在P中，withObject参数只能是id对象类型。使用NSDictionary包装，也不能直接指定值类型的数据。（需要后期转换）
 * 使用NSIvocation 可以直接指定相应类型。 也可以进行一层封装
 *
 **/
