Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D04B1A8FC7
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 02:39:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3EA9185DE1;
	Wed, 15 Apr 2020 00:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kc3s13YUPiWI; Wed, 15 Apr 2020 00:39:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DE1D485CA8;
	Wed, 15 Apr 2020 00:39:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D052DC0172;
	Wed, 15 Apr 2020 00:39:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AC03C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 113E385CFF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChqXC6hfcJJW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:20 +0000 (UTC)
X-Greylist: delayed 00:08:32 by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9313B85CA8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:39:20 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91C5A20737;
 Wed, 15 Apr 2020 00:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586910748;
 bh=HvJc20wttgkQ6cXIPl8+VzaV7/yOLVniYB4h4rOwlRo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H6IMOM6bmdu7agO4W0V7CUpAfzne/1y61nYags75iWcd61bH7yg8z0lHlOWc8EKCl
 l/9jq1xRAa92gfLuE7N4J66kpqxHS6Jws+slcBuGV1k7KXIpgAq9/UYSwedtpmB0pN
 wnOEO6HJ7ceu3knFv+NeFo7BV+JXcPHfPZ/Bmn7w=
Date: Tue, 14 Apr 2020 17:32:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 05/10] mm: Allow to offline unmovable PageOffline()
 pages via MEM_GOING_OFFLINE
Message-Id: <20200414173227.ac71566702c0561f42baa83f@linux-foundation.org>
In-Reply-To: <20200414123334-mutt-send-email-mst@kernel.org>
References: <20200311171422.10484-1-david@redhat.com>
 <20200311171422.10484-6-david@redhat.com>
 <20200414123334-mutt-send-email-mst@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 Pingfan Liu <kernelfans@gmail.com>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtio-dev@lists.oasis-open.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Qian Cai <cai@lca.pw>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Mel Gorman <mgorman@techsingularity.net>
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

On Tue, 14 Apr 2020 12:34:26 -0400 "Michael S. Tsirkin" <mst@redhat.com> wrote:

> Andrew, could you please ack merging this through the vhost tree
> together with the rest of the patches?

Acked-by: Andrew Morton <akpm@linux-foundation.org>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
