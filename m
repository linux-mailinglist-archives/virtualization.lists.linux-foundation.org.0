Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB2E2C87
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 10:51:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BA7BEC6E;
	Thu, 24 Oct 2019 08:51:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E9EA9C6F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 08:51:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 72AF9831
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571907102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=lnyRFowsWF5QYMMd1VIb315q6cqM9g6cNTbkhsVIFwY=;
	b=TAxe4JhRljZb0zSy9brVPxevigoWux+T+c0a5/aOjOyqr4L06OSjWVL8xrDhr6MRzP+HjX
	OV7GxQ20OXOa3idO9P4IkVCChsWqVSI91rtjgdZvwAwTdgHIUQCsxoOwyTs3whQRG1kOIA
	I2Cy1TWBNn7PukBu705yI7E5LWBbxpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-5Lm1o1o6NF-7eXSyS2DM_w-1; Thu, 24 Oct 2019 04:51:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF1D71005500;
	Thu, 24 Oct 2019 08:51:34 +0000 (UTC)
Received: from [10.36.117.225] (ovpn-117-225.ams2.redhat.com [10.36.117.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCDB61001B05;
	Thu, 24 Oct 2019 08:51:28 +0000 (UTC)
Subject: Re: [PATCH RFC v3 6/9] mm: Allow to offline PageOffline() pages with
	a reference count of 0
To: Michal Hocko <mhocko@kernel.org>
References: <20191016140350.GD317@dhcp22.suse.cz>
	<7c7bef01-f904-904a-b0a7-f7b514b8bda8@redhat.com>
	<20191018081524.GD5017@dhcp22.suse.cz>
	<83d0a961-952d-21e4-74df-267912b7b6fa@redhat.com>
	<20191018111843.GH5017@dhcp22.suse.cz>
	<709d39aa-a7ba-97aa-e66b-e2fec2fdf3c4@redhat.com>
	<20191022122326.GL9379@dhcp22.suse.cz>
	<b4be42a4-cbfc-8706-cc94-26211ddcbe4a@redhat.com>
	<20191023094345.GL754@dhcp22.suse.cz>
	<ad2aef12-61ac-f019-90d1-59637255f9e3@redhat.com>
	<20191024084241.GV17610@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <ba7164c9-b98e-0ce1-358e-8b0d45fe3f48@redhat.com>
Date: Thu, 24 Oct 2019 10:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024084241.GV17610@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 5Lm1o1o6NF-7eXSyS2DM_w-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 24.10.19 10:42, Michal Hocko wrote:
> On Wed 23-10-19 12:03:51, David Hildenbrand wrote:
>>> Do you see any downsides?
>>
>> The only downside I see is that we get more false negatives on
>> has_unmovable_pages(), eventually resulting in the offlining stage after
>> isolation to loop forever (as some PageOffline() pages are not movable
>> (especially, XEN balloon, HyperV balloon), there won't be progress).
>>
>> I somewhat don't like forcing everybody that uses PageOffline() (especially
>> all users of balloon compaction) to implement memory notifiers just to avoid
>> that. Maybe, we even want to use PageOffline() in the future in the core
>> (e.g., for memory holes instead of PG_reserved or similar).
> 
> There is only a handful of those and we need to deal with them anyway.
> If you do not want to enforce them to create their own notifiers then we
> can accomodate the hotplug code. __test_page_isolated_in_pageblock resp.

Yeah, I would prefer offlining code to be able to deal with that without 
notifier changes for all users.

> the call chain up can distinguish temporary and permanent failures
> (EAGAIN vs. EBUSY). The current state when we always return EBUSY and
> keep retrying for ever is not optimal at all, right? A referenced PageOffline

Very right!

> could be an example of EBUSY all other failures where we are effectively
> waiting for pages to get freed finaly would be EAGAIN.

We have to watch out for PageOffline() pages that are actually movable 
(balloon compaction). But that doesn't sound too hard.
> 
> It is a bit late in the process because a large portion of the work has
> been done already but this doesn't sound like something to lose sleep
> over.
> 

Right. I'll look into that to find out if this would work. And see if I 
can reproduce what I described at all (theoretical thoughts) :)

Again, thanks for looking into this Michal!

-- 

Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
