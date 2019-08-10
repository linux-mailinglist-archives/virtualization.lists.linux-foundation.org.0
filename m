Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 15926889FA
	for <lists.virtualization@lfdr.de>; Sat, 10 Aug 2019 10:22:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6D83EA95;
	Sat, 10 Aug 2019 08:22:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 34BA69EE
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 08:22:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E014F6D6
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 08:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eSjbW2TykUVvNLJT+WwW0KK/90QAdp/KYaHkJ5L32Sw=;
	b=ZtaR225x4uz8WxQcy84b810BY
	5V+gDiuwCXnmFGv531/0uJ+JtsxoOyc4WUlx88PAp0kWYV2EJM1WOf2uhGSiJCrApIieirGn/7/1P
	x8KJHXwWoy4jU7Zv40qx/fDwd4WWFfHsrHQ5hHQ7ej/C86hdlUYDnfxU+KWCZdx2574gDHZfT52mc
	T13VqO8BrX8ifrzsx9W08gzc0RvAyva8DNT8eDa+AIalU3S/jsiHBMPv+/i+3q1y8bTG0aaksDvk7
	0LzShH4aAubD1qehsZQS0ANehoF8iOW4P6CU9kkz/WqXq40YZHJB624GVEIzmXBfkKNumHJxrsKjR
	sfp+7+lTA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hwMdU-0003xB-BC; Sat, 10 Aug 2019 08:22:00 +0000
Date: Sat, 10 Aug 2019 01:22:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: use virtio_max_dma_size
Message-ID: <20190810082200.GC30426@infradead.org>
References: <20190808153445.27177-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808153445.27177-1-kraxel@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
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

On Thu, Aug 08, 2019 at 05:34:45PM +0200, Gerd Hoffmann wrote:
> We must make sure our scatterlist segments are not too big, otherwise
> we might see swiotlb failures (happens with sev, also reproducable with
> swiotlb=force).

Btw, any chance I could also draft you to replace the remaining
abuses of swiotlb_max_segment and swiotlb_nr_tbl in drm with proper
dma level interface?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
