Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23273CDD7
	for <lists.virtualization@lfdr.de>; Sun, 25 Jun 2023 03:40:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B310C41622;
	Sun, 25 Jun 2023 01:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B310C41622
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UtdNwFbdJxt; Sun, 25 Jun 2023 01:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8D2CA415E4;
	Sun, 25 Jun 2023 01:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D2CA415E4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1FD8C0089;
	Sun, 25 Jun 2023 01:40:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F133FC0029
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jun 2023 01:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C36BF415EB
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jun 2023 01:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36BF415EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZfcBi_1epYg
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jun 2023 01:40:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9204415E4
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9204415E4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jun 2023 01:40:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VlqRN2W_1687657195; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VlqRN2W_1687657195) by smtp.aliyun-inc.com;
 Sun, 25 Jun 2023 09:39:56 +0800
Message-ID: <1687657188.5529833-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH 08/26] virtio-mem: use array_size
Date: Sun, 25 Jun 2023 09:39:48 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
 <20230623211457.102544-9-Julia.Lawall@inria.fr>
In-Reply-To: <20230623211457.102544-9-Julia.Lawall@inria.fr>
Cc: keescook@chromium.org, "Michael S. Tsirkin" <mst@redhat.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, 23 Jun 2023 23:14:39 +0200, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> Use array_size to protect against multiplication overflows.
>
> The changes were done using the following Coccinelle semantic patch:
>
> // <smpl>
> @@
>     expression E1, E2;
>     constant C1, C2;
>     identifier alloc = {vmalloc,vzalloc};
> @@
>
> (
>       alloc(C1 * C2,...)
> |
>       alloc(
> -           (E1) * (E2)
> +           array_size(E1, E2)
>       ,...)
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

>
> ---
>  drivers/virtio/virtio_mem.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index 835f6cc2fb66..a4dfe7aab288 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -399,7 +399,7 @@ static int virtio_mem_bbm_bb_states_prepare_next_bb(struct virtio_mem *vm)
>  	if (vm->bbm.bb_states && old_pages == new_pages)
>  		return 0;
>
> -	new_array = vzalloc(new_pages * PAGE_SIZE);
> +	new_array = vzalloc(array_size(new_pages, PAGE_SIZE));
>  	if (!new_array)
>  		return -ENOMEM;
>
> @@ -465,7 +465,7 @@ static int virtio_mem_sbm_mb_states_prepare_next_mb(struct virtio_mem *vm)
>  	if (vm->sbm.mb_states && old_pages == new_pages)
>  		return 0;
>
> -	new_array = vzalloc(new_pages * PAGE_SIZE);
> +	new_array = vzalloc(array_size(new_pages, PAGE_SIZE));
>  	if (!new_array)
>  		return -ENOMEM;
>
> @@ -588,7 +588,7 @@ static int virtio_mem_sbm_sb_states_prepare_next_mb(struct virtio_mem *vm)
>  	if (vm->sbm.sb_states && old_pages == new_pages)
>  		return 0;
>
> -	new_bitmap = vzalloc(new_pages * PAGE_SIZE);
> +	new_bitmap = vzalloc(array_size(new_pages, PAGE_SIZE));
>  	if (!new_bitmap)
>  		return -ENOMEM;
>
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
