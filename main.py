import threading


nums = []


def get_nums(verbose=False):
    while True:
        num = input('Please enter a number to append to the list. To stop appending click Enter: ').strip()

        if not num:
            if verbose:
                print(f'List of the numbers: {nums}')

            return nums

        try:
            num = float(num)
        except TypeError as err:
            print(f'Enter a number or click Enter: {err}')
            continue

        nums.append(num)


def get_total(nums_arg: list, verbose=False):
    total = sum(nums_arg)

    if verbose:
        print(f'Sum of the numbers from the list: {total}')

    return total


def get_average_value(nums_arg: list, verbose=False):
    average_value = sum(nums_arg) / len(nums_arg)

    if verbose:
        print(f'Sum of the numbers from the list: {average_value}')

    return average_value


user_input_thread = threading.Thread(target=get_nums, args=(True, ))
user_input_thread.start()
user_input_thread.join()

total_thread = threading.Thread(target=get_total, kwargs={'nums_arg': nums, 'verbose': True})
total_thread.start()

average_thread = threading.Thread(target=get_average_value, kwargs={'nums_arg': nums, 'verbose': True})
average_thread.start()