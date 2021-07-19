# 使用前，请创建web文件夹
# 并在web文件夹内，创建url.excel、res.txt、c1\log文件夹
# 点击web.exe文件
# 运行完成后，结果会保存到res.txt中
#
import getpass
import logging
import math
import msvcrt
import operator
import os
import shutil
import sys
import time
from functools import reduce

import xlrd
from PIL import Image
from selenium import webdriver


# 图片对比
def pil_image_similarity(filepath1, filepath2):
    image1 = Image.open(filepath1)
    image2 = Image.open(filepath2)
    #    image1 = get_thumbnail(img1)
    #    image2 = get_thumbnail(img2)

    h1 = image1.histogram()
    h2 = image2.histogram()

    rms = math.sqrt(reduce(operator.add, list(map(lambda a, b: (a - b) ** 2, h1, h2))) / len(h1))
    return rms


# 新窗口访问内嵌页
def open_url(t_browser, test_url, num, ts):
    handle = t_browser.current_window_handle
    # 打开一个新的窗口
    t_browser.execute_script('window.open()')
    # 获取当前所有窗口句柄（窗口A、B）
    handles = t_browser.window_handles
    # 对窗口进行遍历
    for new_handle in handles:
        # 筛选新打开的窗口B
        if new_handle != handle:
            # 切换到新打开的窗口B
            t_browser.switch_to.window(new_handle)

    t_browser.get(test_url)
    time.sleep(12)
    t_browser.save_screenshot('.\c%d\c%d.png' % (ts, num))
    t_browser.close()
    t_browser.switch_to.window(handles[0])
    return t_browser


# 清空文件夹中所有文件
def del_pic(filepath):
    del_list = os.listdir(filepath)
    for f in del_list:
        file_path = os.path.join(filepath, f)
        os.remove(file_path)


# 密码密文
def pwd_input():
    print('请输入密码: ', end='', flush=True)

    li = []
    while 1:
        ch = msvcrt.getch()
        # 回车
        if ch == b'\r':
            msvcrt.putch(b'\n')
            # print('输入的密码是：%s' % b''.join(li).decode())
            return b''.join(li).decode()
        # 退格
        elif ch == b'\x08':
            if li:
                li.pop()
                msvcrt.putch(b'\b')
                msvcrt.putch(b' ')
                msvcrt.putch(b'\b')
        # Esc
        elif ch == b'\x1b':
            break
        else:
            li.append(ch)
            msvcrt.putch(b'*')


# 登录
def login(login_bro):
    # 定位到要右击的元素
    double_click = login_bro.find_element_by_link_text('登录')
    double_click.click()
    time.sleep(5)

    # 登录
    zh = login_bro.find_element_by_class_name("el-input__inner")
    account = input("请输入账号：")
    zh.send_keys(account)

    pwd = login_bro.find_element_by_xpath("//*[@id=\"app\"]/div/div[2]/div/div[2]/div[2]/div[1]/div/div[3]/input")
    # password = input("请输入密码：")
    # password = getpass.getpass("请输入密码:")
    password = pwd_input()
    pwd.send_keys(password)

    login_button = login_bro.find_element_by_xpath("//*[@id=\"app\"]/div/div[2]/div/div[2]/div[2]/div[1]/div/button[1]")
    login_button.click()
    time.sleep(5)
    f1 = '.\c1\c0.png'
    f2 = '.\log\c0.png'
    login_bro.save_screenshot(f1)

    if os.path.exists(f2) is True:
        r = pil_image_similarity(f1, f2)
        # print('登录成功')
        if r < 5000:
            logging.info("登录成功")
        else:
            logging.error("登录失败")
            sys.exit(0)
    else:
        shutil.copy(f1, f2)


# 第一次获取log
def first_time(f_brow):
    logging.info("开始第一次循环，获取log")
    src = '.\log'
    port = '.\c1'
    # 截图登录成功页
    f_brow.save_screenshot(port+'\c0.png')
    # 打开excel
    excel = xlrd.open_workbook(r".\url.xlsx")
    # 选择表一
    sht = excel.sheets()[0]
    mod = sht.cell(1, 1).value  # 产品名称

    # 遍历获取截图
    for n in range(1, sht.nrows):
        url = sht.cell(n, 3).value  # url网址
        part = sht.cell(n, 2).value  # 产品具体项目

        if sht.cell(n, 1).value != '':
            mod = sht.cell(n, 1).value
        logging.info("目前产品为：" + mod + "-" + part)
        time.sleep(1)
        print(url)

        f_brow = open_url(f_brow, url, n, 1)
        time.sleep(1)

    # 清空log文件夹
    del_pic(src)

    # 复制截图到log文件夹
    src_files = os.listdir(port)
    for file_name in src_files:
        full_file_name = os.path.join(port, file_name)
        if os.path.isfile(full_file_name):
            shutil.copy(full_file_name, src)

    # 清空c文件夹
    del_pic('.\c1')


def web_test():
    logging.basicConfig(format='%(asctime)s - %(pathname)s[line:%(lineno)d] - %(levelname)s: %(message)s',
                        level=logging.INFO)

    # 开始计时
    time_start = time.time()
    logging.info("开始测试：")

    options = webdriver.ChromeOptions()
    options.add_experimental_option('excludeSwitches', ['enable-logging'])
    browser = webdriver.Chrome(options=options)
    browser.maximize_window()
    browser.get('https://cloud.chaojidun.com/home')

    # 登录账号
    login(browser)
    time.sleep(5)

    # 点开产品与服务
    # cf = browser.find_element_by_class_name("el-menu-vertical-mine mine1 el-menu")
    # cf = browser.find_element_by_xpath("//*[@id=\"app\"]/div/div[2]/div[1]/div/ul[1]")
    # cf.click()

    # url = "https://ecs-buy4service.aliyun.com/wizard/#/prepay/cn-beijing"
    # open_url(url)

    # file = open(r"E:\web\test.txt", "r", encoding="utf-8")
    # f = file.readlines()
    # n = 1

    # file2用于记录结果
    file2 = open(r".\res.txt", "w+", encoding="utf-8")
    # 记录开始时间
    file2.write("开始时间：" + time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + "\n")
    file2.flush()

    # 打开excel
    excel = xlrd.open_workbook(r".\url.xlsx")
    # 选择表一
    sht = excel.sheets()[0]
    mod = sht.cell(1, 1).value  # 产品名称

    times = int(input('请输入循环次数（0为获取log图片）：'))
    if times == 0:
        first_time(browser)

    for t in range(times):
        if not os.path.exists("./c%d" % (t+1)):
            os.makedirs("./c%d" % (t+1))

        # 清空c文件夹
        del_pic('.\c%d' % (t+1))

        file2.write("第%d轮：\n" % (t+1))
        file2.flush()

        # 遍历url列表
        # for url in f:
        for n in range(1, sht.nrows):
            url = sht.cell(n, 3).value  # url网址
            part = sht.cell(n, 2).value  # 产品具体项目

            if sht.cell(n, 1).value != '':
                mod = sht.cell(n, 1).value

            logging.info("第" + str(t+1) + "轮 第" + str(n) + "个 目前产品为：" + mod + "-" + part)
            time.sleep(1)
            print(url)

            browser = open_url(browser, url, n, t+1)
            time.sleep(1)

            if url == 'https://www.aliyun.com/?e=1101':
                file2.write(mod + '-' + part + '\t')
                file2.write(" web网页未登录\n")
                logging.error("web网页未登录")
                file2.flush()

            else:

                # 对比网页图片是否异常
                fp1 = ".\c"+str(t+1)+"\c" + str(n) + ".png"
                fp2 = ".\log\c" + str(n) + ".png"
                res = pil_image_similarity(fp1, fp2)
                # 输出差异值
                print(str(res))
                time.sleep(1)

                # 当差异值大于5000时，保存截图并将结果保存到res.txt中
                if res > 5000:
                    file2.write(mod + '-' + part + '\t')
                    file2.write(" web截图对比错误\n")
                    logging.error("web截图对比错误")
                    file2.flush()
                else:
                    os.remove(fp1)
            # n += 1

    # file.close()

    file2.write("结束时间：" + time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + "\n")
    file2.close()

    # 关闭浏览器
    time.sleep(5)
    browser.quit()

    # 计时结束
    time_end = time.time()
    t = time_end - time_start
    m = t / 60
    s = t - 60 * int(m)
    ms = s - int(s)
    # print(t, ',', int(m), ',', round(s, 2))
    print('花费总时间：', int(m), 'm', int(s), 's', int(round(ms, 2) * 100))
    logging.info("测试结束")


if __name__ == '__main__':
    web_test()
