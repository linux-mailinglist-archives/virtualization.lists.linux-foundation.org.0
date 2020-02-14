Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B215D884
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 14:32:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EAFEF87B6D;
	Fri, 14 Feb 2020 13:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khuKdglaJ8az; Fri, 14 Feb 2020 13:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5ACC87FB5;
	Fri, 14 Feb 2020 13:31:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72F36C0177;
	Fri, 14 Feb 2020 13:31:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B2F2C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5A3D587609
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcmnl2t5suAc
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:31:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8211D875F0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 13:31:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 05:31:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,440,1574150400"; d="scan'208";a="381442955"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga004.jf.intel.com with ESMTP; 14 Feb 2020 05:31:54 -0800
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 14 Feb 2020 05:31:54 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 14 Feb 2020 05:31:53 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.126]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.138]) with mapi id 14.03.0439.000;
 Fri, 14 Feb 2020 21:31:51 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Thread-Topic: [PATCH v1 3/3] virtio-balloon: Switch back to OOM handler for
 VIRTIO_BALLOON_F_DEFLATE_ON_OOM
Thread-Index: AQHV3EIpfQc0Q8o+LUGdBo475Vlup6gZ+hiAgADBtnA=
Date: Fri, 14 Feb 2020 13:31:51 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E4392AF@shsmsx102.ccr.corp.intel.com>
References: <20200205163402.42627-1-david@redhat.com>
 <20200205163402.42627-4-david@redhat.com>
 <f31eff75-b328-de41-c2cc-e55471aa27d8@redhat.com>
In-Reply-To: <f31eff75-b328-de41-c2cc-e55471aa27d8@redhat.com>
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

On Friday, February 14, 2020 5:52 PM, David Hildenbrand wrote:
> > Commit 71994620bb25 ("virtio_balloon: replace oom notifier with
> > shrinker") changed the behavior when deflation happens automatically.
> > Instead of deflating when called by the OOM handler, the shrinker is used.
> >
> > However, the balloon is not simply some slab cache that should be
> > shrunk when under memory pressure. The shrinker does not have a
> > concept of priorities, so this behavior cannot be configured.
> >
> > There was a report that this results in undesired side effects when
> > inflating the balloon to shrink the page cache. [1]
> > 	"When inflating the balloon against page cache (i.e. no free memory
> > 	 remains) vmscan.c will both shrink page cache, but also invoke the
> > 	 shrinkers -- including the balloon's shrinker. So the balloon
> > 	 driver allocates memory which requires reclaim, vmscan gets this
> > 	 memory by shrinking the balloon, and then the driver adds the
> > 	 memory back to the balloon. Basically a busy no-op."
> >
> > The name "deflate on OOM" makes it pretty clear when deflation should
> > happen - after other approaches to reclaim memory failed, not while
> > reclaiming. This allows to minimize the footprint of a guest - memory
> > will only be taken out of the balloon when really needed.
> >
> > Especially, a drop_slab() will result in the whole balloon getting
> > deflated - undesired. While handling it via the OOM handler might not
> > be perfect, it keeps existing behavior. If we want a different
> > behavior, then we need a new feature bit and document it properly
> > (although, there should be a clear use case and the intended effects should
> be well described).
> >
> > Keep using the shrinker for VIRTIO_BALLOON_F_FREE_PAGE_HINT,
> because
> > this has no such side effects. Always register the shrinker with
> > VIRTIO_BALLOON_F_FREE_PAGE_HINT now. We are always allowed to
> reuse
> > free pages that are still to be processed by the guest. The hypervisor
> > takes care of identifying and resolving possible races between
> > processing a hinting request and the guest reusing a page.
> >
> > In contrast to pre commit 71994620bb25 ("virtio_balloon: replace oom
> > notifier with shrinker"), don't add a moodule parameter to configure
> > the number of pages to deflate on OOM. Can be re-added if really needed.
> > Also, pay attention that leak_balloon() returns the number of 4k pages
> > - convert it properly in virtio_balloon_oom_notify().
> >
> > Note1: using the OOM handler is frowned upon, but it really is what we
> >        need for this feature.
> >
> > Note2: without VIRTIO_BALLOON_F_MUST_TELL_HOST (iow, always with
> QEMU) we
> >        could actually skip sending deflation requests to our hypervisor,
> >        making the OOM path *very* simple. Besically freeing pages and
> >        updating the balloon. If the communication with the host ever
> >        becomes a problem on this call path.
> >
> 
> @Michael, how to proceed with this?
> 

I vote for not going back. When there are solid request and strong reasons in the future, we could reopen this discussion.

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
