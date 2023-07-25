CLANG=/run/media/toy/build/kernel/snapdragon-clang/bin/
GCC32=/run/media/toy/build/kernel/arm-linux-androideabi-4.9/bin/
GCC64=/run/media/toy/build/kernel/aarch64-linux-android-4.9/bin/

PATH=$CLANG:$GCC64:$GCC32:$PATH

export PATH
export ARCH=arm64

export CLANG_TRIPLE
export CROSS_COMPILE
export CROSS_COMPILE_ARM32

CLANG_TRIPLE="aarch64-linux-gnu-"
CROSS_COMPILE="aarch64-linux-gnu-"
CROSS_COMPILE_ARM32="arm-linux-gnueabi-"

make O="$output_dir" \
            vendor/kona-perf_defconfig \
            vendor/xiaomi/sm8250-common.config \
            vendor/xiaomi/alioth.config

make -j $(nproc) \
            O="$output_dir" \
            CC=clang
