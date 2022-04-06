Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A94F5472
	for <lists.virtualization@lfdr.de>; Wed,  6 Apr 2022 07:01:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07FC181A23;
	Wed,  6 Apr 2022 05:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kth9P6I3Mbm7; Wed,  6 Apr 2022 05:01:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C38D481A27;
	Wed,  6 Apr 2022 05:01:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F259C0073;
	Wed,  6 Apr 2022 05:01:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A30F6C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Apr 2022 05:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D81417A2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Apr 2022 05:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKY_NGbu0WAJ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Apr 2022 05:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DA104179F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Apr 2022 05:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=2GBf4ZnnvBSpC2vVaeKLWh6Fik
 jb9DqD5QI2viAIC2x9E6pOAj0PnJKwpE8CztdAxzxN2/76E1RqrKxW9wq5sJfJ156Txhut0UCL6Rf
 fj0067jIm1eDFYCZCYO/hWRRCAoX2k3kHNhwxnzHBzbir62XWq/vb+HwIEpNkDPM+GFhp3qHJrq3h
 wL8ltm/ZxhvrempV78BtKAixfIAXqOGN3RATPtfcoBLb/IRi3P8KHaHqnptJJti2rOxd9PWnBUBVQ
 IFuo/O6eTqFR6sDC3RFZyZJKI3Z/Zc40C8Eh5gTwEuPzrZmytx+M5NqAcGhRGHZdKqFKnxdvv/j+M
 D0Fsw4rg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nbxnI-003n2c-JX; Wed, 06 Apr 2022 05:01:24 +0000
Date: Tue, 5 Apr 2022 22:01:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Suwan Kim <suwan.kim027@gmail.com>
Subject: Re: [PATCH v5 2/2] virtio-blk: support mq_ops->queue_rqs()
Message-ID: <Yk0epKFLV6SdO+CM@infradead.org>
References: <20220405150924.147021-1-suwan.kim027@gmail.com>
 <20220405150924.147021-3-suwan.kim027@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405150924.147021-3-suwan.kim027@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: mgurtovoy@nvidia.com, linux-block@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 stefanha@redhat.com, pbonzini@redhat.com
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
