Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA465ED995
	for <lists.virtualization@lfdr.de>; Wed, 28 Sep 2022 11:55:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D71C60AF4;
	Wed, 28 Sep 2022 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D71C60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veRmS5v-tyQK; Wed, 28 Sep 2022 09:55:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 412F660C1F;
	Wed, 28 Sep 2022 09:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 412F660C1F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59900C0078;
	Wed, 28 Sep 2022 09:55:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96A84C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 09:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F882404B2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 09:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F882404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CaKzCdkzPzpd
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 09:55:19 +0000 (UTC)
X-Greylist: delayed 00:09:27 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C21540385
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C21540385
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Sep 2022 09:55:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DF05967373; Wed, 28 Sep 2022 11:45:45 +0200 (CEST)
Date: Wed, 28 Sep 2022 11:45:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v1] virtio_blk: should not use IRQD_AFFINITY_MANAGED in
 init_rq
Message-ID: <20220928094545.GA19646@lst.de>
References: <20220924034854.323-1-angus.chen@jaguarmicro.com>
 <20220927163723-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220927163723-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org,
 Liming Wu <liming.wu@jaguarmicro.com>,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 stefanha@redhat.com, Angus Chen <angus.chen@jaguarmicro.com>,
 pbonzini@redhat.com, tglx@linutronix.de
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

On Tue, Sep 27, 2022 at 04:47:20PM -0400, Michael S. Tsirkin wrote:
> > The log :
> > "genirq: Flags mismatch irq 0. 00000080 (virtio418) vs. 00015a00 (timer)"
> > was print because of the irq 0 is used by timer exclusive,and when
> > vp_find_vqs called vp_find_vqs_msix and return false twice,then it will
> > call vp_find_vqs_intx for the last try.
> > Because vp_dev->pci_dev->irq is zero,so it will be request irq 0 with
> > flag IRQF_SHARED.
> 
> First this is a bug. We can fix that so it will fail more cleanly.
> 
> We should check pci_dev->pin and if 0 do not try to use INT#x
> at all.
> It will still fail, just with a nicer backtrace.

How do we end up with a pci_dev without a valid PIN?  Btw, that whole
vp_find_* code looks extremely fucked up to me.  The whole point of
pci_alloc_irq_vectors* API is that it keeps drivers from poling into
details of MSI-X v MSI vs INTX.

> - because of auto affinity, we try to reserve an interrupt on all CPUs
> - as there are 512 devices with a single vector per VQ we would
>   have no issue as they would be spread between CPUs,
>   but allocating on all CPUs fails.
> 
> 
> I don't think the issue should be fixed at blk level - it is not
> blk specifix - but yes this looks like a problem.
> Christoph, any idea?

I think this goes into the low-level interrupt vector allocator.  I think
Thomas is still the expert on it.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
