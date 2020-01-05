Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C81307F6
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 13:24:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 87EB787360;
	Sun,  5 Jan 2020 12:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1wROi3dmDFM; Sun,  5 Jan 2020 12:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 12D05874CF;
	Sun,  5 Jan 2020 12:24:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB293C0881;
	Sun,  5 Jan 2020 12:24:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 560D6C0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3540E874CF
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:24:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EJbWqO1IxZId
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:24:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DF30C87360
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 12:24:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jan 2020 04:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,398,1571727600"; d="scan'208";a="216612621"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jan 2020 04:24:14 -0800
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 5 Jan 2020 04:24:14 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 5 Jan 2020 04:24:13 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.202]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.245]) with mapi id 14.03.0439.000;
 Sun, 5 Jan 2020 20:24:12 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Daniel Verkamp <dverkamp@chromium.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: [PATCH v2 1/2] virtio-balloon: initialize all vq callbacks
Thread-Topic: [PATCH v2 1/2] virtio-balloon: initialize all vq callbacks
Thread-Index: AQHVwmVar6ef2LyxI0SiR1GCSEPNVafb/HDA
Date: Sun, 5 Jan 2020 12:24:11 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E39205A@shsmsx102.ccr.corp.intel.com>
References: <20200103184044.73568-1-dverkamp@chromium.org>
In-Reply-To: <20200103184044.73568-1-dverkamp@chromium.org>
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
> Subject: [PATCH v2 1/2] virtio-balloon: initialize all vq callbacks
> 
> Ensure that elements of the callbacks array that correspond to unavailable
> features are set to NULL; previously, they would be left uninitialized.
> 
> Since the corresponding names array elements were explicitly set to NULL,
> the uninitialized callback pointers would not actually be dereferenced;
> however, the uninitialized callbacks elements would still be read in 
> vp_find_vqs_msix() and used to calculate the number of MSI-X vectors
> required.

The above description doesn't seem true after your second patch gets applied.
 
> Cc: stable@vger.kernel.org
> Fixes: 86a559787e6f ("virtio-balloon:
> VIRTIO_BALLOON_F_FREE_PAGE_HINT")
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
> ---
> 
> v1:
> https://lists.linuxfoundation.org/pipermail/virtualization/2019-December/04
> 4829.html
> 
> Changes from v1:
> - Clarified "array" in commit message to "callbacks array"
> 
>  drivers/virtio/virtio_balloon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 93f995f6cf36..8e400ece9273 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -475,7 +475,9 @@ static int init_vqs(struct virtio_balloon *vb)
>  	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
>  	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
>  	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
> +	callbacks[VIRTIO_BALLOON_VQ_STATS] = NULL;
>  	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
> +	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;

Could you remove other redundant NULL initialization well?
https://lists.linuxfoundation.org/pipermail/virtualization/2019-December/044837.html

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
