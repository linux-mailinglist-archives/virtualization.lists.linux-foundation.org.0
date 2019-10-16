Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B9D8FDE
	for <lists.virtualization@lfdr.de>; Wed, 16 Oct 2019 13:47:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84853D3B;
	Wed, 16 Oct 2019 11:47:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CBFD8CF3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 11:47:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 64DFB70D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 11:47:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id C585FB3E2;
	Wed, 16 Oct 2019 11:47:08 +0000 (UTC)
Date: Wed, 16 Oct 2019 13:47:08 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v3 8/9] mm/memory_hotplug: Introduce
	offline_and_remove_memory()
Message-ID: <20191016114708.GY317@dhcp22.suse.cz>
References: <20190919142228.5483-1-david@redhat.com>
	<20190919142228.5483-9-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919142228.5483-9-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>, Oscar Salvador <osalvador@suse.com>,
	Pavel Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
	Wei Yang <richard.weiyang@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>
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

On Thu 19-09-19 16:22:27, David Hildenbrand wrote:
> virtio-mem wants to offline and remove a memory block once it unplugged
> all subblocks (e.g., using alloc_contig_range()). Let's provide
> an interface to do that from a driver. virtio-mem already supports to
> offline partially unplugged memory blocks. Offlining a fully unplugged
> memory block will not require to migrate any pages. All unplugged
> subblocks are PageOffline() and have a reference count of 0 - so
> offlining code will simply skip them.
> 
> All we need an interface to trigger the "offlining" and the removing in a
> single operation - to make sure the memory block cannot get onlined by
> user space again before it gets removed.
> 
> To keep things simple, allow to only work on a single memory block.

Without a user it is not really clear why do we need this interface.
I am also not really sure why do you want/need to control beyond the
offlining stage. Care to explain some more?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
