Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1AD6EBD80
	for <lists.virtualization@lfdr.de>; Sun, 23 Apr 2023 08:51:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA1D405C0;
	Sun, 23 Apr 2023 06:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA1D405C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KSNBNwSNNJJo; Sun, 23 Apr 2023 06:51:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4068C405F7;
	Sun, 23 Apr 2023 06:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4068C405F7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 632DFC008A;
	Sun, 23 Apr 2023 06:51:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA978C002A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87BCE60F49
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87BCE60F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNB6ef9wnCq0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5151660E11
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5151660E11
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:45 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0Vgimp-a_1682232700; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vgimp-a_1682232700) by smtp.aliyun-inc.com;
 Sun, 23 Apr 2023 14:51:41 +0800
Message-ID: <1682232694.2048266-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] tools/virtio: ringtest: Add .gitignore
Date: Sun, 23 Apr 2023 14:51:34 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Rong Tao <rtoax@foxmail.com>
References: <tencent_B2592997622AA2AF59A31E88DB069C424408@qq.com>
In-Reply-To: <tencent_B2592997622AA2AF59A31E88DB069C424408@qq.com>
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

On Fri, 21 Apr 2023 20:04:33 +0800, Rong Tao <rtoax@foxmail.com> wrote:
> From: Rong Tao <rongtao@cestc.cn>
>
> Ignore ringtest binaries.
>
> Signed-off-by: Rong Tao <rongtao@cestc.cn>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

> ---
>  tools/virtio/ringtest/.gitignore | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 tools/virtio/ringtest/.gitignore
>
> diff --git a/tools/virtio/ringtest/.gitignore b/tools/virtio/ringtest/.gitignore
> new file mode 100644
> index 000000000000..4c6f4bad6b5d
> --- /dev/null
> +++ b/tools/virtio/ringtest/.gitignore
> @@ -0,0 +1,6 @@
> +/noring
> +/ptr_ring
> +/ring
> +/virtio_ring_0_9
> +/virtio_ring_inorder
> +/virtio_ring_poll
> --
> 2.39.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
