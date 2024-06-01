import time
import matplotlib.pyplot as plt

def read_signal(device):
    with open(device, 'r') as file:
        data = file.read()
        value = int(data.split()[-1])
        return value

def write_signal(device, signal):
    with open(device, 'w') as file:
        file.write(str(signal))

def plot_signal(device):
    plt.ion()
    fig, ax = plt.subplots()
    x, y = [], []

    while True:
        value = read_signal(device)
        y.append(value)
        x.append(len(y))

        ax.clear()
        ax.plot(x, y)
        ax.set_xlabel('Time (s)')
        ax.set_ylabel('Signal Value')
        ax.set_title(f'Reading Signal from {device}')
        plt.pause(1)

        if len(y) > 100:
            x.pop(0)
            y.pop(0)

if __name__ == "__main__":
    device = '/dev/cdd_signals'
    while True:
        print("Select signal to read (1 or 2):")
        signal = input()
        if signal in ['1', '2']:
            write_signal(device, signal)
            plot_signal(device)
        else:
            print("Invalid selection. Please enter 1 or 2.")
