import os

import xlrd
from selenium import webdriver
import time
from PIL import Image
import math
import operator
from functools import reduce


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
def open_url(test_url, num):
    handle = browser.current_window_handle
    # 打开一个新的窗口
    browser.execute_script('window.open()')
    # 获取当前所有窗口句柄（窗口A、B）
    handles = browser.window_handles
    # 对窗口进行遍历
    for new_handle in handles:
        # 筛选新打开的窗口B
        if new_handle != handle:
            # 切换到新打开的窗口B
            browser.switch_to.window(new_handle)

    browser.get(test_url)
    time.sleep(15)
    browser.save_screenshot('E:\web\c\c%d.png' % num)
    browser.close()
    browser.switch_to.window(handles[0])
    return


# 开始计时
time_start = time.time()

browser = webdriver.Chrome()
browser.maximize_window()
browser.get('https://cloud.chaojidun.com/home')

# 定位到要右击的元素
double_click = browser.find_element_by_link_text('登录')
double_click.click()
time.sleep(5)

# 登录
zh = browser.find_element_by_class_name("el-input__inner")
zh.send_keys("15958026448")

pwd = browser.find_element_by_xpath("//*[@id=\"app\"]/div/div[2]/div/div[2]/div[2]/div[1]/div/div[3]/input")
pwd.send_keys("123456zwy")

login_button = browser.find_element_by_xpath("//*[@id=\"app\"]/div/div[2]/div/div[2]/div[2]/div[1]/div/button[1]")
login_button.click()
print('登录成功')

time.sleep(5)

# 点开产品与服务
# cf = browser.find_element_by_class_name("el-menu-vertical-mine mine1 el-menu")
# cf = browser.find_element_by_xpath("//*[@id=\"app\"]/div/div[2]/div[1]/div/ul[1]")
# cf.click()

# url = "https://ecs-buy4service.aliyun.com/wizard/#/prepay/cn-beijing"
# open_url(url)

# file = open(r"E:\web\test.txt", "r", encoding="utf-8")
# file = open(r"E:\web\url.txt", "r", encoding="utf-8")
# f = file.readlines()
# n = 1

# file2用于记录结果
file2 = open(r"E:\web\res.txt", "w+", encoding="utf-8")

# 打开excel
excel = xlrd.open_workbook(r"E:\web\url.xlsx")
# 选择表一
sht = excel.sheets()[0]

# 遍历url列表
# for url in f:
for n in range(1, sht.nrows):
    url = sht.cell(n, 3).value

    print(url)
    open_url(url, n)

    # 对比网页图片是否异常
    fp1 = "E:\web\c\c" + str(n) + ".png"
    fp2 = "E:\web\log\c" + str(n) + ".png"
    res = pil_image_similarity(fp1, fp2)
    print(str(res))
    # 当差异值大于5000时，保存截图并将结果保存到res.txt中
    if res > 5000:
        file2.write(str(n + 1) + ': ' + url + '\n')
        file2.write(str(res) + '\n\n')
        file2.flush()
    elif url == 'https://www.aliyun.com/?e=1101':
        os.remove(fp1)
    else:
        os.remove(fp1)
    # n += 1

# file.close()

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

