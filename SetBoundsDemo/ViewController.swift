//
//  ViewController.swift
//  SetBoundsDemo
//
//  Created by VEG on 2020/4/14.
//  Copyright © 2020 VEG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.menuView.bounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 65)
        
        print("framerwork:\(CPSMacro.formateString("  1213232 3213"))")
        
        // 八大排序 冒泡 选择 插入 希尔 堆 归并 快速 基
        // 基础算法--冒泡排序
//        var arr:Array = [1,3,5,7,9,2,4,6,8,10]
//        var arr1:Array = [1,2,3,4,5,6,7,8,9,10]
//        var arr:Array = arr1.reversed()
//        print("排序前：\(arr)")
        var index = 0
        var flag = true
        // 从左往右冒
//        for i in 0..<arr.count {
//            if flag {
//                flag = false
//                for j in 0..<arr.count - i - 1 {
//                    index += 1
//                    if(arr[j] > arr[j+1]) {
//                        let temp = arr[j]
//                        arr[j] = arr[j+1]
//                        arr[j+1] = temp
//                        flag = true
//                    }
//                }
//            }
//        }
        
        // 从右往左冒
//        for i in 0..<arr.count {
//            if flag {
//                flag = false
//                for j in (i..<(arr.count - 1)).reversed() {
//                    index += 1
//                    if(arr[j] > arr[j+1]) {
//                        let temp = arr[j]
//                        arr[j] = arr[j+1]
//                        arr[j+1] = temp
//                        flag = true
//                    }
//                }
//            }
//        }
        
        // 选择排序
//        var min:Int  = 0
//        for i:Int in 0..<arr.count {
//            min = i
//            for j:Int in i+1..<arr.count {
//                index += 1
//                if arr[i] > arr[j] {
//                    min=j
//                }
//            }
//            if min != i {
//                let temp = arr[i]
//                arr[i] = arr[min]
//                arr[min] = temp
//            }
//        }
        
        // 直接插入排序
//        for i in 1 ..< arr.count {
//            var j = i
//            //let key = arr[i]
//            while j-1 >= 0 && arr[j-1] > arr[j]   {
//                // 往前塞 后面得j+1=key 交换类似于冒泡了
//                //arr[j+1] = arr[j]
//                swap(x: j, y: j-1, array: &arr)
//                j -= 1
//            }
//            //arr[j+1] = key
//            print("排序中：\(arr)")
//        }
        
        // 希尔排序 https://www.liankexing.com/notetwo/11618 清楚明确
//        var increment = arr.count/2
//        while increment>0 {
//            for i in increment..<arr.count {
//                var j = i
//                while j-increment >= 0 && arr[j] < arr[j-increment] {
//                    let temp = arr[j]
//                    arr[j] = arr[j-increment]
//                    arr[j-increment] = temp
//                    j -= increment
//                    print("排序中：\(arr) increment\(increment) j\(j)")
//                }
//            }
//            //print("排序中：\(arr)")
//            increment -= 2
//        }
        
        // 堆排序 https://www.cnblogs.com/chengxiao/p/6129630.html
//        buildMaxHeap(arr: &arr)
//        print("大顶堆：\(arr)")
//        for i in (0..<arr.count).reversed() {
//            arr.swapAt(i, 0)
//            print("排序中：\(arr)")
//            heapify(array: &arr, nodeIndex: 0, len: i)
//        }
        
        // 归并排序
//        var temp_arr: Array<Array<Int>> = []
//        for item in arr {
//            temp_arr.append([item])
//        }
//        while temp_arr.count != 1 {
//            var i = 0
//            while i < temp_arr.count - 1 {
//                temp_arr[i] = mergeArray(arr_f: temp_arr[i], arr_s: temp_arr[i+1])
//                temp_arr.remove(at: i + 1)
//                i += 1
//                print("排序中：\(temp_arr)")
//            }
//        }
//        print("归并排序后：\(temp_arr) index:\(index)")
        
        // 快速排序 9
//        var arr:Array = [5,2,9,7,1,3,8,6,4,10]
//        quickSort(arr: &arr, left: 0, right: arr.count - 1)
       
        // 基数排序
        var arr = [0, 37, 89, 120, 256, 65, 99]
        arr = radixSort(arr)
        
        print("排序后：\(arr) index:\(index)")
    }
    
    /// 基数排序
    /// - Parameter arr: 数组
    /// - Returns: 结果
    func radixSort(_ arr:[Int]) -> [Int] {
        if arr.isEmpty {
            return []
        }
        var preArr:Array<Int> = arr
        var mod = 10, dev = 1
        let maxDigit = getMaxDigit(arr)
        for _ in 0..<maxDigit {
            var buckets:Array<Array<Int>> = Array(repeating: [], count: 10)
            preArr.forEach { (value) in
                if value < 0 {return}
                let compareNum = value % mod / dev
                buckets[compareNum].append(value)
            }
            
            var newArr:Array<Int> = []
            buckets.forEach { (arrValue) in
                if !arr.isEmpty {
                    newArr += arrValue
                }
            }
            preArr = newArr
            dev *= 10
            mod *= 10
        }
        return preArr
    }
    
    func getMaxDigit(_ arr: [Int]) -> Int {
        var max = arr[0]
        arr.forEach { (value) in
            if max < value {
                max = value
            }
        }
        guard max != 0 else {
            return 1
        }
        var digit = 0
        while max > 0 {
            max = max / 10
            digit += 1
        }
        return digit
    }
    
    
    // 分类 ------------ 内部比较排序
    // 数据结构 --------- 数组
    // 最差时间复杂度 ---- 每次选取的基准都是最大（或最小）的元素，导致每次只划分出了一个分区，需要进行n-1次划分才能结束递归，时间复杂度为O(n^2)
    // 最优时间复杂度 ---- 每次选取的基准都是中位数，这样每次都均匀的划分出两个分区，只需要logn次划分就能结束递归，时间复杂度为O(nlogn)
    // 平均时间复杂度 ---- O(nlogn)
    // 所需辅助空间 ------ 主要是递归造成的栈空间的使用(用来保存left和right等局部变量)，取决于递归树的深度，一般为O(logn)，最差为O(n)
    // 稳定性 ---------- 不稳定
    func partition(arr:inout Array<Int>, left: Int, right: Int)->Int{ // 划分函数
        let pivot = arr[right]// 这里每次都选择最后一个元素作为基准
        var tail = left - 1// tail为小于基准的子数组最后一个元素的索引
        for i in left..<right {// 遍历基准以外的其他元素
            if arr[i] <= pivot {// 把小于等于基准的元素放到前一个子数组末尾
                tail += 1
                swap(x: i, y: tail, array: &arr)
                print("排序中：\(arr) left:\(left) right:\(right) tail:\(tail)")
            }
        }
        swap(x: tail + 1, y: right, array: &arr)// 最后把基准放到前一个子数组的后边，剩下的子数组既是大于基准的子数组
        print("排序中：\(arr) left:\(left) right:\(right) tail:\(tail) pivot:\(pivot)")// 该操作很有可能把后面元素的稳定性打乱，所以快速排序是不稳定的排序算法
        return tail + 1// 返回基准的索引
    }
    
    func quickSort(arr:inout Array<Int>, left: Int, right: Int){
        if left < right {
            let mid = partition(arr: &arr, left: left, right: right)
            quickSort(arr: &arr, left: left, right: mid - 1)
            quickSort(arr: &arr, left: mid + 1, right: right)
        }
    }
    
    func swap(x:Int, y:Int , array:inout Array<Int>){
        let temp = array[x]
        array[x] = array[y]
        array[y] = temp
    }
    
    /// 构建大顶堆
    /// - Parameter arr: 数据
    func buildMaxHeap(arr:inout [Int]) {
        let mid = arr.count/2 - 1
        for i in (0...mid).reversed() {
            heapify(array: &arr, nodeIndex: i, len: arr.count)
        }
    }
    
    /// 堆画调整
    /// - Parameters:
    ///   - array: 数据
    ///   - nodeIndex: 节点
    ///   - len: 长度
    func heapify (array: inout [Int], nodeIndex: Int, len:Int){
        let left = 2 * nodeIndex + 1
        let right = 2 * nodeIndex + 2
        var largest = nodeIndex
        
        if left < len && array[left] > array[largest] {
            largest = left
        }
        if right < len && array[right] > array[largest] {
            largest = right
        }
        if largest != nodeIndex {
            array.swapAt(nodeIndex, largest)
            // 这个调整导致子根结构混乱，得调节子根
            heapify(array: &array, nodeIndex: largest, len: len)
        }
    }
    
    
    /// 归并排序中的‘并’--合并两个有序数组
    /// - Parameters:
    ///   - arr_f: 有序数组一
    ///   - arr_s: 有序数组儿
    /// - Returns: 结果
    func mergeArray(arr_f:Array<Int>, arr_s:Array<Int>) -> Array<Int>{
        var arr:Array<Int> = []
        var index_f = 0,index_s = 0
        while index_f < arr_f.count && index_s < arr_s.count {
            if arr_f[index_f] < arr_s[index_s] {
                arr.append(arr_f[index_f])
                index_f += 1
            }else{
                arr.append(arr_s[index_s])
                index_s += 1
            }
        }
        while index_f < arr_f.count {
            arr.append(arr_f[index_f])
            index_f += 1
        }
        while index_s < arr_s.count {
            arr.append(arr_s[index_s])
            index_s += 1
        }
        return arr
    }
    
    
    
    
    
    

    @IBAction func moreAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.menuView.bounds = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 65)
        }
    }
    
    @IBAction func returnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.menuView.bounds = CGRect(x: 120, y: 10, width: self.view.frame.size.width, height: 65)
        }
    }
    
    
}


//实际上atomic能保证属性的写操作是原子的，导致atomic不能保证线程安全的原因是问题的规模。问题规模的扩大，导致锁操作的范围需要扩展，而属性的原子操作对于扩大规模后问题的解决没有任何帮助，所以atomic并不能保证线程安全

//dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
//
//NSLock *lock1 = [NSLock new];
//NSLock *lock2 = [NSLock new];
//Model *m = [Model new];
//
//for (int i = 0; i < 100; i++) {
//    dispatch_async(queue, ^{
//        [lock1 lock];
//        m.index++;
//        [lock1 unlock];
//
//        [lock2 lock];
//        NSLog(@"index = %ld", m.index);
//        [lock2 unlock];
//    });
//}
