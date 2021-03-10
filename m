Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A28EE3344D6
	for <lists.virtualization@lfdr.de>; Wed, 10 Mar 2021 18:11:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B632E60608;
	Wed, 10 Mar 2021 17:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuLwkQEvEk0a; Wed, 10 Mar 2021 17:11:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846256F487;
	Wed, 10 Mar 2021 17:11:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B13CC0010;
	Wed, 10 Mar 2021 17:11:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9852C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 17:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2DB14EC8A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 17:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZIjVgW-S9dL
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 17:11:41 +0000 (UTC)
X-Greylist: delayed 00:30:05 by SQLgrey-1.8.0
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39FFF4EC4D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 17:11:41 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lK1ia-004clg-19; Wed, 10 Mar 2021 16:29:52 +0000
Date: Wed, 10 Mar 2021 16:29:51 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/9] powerpc/pseries: remove the ppc-cmm file system
Message-ID: <YEjz/+HfILCUwKwb@zeniv-ca.linux.org.uk>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-4-hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Nadav Amit <namit@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
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

On Tue, Mar 09, 2021 at 04:53:42PM +0100, Christoph Hellwig wrote:
> Just use the generic anon_inode file system.

Umm...  The only problem I see here is the lifetime rules for
that module, and that's not something introduced in this patchset.
Said that, looks like the logics around that place is duplicated in
cmm.c, vmw_balloon.c and virtion_balloon.c and I wonder if it would
be better off with a helper in mm/balloon.c to be used for that setup...
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
