Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899A1221B3
	for <lists.virtualization@lfdr.de>; Tue, 17 Dec 2019 02:53:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1D5E877AD;
	Tue, 17 Dec 2019 01:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKt5qkeFOZbx; Tue, 17 Dec 2019 01:53:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3032E877A8;
	Tue, 17 Dec 2019 01:53:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12F8DC077D;
	Tue, 17 Dec 2019 01:53:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D4E5C077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 01:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 44164877A8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 01:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40Lp+VX14SXG
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 01:53:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0CE21877A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 01:53:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 17:53:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; d="scan'208";a="205313142"
Received: from unknown (HELO [10.239.13.7]) ([10.239.13.7])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2019 17:53:24 -0800
Message-ID: <5DF836BE.4040108@intel.com>
Date: Tue, 17 Dec 2019 10:00:30 +0800
From: Wei Wang <wei.w.wang@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Daniel Verkamp <dverkamp@chromium.org>, 
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] virtio-balloon: request nvqs based on features
References: <20191216231429.38202-1-dverkamp@chromium.org>
In-Reply-To: <20191216231429.38202-1-dverkamp@chromium.org>
Cc: Liang Li <liang.z.li@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
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

On 12/17/2019 07:14 AM, Daniel Verkamp wrote:
> After 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT"),
> the virtio-balloon device unconditionally specifies 4 virtqueues as the
> argument to find_vqs(), which means that 5 MSI-X vectors are required in
> order to assign one vector per VQ plus one for configuration changes.
>
> However, in cases where the virtio device only provides exactly as many
> MSI-X vectors as required for the features it implements (e.g. 3 for the
> basic configuration of inflate + deflate + config), this results in the
> selection of the fallback configuration where one interrupt vector is
> used for all VQs instead of having one VQ per vector.

I'm not sure if I get the above. Virtio won't do any vq allocation for
the one that has "callbacks[i] = NULL", so no msi-x vector will be
assigned for it.

Btw, did you trigger any bug with the existing code?

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
