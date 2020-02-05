Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A1152668
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 07:49:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4EF8C84032;
	Wed,  5 Feb 2020 06:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmi8mZEBhfck; Wed,  5 Feb 2020 06:49:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 865738204B;
	Wed,  5 Feb 2020 06:49:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66E84C0174;
	Wed,  5 Feb 2020 06:49:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2F59C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B5A67862B1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tprq4JnLt0qf
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:49:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1C8AE86190
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 06:49:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 22:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,404,1574150400"; d="scan'208";a="220004772"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga007.jf.intel.com with ESMTP; 04 Feb 2020 22:49:26 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 4 Feb 2020 22:49:26 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 4 Feb 2020 22:49:25 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 4 Feb 2020 22:49:25 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.126]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.196]) with mapi id 14.03.0439.000;
 Wed, 5 Feb 2020 14:49:24 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: Balloon pressuring page cache
Thread-Topic: Balloon pressuring page cache
Thread-Index: AQHV1jovoZrFI2PKjUOgo5GIAcuyoKgA6/YAgACRPICAAUzXAIAAibNg///JVwCABdc9AIAANGSAgAAETACAAGklgIAAo12AgAABfACAAGGxgIABj+gw
Date: Wed, 5 Feb 2020 06:49:23 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E41F0F0@shsmsx102.ccr.corp.intel.com>
References: <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
 <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
In-Reply-To: <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>, Michal
 Hocko <mhocko@kernel.org>
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

On Tuesday, February 4, 2020 10:30 PM, David Hildenbrand wrote:
> So, I am trying to understand how the code is intended to work, but I am
> afraid I am missing something (or to rephrase: I think I found a BUG :) and
> there is lack of proper documentation about this feature).
> 
> a) We allocate pages and add them to the list as long as we are told to do
> so.
>    We send these pages to the host one by one.
> b) We free all pages once we get a STOP signal. Until then, we keep pages
> allocated.

Yes. Either host sends to the guest a STOP cmd or when the guest fails to allocate a page (meaning that all the possible free pages are taken already),
the reporting ends.

> c) When called via the shrinker, we want to free pages from the list, even
> though the hypervisor did not notify us to do so.
> 
> 
> Issue 1: When we unload the balloon driver in the guest in an unlucky event,
> we won't free the pages. We are missing something like (if I am not wrong):
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index b1d2068fa2bd..e2b0925e1e83 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -929,6 +929,10 @@ static void remove_common(struct virtio_balloon
> *vb)
>                 leak_balloon(vb, vb->num_pages);
>         update_balloon_size(vb);
> 
> +       /* There might be free pages that are being reported: release them.
> */
> +       if (virtio_has_feature(vb->vdev,
> VIRTIO_BALLOON_F_FREE_PAGE_HINT))
> +               return_free_pages_to_mm(vb, ULONG_MAX);
> +
>         /* Now we reset the device so we can clean up the queues. */
>         vb->vdev->config->reset(vb->vdev);


Right, thanks!

> 
> 
> Issue 2: When called via the shrinker, (but also to fix Issue 1), it could be that
> we do have VIRTIO_BALLOON_F_MUST_TELL_HOST. 

I don't think it is an issue here.
MUST_TELL_HOST is for the ballooning pages, where pages are offered to host to _USE_.
For free page hint, as the name already suggests, it's just a _HINT_ , so in whatever use case,
the host should not take the page to use. So the guest doesn't need to tell host and wait.

Back to the implementation of virtio_balloon_shrinker_scan, which I don't see an issue so far:
shrink_free_pages just return pages to mm without waiting for the ack from host
shrink_balloon_pages goes through leak_balloon which tell_host before release the balloon pages.

Best,
Wei

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
