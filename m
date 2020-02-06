Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A41540BF
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 09:57:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC738847D9;
	Thu,  6 Feb 2020 08:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MG-Dene0q5SS; Thu,  6 Feb 2020 08:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC6EC8489F;
	Thu,  6 Feb 2020 08:57:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5323C013E;
	Thu,  6 Feb 2020 08:57:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55A91C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4DFF586981
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoSZgO1RV5CL
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:57:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F24386961
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:57:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 00:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,409,1574150400"; d="scan'208";a="404425769"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga005.jf.intel.com with ESMTP; 06 Feb 2020 00:57:07 -0800
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 6 Feb 2020 00:57:07 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 6 Feb 2020 00:57:06 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.126]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.98]) with mapi id 14.03.0439.000;
 Thu, 6 Feb 2020 16:57:05 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Thread-Topic: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Thread-Index: AQHV3EIpfQc0Q8o+LUGdBo475Vlup6gN3WAA
Date: Thu, 6 Feb 2020 08:57:05 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E4237B0@shsmsx102.ccr.corp.intel.com>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
In-Reply-To: <20200205163402.42627-4-david@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Nadav Amit <namit@vmware.com>, David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

On Thursday, February 6, 2020 12:34 AM, David Hildenbrand wrote:
> Commit 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
> changed the behavior when deflation happens automatically. Instead of
> deflating when called by the OOM handler, the shrinker is used.
> 
> However, the balloon is not simply some slab cache that should be shrunk
> when under memory pressure. The shrinker does not have a concept of
> priorities, so this behavior cannot be configured.
> 
> There was a report that this results in undesired side effects when inflating
> the balloon to shrink the page cache. [1]
> 	"When inflating the balloon against page cache (i.e. no free memory
> 	 remains) vmscan.c will both shrink page cache, but also invoke the
> 	 shrinkers -- including the balloon's shrinker. So the balloon
> 	 driver allocates memory which requires reclaim, vmscan gets this
> 	 memory by shrinking the balloon, and then the driver adds the
> 	 memory back to the balloon. Basically a busy no-op."

Not sure if we need to go back to OOM, which has many drawbacks as we discussed.
Just posted out another approach, which is simple.

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
