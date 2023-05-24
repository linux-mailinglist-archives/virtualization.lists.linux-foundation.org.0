Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63D70EBD5
	for <lists.virtualization@lfdr.de>; Wed, 24 May 2023 05:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E3C60A67;
	Wed, 24 May 2023 03:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E3C60A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2HWIJJznODt; Wed, 24 May 2023 03:24:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3D99C61546;
	Wed, 24 May 2023 03:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D99C61546
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66C86C007C;
	Wed, 24 May 2023 03:24:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2C94C002A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 May 2023 03:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99A8B4098A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 May 2023 03:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99A8B4098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5FT0POoiVFIi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 May 2023 03:24:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA0640984
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFA0640984
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 May 2023 03:24:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R801e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
 TI=SMTPD_---0VjMN4.3_1684898634; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VjMN4.3_1684898634) by smtp.aliyun-inc.com;
 Wed, 24 May 2023 11:23:55 +0800
Message-ID: <1684898553.0811157-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v9 04/12] virtio_ring: virtqueue_add() support
 premapped
Date: Wed, 24 May 2023 11:22:33 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230517022249.20790-1-xuanzhuo@linux.alibaba.com>
 <20230517022249.20790-5-xuanzhuo@linux.alibaba.com>
 <ZGxXLpEXlk+sg2BM@infradead.org>
 <20230523031632-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230523031632-mutt-send-email-mst@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
 virtualization@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, 23 May 2023 03:19:42 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Mon, May 22, 2023 at 11:03:26PM -0700, Christoph Hellwig wrote:
> > On Wed, May 17, 2023 at 10:22:41AM +0800, Xuan Zhuo wrote:
> > > virtuque_add() adds parameter premapped.
> >
> > Well, I can see that.  But why?
>
> Assuming it's intentional, it should say something along the lines of
> "The parameter is unused for now, and all callers just pass false.
>  It will be used by a follow-up patch".

I agree.

Will fix.

>
> It's not a bad way to split patches, this way actual logic in
> the next patch stands out as opposed to being masked by
> the code reshuffling following the extra parameter.

I think so.

Thanks.


>
> --
> MST
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
