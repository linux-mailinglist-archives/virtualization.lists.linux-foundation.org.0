Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6194279D1
	for <lists.virtualization@lfdr.de>; Sat,  9 Oct 2021 13:56:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E53214056F;
	Sat,  9 Oct 2021 11:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3OQJLApIwBz; Sat,  9 Oct 2021 11:55:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6B8EE40567;
	Sat,  9 Oct 2021 11:55:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2489C001E;
	Sat,  9 Oct 2021 11:55:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C281CC000D
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A251940659
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0YiLU61QzVsm
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:55:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12FD7403C3
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:55:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DF1560EE9;
 Sat,  9 Oct 2021 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633780554;
 bh=pJABJ1JzJYukeyq4nIhuXfqM6wKmGcJGn3PyObatZxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lhjEKytDQn7a443MT8nwdCQOHxRHPAAyXRJwge8eC5aRs2y+ZofQPjiMdWpAsFxsF
 H46jA6kTZJ6IUkNRs6p5Hbaqmsecjvjcrs1EJuVXtY6bDMi3gftFFMZ9srQaEed366
 Gkfsxsb6Y/hiWQD6LKl9b34DXLogfFP9xQjvlWyo=
Date: Sat, 9 Oct 2021 13:55:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v10 2/3] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YWGDSF04jEjc/FgJ@kroah.com>
References: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
 <20211009114829.1071021-3-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211009114829.1071021-3-xianting.tian@linux.alibaba.com>
Cc: arnd@arndb.de, amit@kernel.org, jirislaby@kernel.org,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 osandov@fb.com
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

On Sat, Oct 09, 2021 at 07:48:28PM +0800, Xianting Tian wrote:
> As well known, hvc backend can register its opertions to hvc backend.
> the operations contain put_chars(), get_chars() and so on.
> 
> Some hvc backend may do dma in its operations. eg, put_chars() of
> virtio-console. But in the code of hvc framework, it may pass DMA
> incapable memory to put_chars() under a specific configuration, which
> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
> 1, c[] is on stack,
>    hvc_console_print():
> 	char c[N_OUTBUF] __ALIGNED__;
> 	cons_ops[index]->put_chars(vtermnos[index], c, i);
> 2, ch is on stack,
>    static void hvc_poll_put_char(,,char ch)
>    {
> 	struct tty_struct *tty = driver->ttys[0];
> 	struct hvc_struct *hp = tty->driver_data;
> 	int n;
> 
> 	do {
> 		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
> 	} while (n <= 0);
>    }
> 
> Commit c4baad5029 is just the fix to avoid DMA from stack memory, which
> is passed to virtio-console by hvc framework in above code. But I think
> the fix is aggressive, it directly uses kmemdup() to alloc new buffer
> from kmalloc area and do memcpy no matter the memory is in kmalloc area
> or not. But most importantly, it should better be fixed in the hvc
> framework, by changing it to never pass stack memory to the put_chars()
> function in the first place. Otherwise, we still face the same issue if
> a new hvc backend using dma added in the furture.
> 
> In this patch, add 'char cons_outbuf[]' as part of 'struct hvc_struct',
> so hp->cons_outbuf is no longer the stack memory, we can use it in above
> case 1. Add 'char outchar' as part of 'struct hvc_struct', we can use it
> in above case 2. We also add lock for each above buf to protect them
> separately instead of using the global lock of hvc.
> 
> Introduce another array(cons_hvcs[]) for hvc pointers next to the
> cons_ops[] and vtermnos[] arrays. With the array, we can easily find
> hvc's cons_outbuf and its lock.
> 
> With the patch, we can revert the fix c4baad5029.
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
> ---
>  drivers/tty/hvc/hvc_console.c | 37 +++++++++++++++++++++--------------
>  drivers/tty/hvc/hvc_console.h | 24 +++++++++++++++++++++--
>  2 files changed, 44 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
> index 5bb8c4e44..4d8f112f2 100644
> --- a/drivers/tty/hvc/hvc_console.c
> +++ b/drivers/tty/hvc/hvc_console.c
> @@ -41,16 +41,6 @@
>   */
>  #define HVC_CLOSE_WAIT (HZ/100) /* 1/10 of a second */
>  
> -/*
> - * These sizes are most efficient for vio, because they are the
> - * native transfer size. We could make them selectable in the
> - * future to better deal with backends that want other buffer sizes.
> - */
> -#define N_OUTBUF	16
> -#define N_INBUF		16
> -
> -#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))
> -

Are you sure this applies on top of patch 1/3 here?

> +/*
> + * These sizes are most efficient for vio, because they are the
> + * native transfer size. We could make them selectable in the
> + * future to better deal with backends that want other buffer sizes.
> + */
> +#define N_OUTBUF	16
> +#define N_INBUF		16
> +
> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))

Again, are you sure this is correct?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
