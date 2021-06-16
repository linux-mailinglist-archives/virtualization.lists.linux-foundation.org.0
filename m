Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE53A944D
	for <lists.virtualization@lfdr.de>; Wed, 16 Jun 2021 09:43:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF8783981;
	Wed, 16 Jun 2021 07:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ap7TLEfzRQiO; Wed, 16 Jun 2021 07:43:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E1DE6839BF;
	Wed, 16 Jun 2021 07:43:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 603DAC000B;
	Wed, 16 Jun 2021 07:43:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE86AC000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 07:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4AC6838C9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 07:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-XmmZNn47av
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 07:43:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 299FE83935
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 07:43:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 454156736F; Wed, 16 Jun 2021 09:43:11 +0200 (CEST)
Date: Wed, 16 Jun 2021 09:43:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/3] virtio_blk: blk-mq io_poll support
Message-ID: <20210616074310.GA2910@lst.de>
References: <20210520141305.355961-1-stefanha@redhat.com>
 <YLj1kUiTTlLm5HwU@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLj1kUiTTlLm5HwU@stefanha-x1.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Christoph Hellwig <hch@lst.de>
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

On Thu, Jun 03, 2021 at 04:30:25PM +0100, Stefan Hajnoczi wrote:
> Christoph and Jens: Any more thoughts on this irq toggling approach?

I think it would eventually come back and byte us and would much prefer
explicit poll queues.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
