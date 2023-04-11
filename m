Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A95E6DCFCB
	for <lists.virtualization@lfdr.de>; Tue, 11 Apr 2023 04:42:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8559410E9;
	Tue, 11 Apr 2023 02:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8559410E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEARa5YzTwCl; Tue, 11 Apr 2023 02:42:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8E74D410EC;
	Tue, 11 Apr 2023 02:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E74D410EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B85A5C008C;
	Tue, 11 Apr 2023 02:42:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34C77C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 02:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDF23613FD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 02:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF23613FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHxkqjWKbmJE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 02:42:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB183613BB
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB183613BB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Apr 2023 02:42:11 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0Vfq6ma2_1681180924; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vfq6ma2_1681180924) by smtp.aliyun-inc.com;
 Tue, 11 Apr 2023 10:42:05 +0800
Message-ID: <1681180912.9817035-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio_pci: Wait for legacy device to be reset
Date: Tue, 11 Apr 2023 10:41:52 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Angus Chen <angus.chen@jaguarmicro.com>
References: <20230411013833.1305-1-angus.chen@jaguarmicro.com>
In-Reply-To: <20230411013833.1305-1-angus.chen@jaguarmicro.com>
Cc: Angus Chen <angus.chen@jaguarmicro.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, 11 Apr 2023 09:38:32 +0800, Angus Chen <angus.chen@jaguarmicro.com> wrote:
> We read the status of device after reset,
> It is not guaranteed that the device be reseted successfully.
> We can use a while loop to make sure that,like the modern device did.
> The spec is not request it ,but it work.
>
> Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>

LGTM

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


> ---
>  drivers/virtio/virtio_pci_legacy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> index 2257f1b3d8ae..f2d241563e4f 100644
> --- a/drivers/virtio/virtio_pci_legacy.c
> +++ b/drivers/virtio/virtio_pci_legacy.c
> @@ -14,6 +14,7 @@
>   *  Michael S. Tsirkin <mst@redhat.com>
>   */
>
> +#include <linux/delay.h>
>  #include "linux/virtio_pci_legacy.h"
>  #include "virtio_pci_common.h"
>
> @@ -97,7 +98,8 @@ static void vp_reset(struct virtio_device *vdev)
>  	vp_legacy_set_status(&vp_dev->ldev, 0);
>  	/* Flush out the status write, and flush in device writes,
>  	 * including MSi-X interrupts, if any. */
> -	vp_legacy_get_status(&vp_dev->ldev);
> +	while (vp_legacy_get_status(&vp_dev->ldev))
> +		msleep(1);
>  	/* Flush pending VQ/configuration callbacks. */
>  	vp_synchronize_vectors(vdev);
>  }
> --
> 2.25.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
