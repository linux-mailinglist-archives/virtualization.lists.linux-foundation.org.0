Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A258D40ED9F
	for <lists.virtualization@lfdr.de>; Fri, 17 Sep 2021 00:58:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D3C80C0A;
	Thu, 16 Sep 2021 22:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLcGmdZHLb-U; Thu, 16 Sep 2021 22:58:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D2CAF82CEC;
	Thu, 16 Sep 2021 22:58:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60AF8C000D;
	Thu, 16 Sep 2021 22:58:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0685DC000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 22:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3EA9830D7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 22:58:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9uFBi0PuoHgA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 22:58:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA6B682CEC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631833129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uWuX79Oma33ajffLz8sEoqWJG5Af27VtCrWnpaV0H50=;
 b=dn1aG03PPoIdpLH2AP4RVEM0wIoXyCFttjRSkzdy7d34g1o1ydYfCcTrtRqLpAErS7G6k+
 V0QNNtluSl1WKdBp1BBL294Of4iIvQRMjlhjbDwYpNg7My5SUxHydWKXRDZ8MaZuOVPuvp
 75XtUDmX0yixHqloXe4oLSbaCDLfxR8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-1OwCGShkNdGFUjgQzz0OpA-1; Thu, 16 Sep 2021 18:58:46 -0400
X-MC-Unique: 1OwCGShkNdGFUjgQzz0OpA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h24-20020a50cdd8000000b003d8005fe2f8so2958693edj.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 15:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uWuX79Oma33ajffLz8sEoqWJG5Af27VtCrWnpaV0H50=;
 b=sc5ql9vmEqCYW67n9DrJ2HoYGBCCAQMRuG+/U5VGIRpxgvvDni8/8ZaiYi2C1GozsQ
 +g1+aW+yhA0G7ten9swubjMUHLiFa4njuBK2REl6jjT9R3jmbFpp8ULdyKK3A3uYVHVM
 OOUd0dqtHI/FWLMvn6/qSi7BLjapyYvi99nJt5D2SV+/c4SSjgDxIBr4qZ1k0RS82Hmr
 IdpQPlbnaAaNEBiMMX1cX0Q2U1Max17UgwJXN1a9N7qy2crBSHJGYeheoOTwHPvg/ZE+
 ZQka4fmpzKcBm8h29WNA+cuUVwkR+PTq7v3Yfcoxd3Df4Ek3wfzXAdiEz8Igm2I9JSDg
 qjCQ==
X-Gm-Message-State: AOAM531R6MLZSEa3QWRv/HVQw6WzRMAZHcdFhOdJ8lIkr2AMWb45lFPN
 U1K4uRVDR9ySS2toRDfeYw0106wlQhwtvLzf0Cq4SWPsokX6mXCoanfSizD7twfNhxlg1sHG71c
 Z+P3uWNfkSBBRobbdosXlg8PqHAkN8t8MKMKD1dQAaA==
X-Received: by 2002:a17:906:ca1:: with SMTP id
 k1mr8967507ejh.369.1631833125341; 
 Thu, 16 Sep 2021 15:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+8w8N7qiIOx45XijBLBK6P1k3TNVlEXVvyE9jP/wdNCT2Rv81vH7kEG6Yq5KMkmzha72DFw==
X-Received: by 2002:a17:906:ca1:: with SMTP id
 k1mr8967487ejh.369.1631833125139; 
 Thu, 16 Sep 2021 15:58:45 -0700 (PDT)
Received: from redhat.com ([176.12.194.242])
 by smtp.gmail.com with ESMTPSA id bx11sm1634433ejb.107.2021.09.16.15.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 15:58:44 -0700 (PDT)
Date: Thu, 16 Sep 2021 18:58:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: Use of uninitialized memory with CONFIG_HW_RANDOM_VIRTIO
Message-ID: <20210916185802-mutt-send-email-mst@kernel.org>
References: <CAG_fn=WwQ29akxY1Eq=N_=HCF3t7z+T2obh9aRVUDFy1FSA3-Q@mail.gmail.com>
 <20210819165742-mutt-send-email-mst@kernel.org>
 <d0d232ab-5222-5eef-60de-e8cc0f2a0791@redhat.com>
 <CAG_fn=Um3Up2VyGOC0ezJ51N8AWZfGcWz+98cvwpBrJkby3+NA@mail.gmail.com>
 <639bbb70-eca8-97c5-7faa-8563e594d67a@redhat.com>
 <CAG_fn=VGU5A+JDC9mqksLbHHjHEJ6RSB9Ce2WVF9ysAHd=RWKg@mail.gmail.com>
 <e4ecab9b-1d09-069f-1ef1-d8d5a3499826@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e4ecab9b-1d09-069f-1ef1-d8d5a3499826@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: amit@kernel.org, rusty@rustcorp.com.au,
 virtualization@lists.linux-foundation.org,
 syzkaller <syzkaller@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, akong@redhat.com,
 Dmitriy Vyukov <dvyukov@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Sep 16, 2021 at 10:52:59AM +0200, Laurent Vivier wrote:
> On 13/09/2021 10:25, Alexander Potapenko wrote:
> > Hi Laurent,
> > 
> > I took the latest kernel (5.15-rc1,
> > 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f) and a slightly modified
> > config from syzbot (see attached)
> > The latter has a lot of unnecessary debug checks, but those should not
> > affect the RNG.
> > 
> > You then need to apply the following patch to the kernel:
> > 
> > ====================================================
> > diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
> > index a3db27916256d..a4cba9f0ff8cb 100644
> > --- a/drivers/char/hw_random/core.c
> > +++ b/drivers/char/hw_random/core.c
> > @@ -433,8 +433,11 @@ static int hwrng_fillfn(void *unused)
> >                  if (IS_ERR(rng) || !rng)
> >                          break;
> >                  mutex_lock(&reading_mutex);
> > +               memset(rng_fillbuf, 'A', rng_buffer_size());
> > +               rng_fillbuf[rng_buffer_size()-1] = 0;
> >                  rc = rng_get_data(rng, rng_fillbuf,
> >                                    rng_buffer_size(), 1);
> > +               pr_err("rng_fillbuf: %s\n", rng_fillbuf);
> >                  mutex_unlock(&reading_mutex);
> >                  put_rng(rng);
> >                  if (rc <= 0) {
> > ====================================================
> > 
> > and run the kernel under QEMU.
> > 
> > On my machine I'm seeing the following output:
> > 
> > $ cat log | strings | grep rng_fillbuf
> > [    4.901931][  T897] rng_fillbuf:
> > AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
> > [    4.903104][  T897] rng_fillbuf: >
> > [    4.903641][  T897] rng_fillbuf:
> > [    4.904846][  T897] rng_fillbuf: ?
> > [    4.913442][  T897] rng_fillbuf: [
> > 
> > , which denotes that the first call to rng_get_data() leaves
> > rng_fillbuf uninitialized.
> 
> 
> Thank you for the detailed steps.
> 
> The problem happens because we mix two different buffers:
> - in add_early_randomness() we provide rng_buffer but don't wait it is full (see [1])
> - in hwrng_fillfn() we provide rng_fillbuf, and we wait data here, but we
> received the signal from QEMU that there are data, but these data are in
> rng_buffer while we expect them in rng_fillbuf.
> 
> There are several ways to fix/workaround that:
> 
> 1- ignore the read when wait=0 :
> 
> diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
> index a90001e02bf7..8466d76566fd 100644
> --- a/drivers/char/hw_random/virtio-rng.c
> +++ b/drivers/char/hw_random/virtio-rng.c
> @@ -59,15 +59,15 @@ static int virtio_read(struct hwrng *rng, void *buf,
> size_t size, bool wait)
>         if (vi->hwrng_removed)
>                 return -ENODEV;
> 
> +       if (!wait)
> +               return 0;
> +
>         if (!vi->busy) {
>                 vi->busy = true;
>                 reinit_completion(&vi->have_data);
>                 register_buffer(vi, buf, size);
>         }
> 
> -       if (!wait)
> -               return 0;
> -
>         ret = wait_for_completion_killable(&vi->have_data);
>         if (ret < 0)
>                 return ret;
> 
> 
> 2- Use an internal intermediate buffer in virtio-rng, at a cost of a copy,
>    I have some patches (somewhere) I can refresh to do that.
> 
> 3- modify hw_random/core.c to use only one buffer
> 
> Thanks,
> Laurent
> 
> [1] 78887832e765 ("hwrng: core - don't wait on add_early_randomness()")

4. actually differentiate between the two
using the pointer returned by get_buf.

> > 
> > HTH,
> > Alex
> > 
> > On Mon, Sep 13, 2021 at 8:52 AM Laurent Vivier <lvivier@redhat.com> wrote:
> > > 
> > > Hi Alexander,
> > > 
> > > On 12/09/2021 19:05, Alexander Potapenko wrote:
> > > > Hi Laurent,
> > > > 
> > > > Do you by any chance have an update on this?
> > > 
> > > I'm sorry I didn't have the time until now.
> > > 
> > > I try today.
> > > 
> > > Could you give more details how to reproduce this?
> > > (kernel version, .config, tools to run?)
> > > 
> > > Thanks,
> > > Laurent
> > > > Thanks,
> > > > Alex
> > > > 
> > > > On Fri, Aug 20, 2021 at 6:15 PM Laurent Vivier <lvivier@redhat.com> wrote:
> > > > > 
> > > > > On 19/08/2021 22:58, Michael S. Tsirkin wrote:
> > > > > > On Fri, Nov 13, 2020 at 06:26:16PM +0100, Alexander Potapenko wrote:
> > > > > > > Hi Amos, Rusty, Amit, Michael,
> > > > > > > 
> > > > > > > I am hitting something that I believe to be a minor problem in the
> > > > > > > virtio RNG driver.
> > > > > > > When running the kernel under KMSAN with "-device virtio-rng-pci"
> > > > > > > passed to QEMU, I am seeing reports about rng_fillbuf in
> > > > > > > drivers/char/hw_random/core.c being used before initialization (see
> > > > > > > the report below).
> > > > > > > 
> > > > > > > This can be verified by initializing rng_fillbuf with 'A' as follows:
> > > > > > > ==========================================
> > > > > > > diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
> > > > > > > index 8c1c47dd9f46..44d609a5796a 100644
> > > > > > > --- a/drivers/char/hw_random/core.c
> > > > > > > +++ b/drivers/char/hw_random/core.c
> > > > > > > @@ -439,8 +439,11 @@ static int hwrng_fillfn(void *unused)
> > > > > > >                  if (IS_ERR(rng) || !rng)
> > > > > > >                          break;
> > > > > > >                  mutex_lock(&reading_mutex);
> > > > > > > +               memset(rng_fillbuf, 'A', rng_buffer_size());
> > > > > > > +               rng_fillbuf[rng_buffer_size()-1] = 0;
> > > > > > >                  rc = rng_get_data(rng, rng_fillbuf,
> > > > > > >                                    rng_buffer_size(), 1);
> > > > > > > +               pr_err("rng_fillbuf: %s\n", rng_fillbuf);
> > > > > > >                  mutex_unlock(&reading_mutex);
> > > > > > >                  put_rng(rng);
> > > > > > >                  if (rc <= 0) {
> > > > > > > ==========================================
> > > > > > > 
> > > > > > > and booting the kernel: the first call of hwrng_fillfn() will print
> > > > > > > "AAAAAAA.." instead of random data.
> > > > > > > 
> > > > > > > For some reason on that first iteration vi->busy is true here:
> > > > > > > https://elixir.bootlin.com/linux/latest/source/drivers/char/hw_random/virtio-rng.c#L62,
> > > > > > > therefore the buffer is not being sent to virtio ring.
> > > > > > > 
> > > > > > > While probably being benign, this bug is preventing syzkaller from
> > > > > > > finding more bugs, so it would be nice to fix it.
> > > > > > > Perhaps the easiest solution is to kzalloc rng_fillbuf, but if it's
> > > > > > > critical for this driver to not skip even the first read, then maybe
> > > > > > > you have better ideas?
> > > > > > > 
> > > > > > > KMSAN report follows:
> > > > > > > 
> > > > > > > =====================================================
> > > > > > > BUG: KMSAN: uninit-value in _mix_pool_bytes+0x7d2/0x950
> > > > > > > drivers/char/random.c:570
> > > > > > > CPU: 0 PID: 2711 Comm: hwrng Not tainted 5.9.0-rc8-syzkaller #0
> > > > > > > Hardware name: Google Google Compute Engine/Google Compute Engine,
> > > > > > > BIOS Google 01/01/2011
> > > > > > > Call Trace:
> > > > > > >   __dump_stack lib/dump_stack.c:77 [inline]
> > > > > > >   dump_stack+0x21c/0x280 lib/dump_stack.c:118
> > > > > > >   kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:122
> > > > > > >   __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:201
> > > > > > >   _mix_pool_bytes+0x7d2/0x950 drivers/char/random.c:570
> > > > > > >   mix_pool_bytes+0xca/0x2a0 drivers/char/random.c:599
> > > > > > >   add_hwgenerator_randomness+0x4ac/0x500 drivers/char/random.c:2319
> > > > > > >   hwrng_fillfn+0x6ae/0x940 drivers/char/hw_random/core.c:452
> > > > > > >   kthread+0x51c/0x560 kernel/kthread.c:293
> > > > > > >   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> > > > > > > 
> > > > > > > Uninit was created at:
> > > > > > >   kmsan_save_stack_with_flags mm/kmsan/kmsan.c:129 [inline]
> > > > > > >   kmsan_internal_poison_shadow+0x5c/0xf0 mm/kmsan/kmsan.c:112
> > > > > > >   kmsan_slab_alloc+0x8d/0xe0 mm/kmsan/kmsan_hooks.c:80
> > > > > > >   slab_alloc_node mm/slub.c:2903 [inline]
> > > > > > >   slab_alloc mm/slub.c:2912 [inline]
> > > > > > >   kmem_cache_alloc_trace+0x61e/0xc90 mm/slub.c:2929
> > > > > > >   kmalloc include/linux/slab.h:554 [inline]
> > > > > > >   hwrng_modinit+0x103/0x2ef drivers/char/hw_random/core.c:621
> > > > > > >   do_one_initcall+0x371/0x9c0 init/main.c:1208
> > > > > > >   do_initcall_level+0x1e5/0x3c6 init/main.c:1281
> > > > > > >   do_initcalls+0x127/0x1cb init/main.c:1297
> > > > > > >   do_basic_setup+0x33/0x36 init/main.c:1317
> > > > > > >   kernel_init_freeable+0x238/0x38b init/main.c:1517
> > > > > > >   kernel_init+0x1f/0x840 init/main.c:1406
> > > > > > >   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> > > > > > > =====================================================
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > Alex
> > > > > > 
> > > > > > 
> > > > > > Cc Laurent - I think he said he was going to look at virtio rng.
> > > > > 
> > > > > I will have look next week.
> > > > > 
> > > > > Thanks,
> > > > > Laurent
> > > > > 
> > > > 
> > > > 
> > > 
> > 
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
