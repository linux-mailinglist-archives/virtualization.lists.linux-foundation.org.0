Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A06893F9698
	for <lists.virtualization@lfdr.de>; Fri, 27 Aug 2021 11:00:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF7C40227;
	Fri, 27 Aug 2021 09:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EZfmjm7StEg; Fri, 27 Aug 2021 09:00:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F3C8640788;
	Fri, 27 Aug 2021 09:00:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A5B6C000E;
	Fri, 27 Aug 2021 09:00:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A31B2C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 09:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84BB140227
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 09:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CF8YGB3XXDU0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 09:00:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 841F74020A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 09:00:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76510608FE;
 Fri, 27 Aug 2021 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630054832;
 bh=23w14PHSR1S/hXG90KFAr1k9F0viwRPCAvAEd5AX2Mk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A+dBROUY5Tyvdc12gmi1XyOlgx6WummT6gQ4vLz5paKBD5NxhwDk6mV1as71SGfLk
 OgvtJn3lgGX4zsCsiGvoLwNcDJn0GXep5Cu24qtXWCJFpzYXxEpkd8gTcvfgbcfGOu
 efr4J+Nc1V85cP9KQokNqZo8d1GI7Xvz/IlSIugE=
Date: Fri, 27 Aug 2021 11:00:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [RESEND][PATCH] virtio_console: protect max_nr_ports to avoid
 invalid value
Message-ID: <YSippdinb67QYU6K@kroah.com>
References: <20210820075219.202404-1-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820075219.202404-1-xianting.tian@linux.alibaba.com>
Cc: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 arnd@arndb.de, amit@kernel.org
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

On Fri, Aug 20, 2021 at 03:52:19PM +0800, Xianting Tian wrote:
> In theory untrusted remote host can pass a big or overflow value
> of max_nr_ports to guest, it may cause guest system consumes
> a lot of memory when create vqs and other impacts.

How can you have a untrusted host?  Can't they do a lot worse things
than just this?

> 
> Add the protection to guarantee max_nr_ports to get a safe value.
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> ---
>  drivers/char/virtio_console.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> index 7eaf303a7..bba985c81 100644
> --- a/drivers/char/virtio_console.c
> +++ b/drivers/char/virtio_console.c
> @@ -29,6 +29,8 @@
>  
>  #define is_rproc_enabled IS_ENABLED(CONFIG_REMOTEPROC)
>  
> +#define MAX_NR_PORTS	MAX_NR_HVC_CONSOLES

How was this value picked?

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
