/*
 * Simple __udivdi3 function which doesn't use FPU.
 */

#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/module.h>
#ifdef __TDT__
#include <linux/version.h>
#endif

extern u64 __xdiv64_32(u64 n, u32 d);

u64 __udivdi3(u64 n, u64 d)
{
	if (unlikely(d & 0xffffffff00000000ULL))
#if 1 // MARTII
	{
		// this lacks precision, but might be better than a panic that requires weird workarounds
		int shift = fls(d >> 32);
		d >>= shift;
		n >>= shift;
		printk(KERN_WARNING "Need true 64-bit/64-bit division");
	}
#else
		panic("Need true 64-bit/64-bit division");
#endif
	return __xdiv64_32(n, (u32)d);
}

#if defined(__TDT__) && (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 30))
#warning This implementation of __umoddi3 may be redundant because __umoddi3 is available under stlinux24 which does not provide this symbol explicittly either.
uint32_t __umoddi3(u64 xp, u32 y)
{
        uint32_t rem;
        uint64_t q = __xdiv64_32(xp, y);

        rem = xp - q * y;

        return rem;
}

EXPORT_SYMBOL(__umoddi3);
EXPORT_SYMBOL(__udivdi3);
#else
#if defined (CONFIG_KERNELVERSION) /* STLinux 2.3 or later */
EXPORT_SYMBOL(__udivdi3);
#endif
#endif
