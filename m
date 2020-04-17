Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0931AD4C6
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 05:18:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E1CBD8626E;
	Fri, 17 Apr 2020 03:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EUYFbMFJCCys; Fri, 17 Apr 2020 03:18:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7ECA286103;
	Fri, 17 Apr 2020 03:18:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 653A2C0172;
	Fri, 17 Apr 2020 03:18:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7265EC0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5C96A86762
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Inq1VZSZBmNV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D191E86761
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 03:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xmaDAhB15m0ca2yw6/7wplovyJ4mJvftQ1TLrqWm/Bs=; b=uiJbu0G1PjxFYlCSgI8qpa82CM
 Jf+ghD0cfM+a0KMTUbFMACA5EI30uXjNpMD2zEISEXPmSYXqhyQKEEbwzH9AqUF93nG2bU1CYOzdf
 uE/0aMhq/Wos8A3WC8t9YU+3Op0i5gKNNEQAk31rtCtemFtzZIR/azxEBpo2EXcKBSQkP6HtuGthY
 tiQhNZ0SPuOroFAl1dURRnnCTLGW193jGaDnIbzveztLpLC2zHPVjSUNOiJwoV8l6f4CTeySJ3FAl
 Y1OhirdABmEj06Gq4QJ1bf5rERxHsavdWdgGHxieEQ0RbgyAutTgpaTeiGSmXgCGDBfJeUaOxUD/y
 hv+0N98g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jPHVg-0002Ji-ML; Fri, 17 Apr 2020 03:17:44 +0000
Date: Thu, 16 Apr 2020 20:17:44 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: improve use_mm / unuse_mm v2
Message-ID: <20200417031744.GI5820@bombadil.infradead.org>
References: <20200416053158.586887-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416053158.586887-1-hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 amd-gfx@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Zhi Wang <zhi.a.wang@intel.com>
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

On Thu, Apr 16, 2020 at 07:31:55AM +0200, Christoph Hellwig wrote:
> this series improves the use_mm / unuse_mm interface by better
> documenting the assumptions, and my taking the set_fs manipulations
> spread over the callers into the core API.

I appreciate all the work you're doing here.

Do you have plans to introduce a better-named API than set_fs() / get_fs()?

Also, having set_fs() return the previous value of 'fs' would simplify
a lot of the callers.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
