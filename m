Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A64964C8C1B
	for <lists.virtualization@lfdr.de>; Tue,  1 Mar 2022 13:59:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D75813ED;
	Tue,  1 Mar 2022 12:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecqxp3liYNzl; Tue,  1 Mar 2022 12:59:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5919F813E5;
	Tue,  1 Mar 2022 12:59:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C58B4C007B;
	Tue,  1 Mar 2022 12:59:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4F1CC001A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 12:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A02CC813ED
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 12:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsWrCbyoQ637
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 12:59:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3570813E5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Mar 2022 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=hiLqSin/KTgGp/pVfKA4oNOQBe
 yBIjl8paEb1t/eX0PsQnx7zim2rAivxjfJjFrlMwMRknc7Q/JJnUDEmhHJsaADJhVovcz965ZSAJs
 4u8nrVRnTD/+Bhkk3ETG1zDwCQdFeT3leQEvLWuqDS3XJCase+Pio7j0tSlloJdVxtatwWW2ixUCf
 Ta+RwFhNV8ZLYTHi41YZdWkexWvpTGOK/I/i7/3+eCvBy7nmrSEXN0wDTH6pWgbZ59Bhade+NnTuB
 EIFRB2ij0J/21YAVnk0HQ+3vN9NDVqLSWotbhJi5R5r8Vi5dSq8+FqT1oeNlsoBgRR8VfWZR+Doue
 6XRcwulg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nP266-00GgOp-J9; Tue, 01 Mar 2022 12:59:22 +0000
Date: Tue, 1 Mar 2022 04:59:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2] virtio-blk: Remove BUG_ON() in virtio_queue_rq()
Message-ID: <Yh4YqjqV0MasKde4@infradead.org>
References: <20220228065720.100-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228065720.100-1-xieyongji@bytedance.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, mst@redhat.com,
 virtualization@lists.linux-foundation.org, hch@infradead.org
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

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
