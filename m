Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF721390B
	for <lists.virtualization@lfdr.de>; Fri,  3 Jul 2020 13:04:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0F6682049A;
	Fri,  3 Jul 2020 11:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJpI6TqqzZXS; Fri,  3 Jul 2020 11:04:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EE754204AA;
	Fri,  3 Jul 2020 11:04:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D06C4C08A8;
	Fri,  3 Jul 2020 11:04:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F5D3C0733
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1CD992049B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSVA44H+fvGd
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:04:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 02DFE2049A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 11:04:33 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y13so18217796lfe.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jul 2020 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OSzLG/Q5ctkpPGhuaPoxJvjTyfdlXE2F3IbF2Pwkk7E=;
 b=Pua0s1Lja8sM6i+ugrq9k9QZGR/RJ80SSdCJ/kQ/d6ICO4o7o6CHfNFNSZ0Q4rrKIq
 smEu/TpYh/5kBXc3s7RbLvo9vdxuEgfJ9fnIoKxHcGvY9MeDojxCKeBm1jw9Lxo1S+uw
 xEcODlP6Kw5MVjda+EIESAD6qsfRipIGOswibWtuyOa0IXiTEWfb09F1WET2qlW97S1u
 km5fBU37jUymHPZnsVe77SYwM7yLj+Lj/N2E5xUWMuMAxc2BA/N1GzbxrsPqcd7aC1i1
 uhpgIEp9C3qnctr4mj4T1fu3oiZ6FjKSaUKystz+5WdalJgVMlOdRQ3GxgiADnJbj2Pz
 Pelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OSzLG/Q5ctkpPGhuaPoxJvjTyfdlXE2F3IbF2Pwkk7E=;
 b=e2yP/HYYc+0tc/h2LTkveEYsOqHSfQpWgSjIHhmVvpmun3nfRQQTIMPSWWhGMqfLUc
 jWmdEo4sOnzhhALBXe6jxjUtVHQBEydGgd55ECLTyn2O6EE8qnJKOK3YoAhHJV5OZZFv
 B6ULibw6jKgylp4vKIM9j+jCJjSbMfX3fDJGlmtvUoHheK21aGi6QwUSVi4mYp2U3MW7
 0o3YyySXtjbkyxTykrajHh2B6mCCj4G29ZmjfbQqKpEVMjsDtGw08KQ8R4e40ymkUUBS
 pAwxGRmnQZZ1I7i5sygtdP/mGwYQVxrZ5ENXR+fLa0/YZ5dLJZQJcftzso1FsEoPH7jU
 XPpw==
X-Gm-Message-State: AOAM5338PtiJbHo73G7l9J3ZezJcE8eLrE/cO50KVCW39BhPpKZtsagP
 dyGblJDwOnp4bcoFOwYp4KSdfk+iCl3FLHl/8CbNsg==
X-Google-Smtp-Source: ABdhPJwCBAYxeYjK4PxqGeHvUGXev/BGu5CvhhXznpS3i7EMvLEgcVNQSVGxxsASwC6knmsUQUEOB6ytdcgHUZZ9pVM=
X-Received: by 2002:a05:6512:3107:: with SMTP id
 n7mr21993946lfb.63.1593774271705; 
 Fri, 03 Jul 2020 04:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
In-Reply-To: <B7793B7A-3660-4769-9B9A-FFCF250728BB@amazon.com>
Date: Fri, 3 Jul 2020 13:04:05 +0200
Message-ID: <CAG48ez2CpHX9i3YgkNyMHPz63ohjkaSZscMtwSHOFYN4VQow3Q@mail.gmail.com>
Subject: Re: [RFC]: mm,power: introduce MADV_WIPEONSUSPEND
To: "Catangiu, Adrian Costin" <acatan@amazon.com>
Cc: "Weiss, Radu" <raduweis@amazon.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "mingo@kernel.org" <mingo@kernel.org>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "Brooker, Marc" <mbrooker@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "bonzini@gnu.org" <bonzini@gnu.org>, "Graf \(AWS\),
 Alexander" <graf@amazon.de>, "keescook@chromium.org" <keescook@chromium.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "MacCarthaigh,
 Colm" <colmmacc@amazon.com>, "fweimer@redhat.com" <fweimer@redhat.com>,
 "wad@chromium.org" <wad@chromium.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "Manwaring,
 Derek" <derekmn@amazon.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "luto@amacapital.net" <luto@amacapital.net>, "Sandu,
 Andrei" <sandreim@amazon.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Jann Horn via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Jul 3, 2020 at 12:34 PM Catangiu, Adrian Costin
<acatan@amazon.com> wrote:
> Cryptographic libraries carry pseudo random number generators to
> quickly provide randomness when needed. If such a random pool gets
> cloned, secrets may get revealed, as the same random number may get
> used multiple times. For fork, this was fixed using the WIPEONFORK
> madvise flag [1].
>
> Unfortunately, the same problem surfaces when a virtual machine gets
> cloned. The existing flag does not help there. This patch introduces a
> new flag to automatically clear memory contents on VM suspend/resume,
> which will allow random number generators to reseed when virtual
> machines get cloned.
>
> Examples of this are:
>  - PKCS#11 API reinitialization check (mandated by specification)
>  - glibc's upcoming PRNG (reseed after wake)
>  - OpenSSL PRNG (reseed after wake)
>
> Benefits exist in two spaces:
>  - The security benefits of a cloned virtual machine having a
>    re-initialized PRNG in every process are straightforward.
>    Without reinitialization, two or more cloned VMs could produce
>    identical random numbers, which are often used to generate secure
>    keys.
>  - Provides a simple mechanism to avoid RAM exfiltration during
>    traditional sleep/hibernate on a laptop or desktop when memory,
>    and thus secrets, are vulnerable to offline tampering or inspection.

For the first usecase, I wonder which way around this would work
better - do the wiping when a VM is saved, or do it when the VM is
restored? I guess that at least in some scenarios, doing it on restore
would be nicer because that way the hypervisor can always instantly
save a VM without having to wait for the guest to say "alright, I'm
ready" - especially if someone e.g. wants to take a snapshot of a
running VM while keeping it running? Or do hypervisors inject such
ACPI transitions every time they snapshot/save/restore a VM anyway?

> This RFC is foremost aimed at defining a userspace interface to enable
> applications and libraries that store or cache sensitive information,
> to know that they need to regenerate it after process memory has been
> exposed to potential copying.  The proposed userspace interface is
> a new MADV_WIPEONSUSPEND 'madvise()' flag used to mark pages which
> contain such data. This newly added flag would only be available on
> 64bit archs, since we've run out of 32bit VMA flags.
>
> The mechanism through which the kernel marks the application sensitive
> data as potentially copied, is a secondary objective of this RFC. In
> the current PoC proposal, the RFC kernel code combines
> MADV_WIPEONSUSPEND semantics with ACPI suspend/wake transitions to zero
> out all process pages that fall in VMAs marked as MADV_WIPEONSUSPEND
> and thus allow applications and libraries be notified and regenerate
> their sensitive data.  Marking VMAs as MADV_WIPEONSUSPEND results in
> the VMAs being empty in the process after any suspend/wake cycle.
> Similar to MADV_WIPEONFORK, if the process accesses memory that was
> wiped on suspend, it will get zeroes.  The address ranges are still
> valid, they are just empty.
>
> This patch adds logic to the kernel power code to zero out contents of
> all MADV_WIPEONSUSPEND VMAs present in the system during its transition
> to any suspend state equal or greater/deeper than Suspend-to-memory,
> known as S3.
>
> MADV_WIPEONSUSPEND only works on private, anonymous mappings.
> The patch also adds MADV_KEEPONSUSPEND, to undo the effects of a
> prior MADV_WIPEONSUSPEND for a VMA.
>
> Hypervisors can issue ACPI S0->S3 and S3->S0 events to leverage this
> functionality in a virtualized environment.
>
> Alternative kernel implementation ideas:
>  - Move the code that clears MADV_WIPEONFORK pages to a virtual
>    device driver that registers itself to ACPI events.
>  - Add prerequisite that MADV_WIPEONFORK pages must be pinned (so
>    no faulting happens) and clear them in a custom/roll-your-own
>    device driver on a NMI handler. This could work in a virtualized
>    environment where the hypervisor pauses all other vCPUs before
>    injecting the NMI.
>
> [1] https://lore.kernel.org/lkml/20170811212829.29186-1-riel@redhat.com/
[...]
> diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
> index c874a7026e24..4282b7f0dd03 100644
> --- a/kernel/power/suspend.c
> +++ b/kernel/power/suspend.c
> @@ -323,6 +323,78 @@ static bool platform_suspend_again(suspend_state_t state)
>                 suspend_ops->suspend_again() : false;
>  }
>
> +#ifdef VM_WIPEONSUSPEND
> +static void memory_cleanup_on_suspend(suspend_state_t state)
> +{
> +       struct task_struct *p;
> +       struct mm_struct *mm;
> +       struct vm_area_struct *vma;
> +       struct page *pages[32];
> +       unsigned long max_pages_per_loop = ARRAY_SIZE(pages);
> +
> +       /* Only care about states >= S3 */
> +       if (state < PM_SUSPEND_MEM)
> +               return;
> +
> +       rcu_read_lock();
> +       for_each_process(p) {
> +               int gup_flags = FOLL_WRITE;
> +
> +               mm = p->mm;
> +               if (!mm)
> +                       continue;
> +
> +               down_read(&mm->mmap_sem);

Blocking actions, such as locking semaphores, are forbidden in RCU
read-side critical sections. Also, from a more high-level perspective,
do we need to be careful here to avoid deadlocks with frozen tasks or
stuff like that?

> +               for (vma = mm->mmap; vma; vma = vma->vm_next) {
> +                       unsigned long addr, nr_pages;
> +
> +                       if (!(vma->vm_flags & VM_WIPEONSUSPEND))
> +                               continue;
> +
> +                       addr = vma->vm_start;
> +                       nr_pages = (vma->vm_end - addr - 1) / PAGE_SIZE + 1;
> +                       while (nr_pages) {
> +                               int count = min(nr_pages, max_pages_per_loop);
> +                               void *kaddr;
> +
> +                               count = get_user_pages_remote(p, mm, addr,
> +                                                       count, gup_flags,
> +                                                       pages, NULL, NULL);

get_user_pages_remote() can wait for disk I/O (for swapping stuff back
in), which we'd probably like to avoid here. And I think it can also
wait for userfaultfd handling from userspace? zap_page_range() (which
is what e.g. MADV_DONTNEED uses) might be a better fit, since it can
yank entries out of the page table (forcing the next write fault to
allocate a new zeroed page) without faulting them into RAM.

> +                               if (count <= 0) {
> +                                       /*
> +                                        * FIXME: In this PoC just break if we
> +                                        * get an error.
> +                                        * In the final implementation we need
> +                                        * to handle this better and not leave
> +                                        * pages uncleared.
> +                                        */
> +                                       break;
> +                               }
> +                               /* Go through pages buffer and clear them. */
> +                               while (count) {
> +                                       struct page *page = pages[--count];
> +
> +                                       kaddr = kmap(page);
> +                                       clear_page(kaddr);
> +                                       kunmap(page);

(This part should go away, but if it stayed, you'd probably want to
use clear_user_highpage() or so instead of open-coding this.)

> +                                       put_page(page);
> +                                       nr_pages--;
> +                                       addr += PAGE_SIZE;
> +                               }
> +                       }
> +               }
> +               up_read(&mm->mmap_sem);
> +       }
> +       rcu_read_unlock();
> +}
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
