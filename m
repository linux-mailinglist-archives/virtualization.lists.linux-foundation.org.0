Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D2DBF9B
	for <lists.virtualization@lfdr.de>; Fri, 18 Oct 2019 10:15:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 43026102D;
	Fri, 18 Oct 2019 08:15:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 59E6B1024
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 08:15:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9F70270D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 08:15:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 21B5CB1A4;
	Fri, 18 Oct 2019 08:15:27 +0000 (UTC)
Date: Fri, 18 Oct 2019 10:15:24 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v3 6/9] mm: Allow to offline PageOffline() pages with
	a reference count of 0
Message-ID: <20191018081524.GD5017@dhcp22.suse.cz>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-7-david@redhat.com>
	<20191016114321.GX317@dhcp22.suse.cz>
	<36fef317-78e3-0500-43ba-f537f9a6fea4@redhat.com>
	<20191016140350.GD317@dhcp22.suse.cz>
	<7c7bef01-f904-904a-b0a7-f7b514b8bda8@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c7bef01-f904-904a-b0a7-f7b514b8bda8@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Pingfan Liu <kernelfans@gmail.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Andrea Arcangeli <aarcange@redhat.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, Yu Zhao <yuzhao@google.com>,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Pavel Tatashin <pavel.tatashin@microsoft.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mike Rapoport <rppt@linux.vnet.ibm.com>, Qian Cai <cai@lca.pw>,
	Andrey Ryabinin <aryabinin@virtuozzo.com>,
	Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
	Yang Shi <yang.shi@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	Wei Yang <richardw.yang@linux.intel.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@techsingularity.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed 16-10-19 16:14:52, David Hildenbrand wrote:
> On 16.10.19 16:03, Michal Hocko wrote:
[...]
> > But why cannot you keep the reference count at 1 (do get_page when
> > offlining the page)? In other words as long as the driver knows the page
> > has been returned to the host then it has ref count at 1. Once the page
> > is returned to the guest for whatever reason it can free it to the
> > system by clearing the offline state and put_page.
> 
> I think I explained how the reference count of 1 is problematic when wanting
> to offline the memory. After all that's the problem I try to solve: Keep
> PG_offline set until the memory is offline and make sure nobody will touch
> the page.

Please bear with me but I still believe that elevated reference count
has some merits. I do understand that you maintain your metadata to
recognize that the memory handed over to the hypervisor will not
magically appear after onlining. But I believe that you can achieve
the same with an elevated reference count and have a more robust design
as well.

Let's say that you still keep a reference to your offlined pages and
mark them offlined. That should make sure that no consumer of the
pfn_to_online_page will touch the page's content nor the state. Now
admin might want to offline/hotremove the whole memory block via sysfs.
An elevated reference count would prevent offlining to finish. And I
believe this is a good thing because the owner of the offline page might
still need to do something to "untrack" that page. We have an interface
for that - MEM_GOING_OFFLINE notification. This sounds like a good place
for the driver to decide whether it is safe to let the page go or not.
If you can let the page go then just drop the reference count. The page
is isolated already by that time. If you cannot let it go for whatever
reason you can fail the offlining.

An advantage is that the driver has the full control over offlining and
also you do not really have to track a new online request to do the
right thing.

Or do I still see it too simplistically and the notifier is not a good
place to handle the reference count?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
