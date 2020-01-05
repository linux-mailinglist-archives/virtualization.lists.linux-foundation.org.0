Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DB81307F8
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 13:27:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 088E920495;
	Sun,  5 Jan 2020 12:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmcXCb0859tO; Sun,  5 Jan 2020 12:27:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A872E20475;
	Sun,  5 Jan 2020 12:27:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B995C0881;
	Sun,  5 Jan 2020 12:27:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8FDFC0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D2AB484ADA
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTHB92LMQ5SW
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:27:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1BD608494E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:27:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jan 2020 04:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,398,1571727600"; d="scan'208";a="420449179"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jan 2020 04:27:22 -0800
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 5 Jan 2020 04:27:22 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 5 Jan 2020 04:27:21 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.202]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.132]) with mapi id 14.03.0439.000;
 Sun, 5 Jan 2020 20:27:20 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Daniel Verkamp <dverkamp@chromium.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: [PATCH v2 2/2] virtio-pci: check name when counting MSI-X vectors
Thread-Topic: [PATCH v2 2/2] virtio-pci: check name when counting MSI-X vectors
Thread-Index: AQHVwmWt1eYUSe070EWbJPmgPgfCyafcAanA
Date: Sun, 5 Jan 2020 12:27:19 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E39206A@shsmsx102.ccr.corp.intel.com>
References: <20200103184044.73568-1-dverkamp@chromium.org>
 <20200103184044.73568-2-dverkamp@chromium.org>
In-Reply-To: <20200103184044.73568-2-dverkamp@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Cornelia Huck <cohuck@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

On Saturday, January 4, 2020 2:41 AM, Daniel Verkamp wrote:
> Subject: [PATCH v2 2/2] virtio-pci: check name when counting MSI-X vectors
> 
> VQs without a name specified are not valid; they are skipped in the later loop
> that assigns MSI-X vectors to queues, but the per_vq_vectors loop above that
> counts the required number of vectors previously still counted any queue with a
> non-NULL callback as needing a vector.
> 
> Add a check to the per_vq_vectors loop so that vectors with no name are not
> counted to make the two loops consistent.  This prevents over-counting
> unnecessary vectors (e.g. for features which were not negotiated with the
> device).
> 
> Cc: stable@vger.kernel.org
> Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> ---
> 
> v1:
> https://lists.linuxfoundation.org/pipermail/virtualization/2019-December/0448
> 28.html
> 
>  drivers/virtio/virtio_pci_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_pci_common.c
> b/drivers/virtio/virtio_pci_common.c
> index f2862f66c2ac..222d630c41fc 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -294,7 +294,7 @@ static int vp_find_vqs_msix(struct virtio_device *vdev,
> unsigned nvqs,
>  		/* Best option: one for change interrupt, one per vq. */
>  		nvectors = 1;
>  		for (i = 0; i < nvqs; ++i)
> -			if (callbacks[i])
> +			if (names[i] && callbacks[i])
>  				++nvectors;
>  	} else {
>  		/* Second best: one for change, shared for all vqs. */
> --
> 2.24.1.735.g03f4e72817-goog

Reviewed-by: Wang, Wei W <wei.w.wang@intel.com>

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
