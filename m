Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FD2302F0
	for <lists.virtualization@lfdr.de>; Tue, 28 Jul 2020 08:30:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 99FFA87E53;
	Tue, 28 Jul 2020 06:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWB1mRpX9veL; Tue, 28 Jul 2020 06:30:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54BEE87E4D;
	Tue, 28 Jul 2020 06:30:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3381AC004D;
	Tue, 28 Jul 2020 06:30:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1227EC004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1101087E55
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwUpKE2vKnMF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:30:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7553287E4D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Jul 2020 06:30:13 +0000 (UTC)
IronPort-SDR: yioNJEeI0+CB0b2DXGCt9PFCPShAsDWYOSCuElUacD1WOcKg5bNsaXDApkdvnmO8QpE3oUjt6+
 0oBzb3wuRuDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="152412314"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="152412314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 23:30:12 -0700
IronPort-SDR: DWFcw058aeNY33KCMXeApCFDsG3k6E7ZcSfHBPcNVTPWRdWaBobV5jB8SpVRTW/cLo+QKp2tl2
 6pcV2+CqE9Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; d="scan'208";a="434208391"
Received: from unknown (HELO [10.239.13.4]) ([10.239.13.4])
 by orsmga004.jf.intel.com with ESMTP; 27 Jul 2020 23:30:10 -0700
Message-ID: <5F1FC796.3090105@intel.com>
Date: Tue, 28 Jul 2020 14:37:10 +0800
From: Wei Wang <wei.w.wang@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] virtio_balloon: fix up endian-ness for free cmd id
References: <20200727160310.102494-1-mst@redhat.com>
In-Reply-To: <20200727160310.102494-1-mst@redhat.com>
Cc: Liang Li <liang.z.li@intel.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 virtualization@lists.linux-foundation.org, stable@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 07/28/2020 12:03 AM, Michael S. Tsirkin wrote:
> free cmd id is read using virtio endian, spec says all fields
> in balloon are LE. Fix it up.
>
> Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   drivers/virtio/virtio_balloon.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 774deb65a9bb..798ec304fe3e 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -578,10 +578,14 @@ static int init_vqs(struct virtio_balloon *vb)
>   static u32 virtio_balloon_cmd_id_received(struct virtio_balloon *vb)
>   {
>   	if (test_and_clear_bit(VIRTIO_BALLOON_CONFIG_READ_CMD_ID,
> -			       &vb->config_read_bitmap))
> +			       &vb->config_read_bitmap)) {
>   		virtio_cread(vb->vdev, struct virtio_balloon_config,
>   			     free_page_hint_cmd_id,
>   			     &vb->cmd_id_received_cache);
> +		/* Legacy balloon config space is LE, unlike all other devices. */
> +		if (!virtio_has_feature(vb->vdev, VIRTIO_F_VERSION_1))
> +			vb->cmd_id_received_cache = le32_to_cpu((__force __le32)vb->cmd_id_received_cache);
Seems it exceeds 80 character length.

Reviewed-by: Wei Wang <wei.w.wang@intel.com>

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
