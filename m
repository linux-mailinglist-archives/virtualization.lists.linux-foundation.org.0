Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F14963652CE
	for <lists.virtualization@lfdr.de>; Tue, 20 Apr 2021 09:03:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28EF8833AE;
	Tue, 20 Apr 2021 07:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jj2ZWCT2lKSP; Tue, 20 Apr 2021 07:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78C0B8385D;
	Tue, 20 Apr 2021 07:03:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82592C001B;
	Tue, 20 Apr 2021 07:03:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9237C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 07:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98AEE83478
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 07:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LgusHHPn2I7T
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 07:02:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DB35833AE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 07:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8Oihx25ixLmgK896s6BkBU4Zy4ZTSxg7BY07q9IT2hQ=; b=hFqirIfh+nlo9lCAUemEoOwmcU
 ZMdFNj8RgdzR2qM5APmrrVtR2OeTcERwNN38u6nFxezVx5GJo/xAtYA7HD2DxH0kqehLO52bXBwLe
 4/yxCWMoy1FXMYDGSBjvTS3E9tGAd58v9GOpMqgE+YHl2Vwv1VS5Gu+Zq+IQHvZlk/l2dqxTnG4FG
 MHw2JbqYRC17ffhqd08MnBFxZTB/JNwajHFljefrZWjdnheFvlycOhNYNrNFZHVPMf0UJTWMTKfYK
 P8u11hg1IsH0zaSL1KL7F3EnxipCucT9Xw4ZAr0PB8sF+LfvSOvdTbzuzkN4XE+OubYIRqGoz37Mw
 Jw7zA3AA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYkO1-00Eplv-KX; Tue, 20 Apr 2021 07:01:54 +0000
Date: Tue, 20 Apr 2021 08:01:29 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Enrico Granata <egranata@google.com>
Subject: Re: [PATCH v2] virtio_blk: Add support for lifetime feature
Message-ID: <20210420070129.GA3534874@infradead.org>
References: <20210416194709.155497-1-egranata@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416194709.155497-1-egranata@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
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

Just to despit my 2 cents again:  I think the way this is specified
in the virtio spec is actively harmful and we should not suport it in
Linux.

If others override me we at least need to require a detailed
documentation of these fields as the virto spec does not provide it.

Please also do not add pointless over 80 character lines, and follow
the one value per sysfs file rule.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
