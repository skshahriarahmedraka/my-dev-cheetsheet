## run in local computer, ELF64 (x86-64) (Linux, most Unix variants)

nasm -felf64 app.asm

ld app.o -o app

./app

# run on virtual arm machine

### kernel

[qemu-rpi-kernel: Qemu kernel for emulating Rpi on QEMU](https://github.com/dhruvvyas90/qemu-rpi-kernel)

### os image

[raspbian-2017-04-10](https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/)

sudo apt install qemu-system

qemu-system-arm -kernel ~/qemu_vms/kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ~/qemu_vms/2017-04-10-raspbian-jessie.img -nic user,hostfwd=tcp::5022-:22 -no-reboot

### my command

```
qemu-system-arm -kernel ./kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ./2017-04-10-raspbian-jessie.img -nic user,hostfwd=tcp::5022-:22 -no-reboot
```

### ssh to raspberry pi from your pc

```
ssh pi@127.0.0.1 -p 5022
```

password : raspberry
