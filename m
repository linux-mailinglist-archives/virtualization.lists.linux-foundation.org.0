Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F0436571
	for <lists.virtualization@lfdr.de>; Wed,  5 Jun 2019 22:27:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CB13286D;
	Wed,  5 Jun 2019 20:27:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1D04486D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 20:27:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AD26519B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 20:27:22 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id s15so56338qtk.9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 05 Jun 2019 13:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=wGxHiQlWFn1uiPqF46GhGASLxDFDSqAuue1nQQO+VCs=;
	b=LNZXla4nbx7bUiGw0TNxDGFEYQtqApZ+D56BC8eeiYYjd4JOYeB5opSul4geEZ1GFX
	DjVijzxNM9WllMsYr5RfEQHdjhgFALJvzGmL8gcmcVBZhceiCD1Nxb/eFKh/iS/Xhxkq
	bc8q0niiVmR67u07QgU94r4XZxImFAVrfpZk01vNHGm2PkGb1fiCob8ulgYR3L16Y61a
	58hw+RBec1jpOm2Q/AMmIvKJe23kiiVBs2s3wmj/vsNxmT9ZduRgOBk9LMl3BIXefgNu
	CZvH4riIks4sDlx+0hNkeTf2K8D1yqxqeaW0BlywqXRZKhbqLaQYizU/9EfsCmfAqgCH
	ptHA==
X-Gm-Message-State: APjAAAWL5WCAsXDoSj4BlTc+ae0ySkMn2FUXI1m5soPulhs40G0H8MYS
	nY5eFZ7uNuBJ4DyJyMzpkfcPjA==
X-Google-Smtp-Source: APXvYqyNZwCNllCffk9CW8iJVZnNw6kyLj1Wao5YfIYT6vXREYUpwAyvBsDlsGb5oilKvNDw7Zk3hw==
X-Received: by 2002:aed:254c:: with SMTP id w12mr37738167qtc.127.1559766441824;
	Wed, 05 Jun 2019 13:27:21 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	z20sm14611825qtz.34.2019.06.05.13.27.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 13:27:20 -0700 (PDT)
Date: Wed, 5 Jun 2019 16:27:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 0/6] vhost: accelerate metadata access
Message-ID: <20190605162631-mutt-send-email-mst@kernel.org>
References: <20190524081218.2502-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524081218.2502-1-jasowang@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: hch@infradead.org, linux-parisc@vger.kernel.org, kvm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	jglisse@redhat.com, jrdr.linux@gmail.com, davem@davemloft.net,
	linux-arm-kernel@lists.infradead.org, christophe.de.dinechin@gmail.com
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

On Fri, May 24, 2019 at 04:12:12AM -0400, Jason Wang wrote:
> Hi:
> 
> This series tries to access virtqueue metadata through kernel virtual
> address instead of copy_user() friends since they had too much
> overheads like checks, spec barriers or even hardware feature
> toggling like SMAP. This is done through setup kernel address through
> direct mapping and co-opreate VM management with MMU notifiers.
> 
> Test shows about 23% improvement on TX PPS. TCP_STREAM doesn't see
> obvious improvement.
> 
> Thanks


Thanks this is queued for next.

Did you want to rebase and repost packed ring support on top?
IIUC it's on par with split ring with these patches.


> Changes from RFC V3:
> - rebase to net-next
> - Tweak on the comments
> Changes from RFC V2:
> - switch to use direct mapping instead of vmap()
> - switch to use spinlock + RCU to synchronize MMU notifier and vhost
>   data/control path
> - set dirty pages in the invalidation callbacks
> - always use copy_to/from_users() friends for the archs that may need
>   flush_dcache_pages()
> - various minor fixes
> Changes from V4:
> - use invalidate_range() instead of invalidate_range_start()
> - track dirty pages
> Changes from V3:
> - don't try to use vmap for file backed pages
> - rebase to master
> Changes from V2:
> - fix buggy range overlapping check
> - tear down MMU notifier during vhost ioctl to make sure
>   invalidation request can read metadata userspace address and vq size
>   without holding vq mutex.
> Changes from V1:
> - instead of pinning pages, use MMU notifier to invalidate vmaps
>   and remap duing metadata prefetch
> - fix build warning on MIPS
> 
> Jason Wang (6):
>   vhost: generalize adding used elem
>   vhost: fine grain userspace memory accessors
>   vhost: rename vq_iotlb_prefetch() to vq_meta_prefetch()
>   vhost: introduce helpers to get the size of metadata area
>   vhost: factor out setting vring addr and num
>   vhost: access vq metadata through kernel virtual address
> 
>  drivers/vhost/net.c   |   4 +-
>  drivers/vhost/vhost.c | 850 ++++++++++++++++++++++++++++++++++++------
>  drivers/vhost/vhost.h |  38 +-
>  3 files changed, 766 insertions(+), 126 deletions(-)
> 
> -- 
> 2.18.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
