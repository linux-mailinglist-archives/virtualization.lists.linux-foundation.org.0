Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 70154156DC9
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 04:14:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CA080852FE;
	Mon, 10 Feb 2020 03:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pIR7f11dTFK; Mon, 10 Feb 2020 03:14:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D95C0852E9;
	Mon, 10 Feb 2020 03:14:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2038C0171;
	Mon, 10 Feb 2020 03:14:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24790C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D9418734E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktV-n8k4HPWj
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:14:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 69FBA87327
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:14:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2020 19:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,423,1574150400"; d="scan'208";a="227061106"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2020 19:13:58 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 9 Feb 2020 19:13:23 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 9 Feb 2020 19:13:23 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.126]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.138]) with mapi id 14.03.0439.000;
 Mon, 10 Feb 2020 11:13:21 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Thread-Topic: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Thread-Index: AQHV3Mq/N+pHUOUW3kyXc/hsfZBMQqgQuBMAgAL6SVA=
Date: Mon, 10 Feb 2020 03:13:21 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E429F32@shsmsx102.ccr.corp.intel.com>
References: <1580976107-16013-1-git-send-email-wei.w.wang@intel.com>
 <345addae-0945-2f49-52cf-8e53446e63b2@i-love.sakura.ne.jp>
In-Reply-To: <345addae-0945-2f49-52cf-8e53446e63b2@i-love.sakura.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "mst@redhat.com" <mst@redhat.com>, "mhocko@kernel.org" <mhocko@kernel.org>,
 "tysand@google.com" <tysand@google.com>, "namit@vmware.com" <namit@vmware.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "alexander.h.duyck@linux.intel.com" <alexander.h.duyck@linux.intel.com>
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

On Saturday, February 8, 2020 8:33 PM, Tetsuo Handa wrote:
> 
> Is this NUMA aware? Can "node-A's NR_FILE_PAGES is already 0 and
> node-B's NR_FILE_PAGES is not 0, but allocation request which triggered this
> shrinker wants to allocate from only node-B" happen? 

No, it's a global counter.

>Can some thread keep
> this shrinker defunctional by keep increasing NR_FILE_PAGES?

Yes. Actually it's our intention - as long as there are pagecache pages,
balloon pages are avoided to be reclaimed.


> 
> Is this patch from "Re: Balloon pressuring page cache" thread? I hope that
> the guest could start reclaiming memory based on host's request (like OOM
> notifier chain) which is issued when host thinks that host is getting close to
> OOM and thus guests should start returning their unused memory to host.
> Maybe "periodically (e.g. 5 minutes)" in addition to "upon close to OOM
> condition" is also possible.

That's about the host usages. The host side management software decides when to issue a request to balloon (either periodically or event driven), I think there isn't anything we need to do in the balloon driver here.

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
