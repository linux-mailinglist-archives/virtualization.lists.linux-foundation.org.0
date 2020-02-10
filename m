Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 58938156E25
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 04:57:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0F6D885232;
	Mon, 10 Feb 2020 03:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmIEIG-mB45v; Mon, 10 Feb 2020 03:57:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A3A885361;
	Mon, 10 Feb 2020 03:57:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27E1CC07FE;
	Mon, 10 Feb 2020 03:57:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C01AC0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8A5BF854A0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jD2i5ZacLYTE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B16185497
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 03:57:40 +0000 (UTC)
Received: from fsav108.sakura.ne.jp (fsav108.sakura.ne.jp [27.133.134.235])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 01A3vOwI089837;
 Mon, 10 Feb 2020 12:57:24 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav108.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav108.sakura.ne.jp);
 Mon, 10 Feb 2020 12:57:24 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav108.sakura.ne.jp)
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 01A3vNQ5089833;
 Mon, 10 Feb 2020 12:57:24 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: (from i-love@localhost)
 by www262.sakura.ne.jp (8.15.2/8.15.2/Submit) id 01A3vNNU089831;
 Mon, 10 Feb 2020 12:57:23 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Message-Id: <202002100357.01A3vNNU089831@www262.sakura.ne.jp>
X-Authentication-Warning: www262.sakura.ne.jp: i-love set sender to
 penguin-kernel@i-love.sakura.ne.jp using -f
Subject: RE: [PATCH RFC]
 =?ISO-2022-JP?B?dmlydGlvX2JhbGxvb246IGNvbnNlcnZhdGl2ZSBi?=
 =?ISO-2022-JP?B?YWxsb29uIHBhZ2Ugc2hyaW5raW5n?=
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: "Wang, Wei W" <wei.w.wang@intel.com>
MIME-Version: 1.0
Date: Mon, 10 Feb 2020 12:57:23 +0900
References: <345addae-0945-2f49-52cf-8e53446e63b2@i-love.sakura.ne.jp>
 <286AC319A985734F985F78AFA26841F73E429F32@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <286AC319A985734F985F78AFA26841F73E429F32@shsmsx102.ccr.corp.intel.com>
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

Wang, Wei W wrote:
> On Saturday, February 8, 2020 8:33 PM, Tetsuo Handa wrote:
> > 
> > Is this NUMA aware? Can "node-A's NR_FILE_PAGES is already 0 and
> > node-B's NR_FILE_PAGES is not 0, but allocation request which triggered this
> > shrinker wants to allocate from only node-B" happen? 
> 
> No, it's a global counter.
> 
> >Can some thread keep
> > this shrinker defunctional by keep increasing NR_FILE_PAGES?
> 
> Yes. Actually it's our intention - as long as there are pagecache pages,
> balloon pages are avoided to be reclaimed.

Then, "node-A's NR_FILE_PAGES is already 0 and node-B's NR_FILE_PAGES is not 0, but
allocation request which triggered this shrinker wants to allocate from only node-A"
would be confused by this change, for the pagecache pages for allocating thread's
interested node are already depleted but the balloon cannot shrink when it should
because the pagecache pages for allocating thread's uninterested nodes are not yet
depleted.

> 
> 
> > 
> > Is this patch from "Re: Balloon pressuring page cache" thread? I hope that
> > the guest could start reclaiming memory based on host's request (like OOM
> > notifier chain) which is issued when host thinks that host is getting close to
> > OOM and thus guests should start returning their unused memory to host.
> > Maybe "periodically (e.g. 5 minutes)" in addition to "upon close to OOM
> > condition" is also possible.
> 
> That's about the host usages. The host side management software decides when to
> issue a request to balloon (either periodically or event driven), I think there
> isn't anything we need to do in the balloon driver here.

Well, my comment is rather: "Do not try to reserve guest's memory. In other words,
do not try to maintain balloons on the guest side. Since host would be able to cache
file data on the host's cache, guests would be able to quickly fetch file data from
host's cache via normal I/O requests." ;-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
