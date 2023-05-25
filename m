Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3771028E
	for <lists.virtualization@lfdr.de>; Thu, 25 May 2023 03:52:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2AFE83B8A;
	Thu, 25 May 2023 01:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2AFE83B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSFrEEU29J3u; Thu, 25 May 2023 01:52:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D23BF83BAE;
	Thu, 25 May 2023 01:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D23BF83BAE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B0A4C008C;
	Thu, 25 May 2023 01:52:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D672C002A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 01:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 383E540137
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 01:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 383E540137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xw1zJLtwC3_L
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 01:52:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C01DB40025
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C01DB40025
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 May 2023 01:52:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VjQ-SMm_1684979561; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VjQ-SMm_1684979561) by smtp.aliyun-inc.com;
 Thu, 25 May 2023 09:52:42 +0800
Message-ID: <1684979484.282963-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] tools/virtio: Add .gitignore to ringtest
Date: Thu, 25 May 2023 09:51:24 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Rong Tao <rtoax@foxmail.com>
References: <tencent_C8F0F579940491D14055C82FABE812478505@qq.com>
In-Reply-To: <tencent_C8F0F579940491D14055C82FABE812478505@qq.com>
Cc: "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>, mst@redhat.com,
 Rong Tao <rongtao@cestc.cn>, open list <linux-kernel@vger.kernel.org>
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

On Wed, 24 May 2023 20:36:12 +0800, Rong Tao <rtoax@foxmail.com> wrote:
> From: Rong Tao <rongtao@cestc.cn>
>
> Ignore executions for ringtest.
>
> Signed-off-by: Rong Tao <rongtao@cestc.cn>

Is this the resend mail? Or a new version?

I replyed to your last mail.

THanks.


> ---
>  tools/virtio/ringtest/.gitignore | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 tools/virtio/ringtest/.gitignore
>
> diff --git a/tools/virtio/ringtest/.gitignore b/tools/virtio/ringtest/.gitignore
> new file mode 100644
> index 000000000000..100b9e30c0f4
> --- /dev/null
> +++ b/tools/virtio/ringtest/.gitignore
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +/noring
> +/ptr_ring
> +/ring
> +/virtio_ring_0_9
> +/virtio_ring_inorder
> +/virtio_ring_poll
> --
> 2.39.1
>
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
