Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 614D04279E7
	for <lists.virtualization@lfdr.de>; Sat,  9 Oct 2021 13:58:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36556059F;
	Sat,  9 Oct 2021 11:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbfp-c2CRJjD; Sat,  9 Oct 2021 11:58:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CC2596067A;
	Sat,  9 Oct 2021 11:58:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 721CFC000D;
	Sat,  9 Oct 2021 11:58:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BAA1C000D
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CB7840502
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWoQNrHHYjIr
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:58:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 721C9403BA
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:58:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C90860EE9;
 Sat,  9 Oct 2021 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633780726;
 bh=+OEjWjipj45LByfaax3IC8mrbba3ydp9JA4U4ynR9rI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mkCpX97DtP87MbbFXKOvS+YAu0qSRrD74iQqaPGxGyRJsrY10jekAwJKiGtJtApBB
 8UsomooHdrFybbbw4FL03YwBS2WRVf5XZ8pKF6VT2/S7LswA8yWPInqdbx6WgjcrhD
 ANdNm19s2lwdoEvrbjE/5Ldyv7GuJviBkfcNo8mg=
Date: Sat, 9 Oct 2021 13:58:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v10 2/3] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YWGD8y9VfBIQBu2h@kroah.com>
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
> --- a/drivers/tty/hvc/hvc_console.h
> +++ b/drivers/tty/hvc/hvc_console.h
> @@ -32,13 +32,21 @@
>   */
>  #define HVC_ALLOC_TTY_ADAPTERS	8
>  
> +/*
> + * These sizes are most efficient for vio, because they are the
> + * native transfer size. We could make them selectable in the
> + * future to better deal with backends that want other buffer sizes.
> + */
> +#define N_OUTBUF	16
> +#define N_INBUF		16
> +
> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))

Does this conflict with what is in hvcs.c?

> +
>  struct hvc_struct {
>  	struct tty_port port;
>  	spinlock_t lock;
>  	int index;
>  	int do_wakeup;
> -	char *outbuf;
> -	int outbuf_size;
>  	int n_outbuf;
>  	uint32_t vtermno;
>  	const struct hv_ops *ops;
> @@ -48,6 +56,18 @@ struct hvc_struct {
>  	struct work_struct tty_resize;
>  	struct list_head next;
>  	unsigned long flags;
> +
> +	/* the buf is used in hvc console api for putting chars */
> +	char cons_outbuf[N_OUTBUF] __ALIGNED__;
> +	spinlock_t cons_outbuf_lock;

Did you look at the placement using pahole as to how this structure now
looks?

> +
> +	/* the buf is for putting single char to tty */
> +	char outchar;
> +	spinlock_t outchar_lock;

So you have a lock for a character and a different one for a longer
string?  Why can they not just use the same lock?  Why are 2 needed at
all, can't you just use the first character of cons_outbuf[] instead?
Surely you do not have 2 sends happening at the same time, right?

> +
> +	/* the buf is for putting chars to tty */
> +	int outbuf_size;
> +	char outbuf[0] __ALIGNED__;

I thought we were not allowing [0] anymore in kernel structures?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
