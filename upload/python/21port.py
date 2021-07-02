from random import randint


def main():
    count = 0

    num = 0  # 玩家
    num2 = 0  # 庄家

    while True:
        count += 1
        print('第%d回合：' % count)
        if count == 1:
            num += randint(1, 13)
            num2 += randint(1, 13)
        print('你的得分是%d,庄家得分是%d' % (num, num2))
        flag = int(input('继续游戏吗（1开始）：'))
        x = randint(1, 13)
        y = randint(1, 13)
        print('庄家抽牌：%d' % y)

        if flag == 1:
            print('您抽牌：%d' % x)
            num += x
            num2 += y
            if x == 1 and num > 21:
                num += 9
            if y == 1 and num2 > 21:
                num2 += 9
            if num > 22 or num2 == 21:
                print('你输了')
                print('你的得分是%d,庄家得分是%d' % (num, num2))
                break
            elif num2 > 22 or num == 21:
                print('你赢了')
                print('你的得分是%d,庄家得分是%d' % (num, num2))
                break
            elif num == num2:
                print('平局')
                break
            # else:
            #     print('你的得分是%d,庄家得分是%d' % (num, num2))
        else:
            num2 += y
            if y == 1 and num2 > 21:
                num2 += 9
            if num2 < num or num2 > 21:
                print('你赢了')
                print('你的得分是%d,庄家得分是%d' % (num, num2))
                break
            elif num2 > num:
                print('你输了')
                print('你的得分是%d,庄家得分是%d' % (num, num2))
                break
            elif num == num2:
                print('平局')
                break


if __name__ == '__main__':
    main()
