Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 477BD1A66F0
	for <lists.virtualization@lfdr.de>; Mon, 13 Apr 2020 15:27:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D2C312035C;
	Mon, 13 Apr 2020 13:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y05fzDn18M8s; Mon, 13 Apr 2020 13:27:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 35D48203EB;
	Mon, 13 Apr 2020 13:27:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2617FC0172;
	Mon, 13 Apr 2020 13:27:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49533C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37F6485735
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fq7Uo3TdGtMh
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:27:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A4BC885727
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 13:27:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AEBD868BEB; Mon, 13 Apr 2020 15:27:30 +0200 (CEST)
Date: Mon, 13 Apr 2020 15:27:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 2/6] i915/gvt/kvm: a NULL ->mm does not mean a thread
 is a kthread
Message-ID: <20200413132730.GB14455@lst.de>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-3-hch@lst.de>
 <20200407030845.GA10586@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407030845.GA10586@joy-OptiPlex-7040>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, intel-gvt-dev@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, linux-mm@kvack.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 virtualization@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>, Al Viro <viro@zeniv.linux.org.uk>
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

On Mon, Apr 06, 2020 at 11:08:46PM -0400, Yan Zhao wrote:
> hi
> we were removing this code. see
> https://lore.kernel.org/kvm/20200313031109.7989-1-yan.y.zhao@intel.com/

This didn't make 5.7-rc1.

> The implementation of vfio_dma_rw() has been in vfio next tree.
> https://github.com/awilliam/linux-vfio/commit/8d46c0cca5f4dc0538173d62cd36b1119b5105bc


This made 5.7-rc1, so I'll update the series to take it into account.

T
> in vfio_dma_rw(),  we still use
> bool kthread = current->mm == NULL.
> because if current->mm != NULL and current->flags & PF_KTHREAD, instead
> of calling use_mm(), we first check if (current->mm == mm) and allow copy_to_user() if it's true.
> 
> Do you think it's all right?

I can't think of another way for a kernel thread to have a mm indeed.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
