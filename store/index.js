import Vue from 'vue'
import Vuex from 'vuex'
import mutations from './mutations'
import actions from './action'
import state1 from './state'


Vue.use(Vuex)
const createSate = () => {
    return new Vuex.Store({
        state: {
            token: '',
            level: '第一周', //活动周数
            itemNum: 1, // 第几题
            allTime: 0,  //总共用时
            timer: '', //定时器
            itemDetail: [{
                "topic_id": 20,
                "active_topic_id": 4,
                "type": "ONE",
                "topic_name": "以下不属于操作系统主要功能的是（  ）。",
                "view_content": "操作系统的主要功能：处理器管理、内存管理、设备管理、文件管理、作业管理。",
                "active_id": 1,
                "active_title": "欢乐星期五标题",
                "active_topic_phase": "第一周",
                "active_start_time": "1479139200",
                "active_end_time": "1482163200",
                "topic_answer": [{
                    "topic_answer_id": 1,
                    "topic_id": 20,
                    "answer_name": "文件管理",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 2,
                    "topic_id": 20,
                    "answer_name": "指令管理",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 3,
                    "topic_id": 20,
                    "answer_name": "作业管理",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 4,
                    "topic_id": 20,
                    "answer_name": "设备管理",
                    "is_standard_answer": 1
                }]
            }, {
                "topic_id": 21,
                "active_topic_id": 4,
                "type": "MORE",
                "topic_name": "32位计算机中的32位指的是（ ）。",
                "view_content": "32位的这个位数指的是CPU GPRs（General- Purpose Registers，通用寄存器）的数据宽度为32位，32位指令集就是运行32位数据的指令，也就是说处理器一次可以运行32bit数据。",
                "active_id": 1,
                "active_title": "欢乐星期五标题",
                "active_topic_phase": "第一周",
                "active_start_time": "1479139200",
                "active_end_time": "1482163200",
                "topic_answer": [{
                    "topic_answer_id": 5,
                    "topic_id": 21,
                    "answer_name": "计算机的外部数据传输为32位",
                    "is_standard_answer": 1
                }, {
                    "topic_answer_id": 6,
                    "topic_id": 21,
                    "answer_name": "计算机支持的最大内存为32G",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 7,
                    "topic_id": 21,
                    "answer_name": "计算机的CPU一次最多能处理32位数据",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 8,
                    "topic_id": 21,
                    "answer_name": "计算机的数据总线数量为32",
                    "is_standard_answer": 0
                }]
            }, {
                "topic_id": 21,
                "active_topic_id": 4,
                "type": "MORE",
                "topic_name": "题目三",
                "active_id": 1,
                "active_title": "欢乐星期五标题",
                "active_topic_phase": "第一周",
                "active_start_time": "1479139200",
                "active_end_time": "1482163200",
                "topic_answer": [{
                    "topic_answer_id": 9,
                    "topic_id": 21,
                    "answer_name": "测试A",
                    "is_standard_answer": 1
                }, {
                    "topic_answer_id": 10,
                    "topic_id": 21,
                    "answer_name": "BBBBBB",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 11,
                    "topic_id": 21,
                    "answer_name": "CCCCCC",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 12,
                    "topic_id": 21,
                    "answer_name": "正确答案",
                    "is_standard_answer": 0
                }]
            }, {
                "topic_id": 21,
                "active_topic_id": 4,
                "type": "MORE",
                "topic_name": "题目四",
                "active_id": 1,
                "active_title": "欢乐星期五标题",
                "active_topic_phase": "第一周",
                "active_start_time": "1479139200",
                "active_end_time": "1482163200",
                "topic_answer": [{
                    "topic_answer_id": 13,
                    "topic_id": 21,
                    "answer_name": "正确答案",
                    "is_standard_answer": 1
                }, {
                    "topic_answer_id": 14,
                    "topic_id": 21,
                    "answer_name": "A是错的",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 15,
                    "topic_id": 21,
                    "answer_name": "D是对的",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 16,
                    "topic_id": 21,
                    "answer_name": "C说的不对",
                    "is_standard_answer": 0
                }]
            }, {
                "topic_id": 21,
                "active_topic_id": 4,
                "type": "MORE",
                "topic_name": "计算机的总线按照功能分类，主要分为（  ）",
                "view_content": "计算机总线按功能分为数据总线、地址总线、控制总线，不存在信号总线一说。",
                "active_id": 1,
                "active_title": "欢乐星期五标题",
                "active_topic_phase": "第一周",
                "active_start_time": "1479139200",
                "active_end_time": "1482163200",
                "topic_answer": [{
                    "topic_answer_id": 17,
                    "topic_id": 21,
                    "answer_name": "数据总线、地址总线、信号总线",
                    "is_standard_answer": 1
                }, {
                    "topic_answer_id": 18,
                    "topic_id": 21,
                    "answer_name": "数据总线、地址总线、控制总线",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 19,
                    "topic_id": 21,
                    "answer_name": "数据总线、信号总线、控制总线",
                    "is_standard_answer": 0
                }, {
                    "topic_answer_id": 20,
                    "topic_id": 21,
                    "answer_name": "信号总线、地址总线、控制总线",
                    "is_standard_answer": 0
                }]
            }],
            answerid: [], //答案id
        },
        actions,
        mutations,
        state1
    })
}

export default createSate