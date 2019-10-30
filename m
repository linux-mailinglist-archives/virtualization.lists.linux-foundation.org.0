Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF78EA559
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 22:24:50 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 25966FC2;
	Wed, 30 Oct 2019 21:23:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF0F1F9B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 21:23:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8BF0089E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 30 Oct 2019 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=87X+oyehu7JN6cXbNSmkqxhLbbV13utM66QLaFqOq30=;
	b=C0K0acY3VsFEjNSc5aNiAJFe4
	d54AjrBqdl31EiwE3juEmhzyVlbqM+vV8tLM0pK41NKkIBPSSjSJhZxLTJf1ZR1dUzQPd3P7Bfepo
	N5/Js2feq2atD6kIsq2nEI0zR7hMtJPFvxme4ObJ++6o7y3Lv9Q2ez3hM7Ym6z9j6MFfCzNt1u3UN
	DH4xUDvfwjWGNhxU+bGtqYo33RhrKWLa7yiZ4XkUlrrgYqN77HzLVIF3OHkXVDSNjno7AvoAzFX22
	YURfaj2i3xyAz42tT3zZ7C5c1fxke8BVtS/Kq2nwouudZaM5RtFilstS8C0cp7b25PYnwqyWSHF/R
	PnCRVVR8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iPvQu-00034L-4b; Wed, 30 Oct 2019 21:23:12 +0000
Date: Wed, 30 Oct 2019 14:23:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V6 6/6] docs: sample driver to demonstrate how to
	implement virtio-mdev framework
Message-ID: <20191030212312.GA4251@infradead.org>
References: <20191030064444.21166-1-jasowang@redhat.com>
	<20191030064444.21166-7-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030064444.21166-7-jasowang@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: stefanha@redhat.com, christophe.de.dinechin@gmail.com, kvm@vger.kernel.org,
	mst@redhat.com, airlied@linux.ie,
	joonas.lahtinen@linux.intel.com, heiko.carstens@de.ibm.com,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, kwankhede@nvidia.com,
	rob.miller@broadcom.com, linux-s390@vger.kernel.org,
	sebott@linux.ibm.com, lulu@redhat.com, eperezma@redhat.com,
	pasic@linux.ibm.com, borntraeger@de.ibm.com,
	haotian.wang@sifive.com, zhi.a.wang@intel.com,
	farman@linux.ibm.com, idos@mellanox.com, gor@linux.ibm.com,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	xiao.w.wang@intel.com, freude@linux.ibm.com,
	zhenyuw@linux.intel.com, parav@mellanox.com,
	zhihong.wang@intel.com, rodrigo.vivi@intel.com,
	intel-gvt-dev@lists.freedesktop.org, akrowiak@linux.ibm.com,
	oberpar@linux.ibm.com, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
	daniel@ffwll.ch, lingshan.zhu@intel.com
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

On Wed, Oct 30, 2019 at 02:44:44PM +0800, Jason Wang wrote:
> This sample driver creates mdev device that simulate virtio net device
> over virtio mdev transport. The device is implemented through vringh
> and workqueue. A device specific dma ops is to make sure HVA is used
> directly as the IOVA. This should be sufficient for kernel virtio
> driver to work.
> 
> Only 'virtio' type is supported right now. I plan to add 'vhost' type
> on top which requires some virtual IOMMU implemented in this sample
> driver.

Can we please submit a real driver for it?  A more or less useless
sample driver doesn't really qualify for our normal kernel requirements
that infrastructure should have a real user.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
