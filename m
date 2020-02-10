Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D410156FD1
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 08:27:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1E4C86DCA;
	Mon, 10 Feb 2020 07:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zz4hL9z3A7Oh; Mon, 10 Feb 2020 07:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6BB9886E1D;
	Mon, 10 Feb 2020 07:27:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E33AC0171;
	Mon, 10 Feb 2020 07:27:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4640FC0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 07:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2C35985431
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 07:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIlF1k-VA0g8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 07:27:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 492FF84F27
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 07:27:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2020 23:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,424,1574150400"; d="scan'208";a="346993403"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2020 23:27:28 -0800
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 9 Feb 2020 23:27:27 -0800
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 9 Feb 2020 23:27:27 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.126]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.46]) with mapi id 14.03.0439.000;
 Mon, 10 Feb 2020 15:27:25 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: RE: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Thread-Topic: [PATCH RFC] virtio_balloon: conservative balloon page shrinking
Thread-Index: AQHV3Mq/N+pHUOUW3kyXc/hsfZBMQqgQuBMAgAL6SVD//5pYgIAAuzDw
Date: Mon, 10 Feb 2020 07:27:25 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E42AD6D@shsmsx102.ccr.corp.intel.com>
References: <345addae-0945-2f49-52cf-8e53446e63b2@i-love.sakura.ne.jp>
 <286AC319A985734F985F78AFA26841F73E429F32@shsmsx102.ccr.corp.intel.com>
 <202002100357.01A3vNNU089831@www262.sakura.ne.jp>
In-Reply-To: <202002100357.01A3vNNU089831@www262.sakura.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "tysand@google.com" <tysand@google.com>, "namit@vmware.com" <namit@vmware.com>,
 "rientjes@google.com" <rientjes@google.com>,
 "alexander.h.duyck@linux.intel.com" <alexander.h.duyck@linux.intel.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>
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

On Monday, February 10, 2020 11:57 AM, Tetsuo Handa wrote:
> Then, "node-A's NR_FILE_PAGES is already 0 and node-B's NR_FILE_PAGES is
> not 0, but allocation request which triggered this shrinker wants to allocate
> from only node-A"
> would be confused by this change, for the pagecache pages for allocating
> thread's interested node are already depleted but the balloon cannot shrink
> when it should because the pagecache pages for allocating thread's
> uninterested nodes are not yet depleted.

The existing balloon isn't numa aware. "but the balloon cannot shrink " - even we
let balloon to shrink, it could shrink pages from the uninterested node.

When we have a numa aware balloon, we could further update the shrinker
to check with the per node counter , node_page_state(NR_FILE_PAGES).

> 
> >
> Well, my comment is rather: "Do not try to reserve guest's memory. In other
> words, do not try to maintain balloons on the guest side. Since host would
> be able to cache file data on the host's cache, guests would be able to
> quickly fetch file data from host's cache via normal I/O requests." ;-)

Didn't this one. The discussion was about guest pagecache pages v.s. guest balloon pages.
Why is host's pagecache here?

Best,
Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
