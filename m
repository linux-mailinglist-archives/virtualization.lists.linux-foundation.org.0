Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4A24E251
	for <lists.virtualization@lfdr.de>; Fri, 21 Aug 2020 22:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A972A88796;
	Fri, 21 Aug 2020 20:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voIt+x0GgrmQ; Fri, 21 Aug 2020 20:55:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E351B877BF;
	Fri, 21 Aug 2020 20:55:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC3FBC0051;
	Fri, 21 Aug 2020 20:55:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE138C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BC188231A0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luClguWYzlwP
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 20:55:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D23E3230FE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 20:55:08 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22FAA20724;
 Fri, 21 Aug 2020 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598043308;
 bh=lFPj1Yo752ipcEnQysJGQoRPKTfWhUtUxBkOy91w4Yo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2rw4RRpEhcqRsgt+VQ4jfF+2tRRhajw6yJRuUnhFQsLTtoFnaRW6qqDqAr5/uXXEw
 +d+C4ucs0OPpmEOAxsGMX3KgECAuC7XRSkLBNhGUVUGd4rztm3r7KuadavCpY7CNco
 HFfp93yR2RGpqbDsS/6IyB8pLajVOEUu/lqSJpYc=
Date: Fri, 21 Aug 2020 13:55:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 0/6] mm / virtio-mem: support ZONE_MOVABLE
Message-Id: <20200821135507.cc20edbdd11205257cfd86e5@linux-foundation.org>
In-Reply-To: <bb7cad5a-daa3-132e-1bc1-19110476b55e@redhat.com>
References: <20200816125333.7434-1-david@redhat.com>
 <552a2a55-6082-d286-1cd4-7f7e368eebb4@redhat.com>
 <bb7cad5a-daa3-132e-1bc1-19110476b55e@redhat.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Michal Hocko <mhocko@suse.com>,
 Baoquan He <bhe@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Qian Cai <cai@lca.pw>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
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

On Fri, 21 Aug 2020 10:45:33 +0200 David Hildenbrand <david@redhat.com> wrote:

> On 21.08.20 10:31, David Hildenbrand wrote:
> > On 16.08.20 14:53, David Hildenbrand wrote:
> >> For 5.10. Patch #1-#4,#6 have RBs or ACKs, patch #5 is virtio-mem stuff
> >> maintained by me. This should go via the -mm tree.
> >>
> > 
> > @Andrew, can we give this a churn if there are no further comments? Thanks!
> 
> ... I just spotted the patches in -next, strange I didn't get an email
> notification. Thanks :)

https://lore.kernel.org/mm-commits/20200819025501.gJhZlolfC%25akpm@linux-foundation.org/

akpm!=spam :)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
