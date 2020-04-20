Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3F1B0468
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 10:29:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6EA5A2050E;
	Mon, 20 Apr 2020 08:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJF05RrgAroQ; Mon, 20 Apr 2020 08:29:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B06F320005;
	Mon, 20 Apr 2020 08:29:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97184C0177;
	Mon, 20 Apr 2020 08:29:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D9D2C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 08:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 247A7857D5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 08:29:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dP8ze5dfidA0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 08:29:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BD07E8502B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IqO0rH/XwB4jj2Xbm/MnV+bQAuc82OBA3N+hT9MUMh0=; b=d2qXA6v+SNk5E4HWTuJcwW6zBn
 DB1oSYdGQF1W4KKLZf9Ds+4wUNsRVg365/r3rjS/0JSpP8Vsh4xWwpOBUjf1/vp3uslgkQN80gG6h
 yMBJFQ1pwH9iKLSriw3RG73+stuI6syQo8t9T0BIp4KRaBcmjYmKuwg4LqryDDL2X2fYVyXIRkUl0
 7WaB1Z+4BzMMXn3uzsNjSpRav6VqCOwDAi5ZAjUAwF/5JAuEDpOqmS86f2gPR940LS5e+0fOlAnMS
 Ml+O+FzmAu+Pqptaid6xzcjqQEpgnjNFfs9zpfvZ/LME9fc+V1v+1WJZLxJk1eX42+EGk5JwdGlGe
 /iRiWEhw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jQRnh-0002G7-Jz; Mon, 20 Apr 2020 08:29:09 +0000
Date: Mon, 20 Apr 2020 01:29:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] vhost: disable for OABI
Message-ID: <20200420082909.GA28749@infradead.org>
References: <20200416221902.5801-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416221902.5801-1-mst@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>, kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>, linux-kernel@vger.kernel.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>
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

On Thu, Apr 16, 2020 at 06:20:20PM -0400, Michael S. Tsirkin wrote:
> vhost is currently broken on the some ARM configs.
> 
> The reason is that that uses apcs-gnu which is the ancient OABI that is been
> deprecated for a long time.
> 
> Given that virtio support on such ancient systems is not needed in the
> first place, let's just add something along the lines of
> 
> 	depends on !ARM || AEABI
> 
> to the virtio Kconfig declaration, and add a comment that it has to do
> with struct member alignment.
> 
> Note: we can't make VHOST and VHOST_RING themselves have
> a dependency since these are selected. Add a new symbol for that.

This description is horrible.  The only interesting thing for ARM OABI
is that it has some strange padding rules, but that isn't something
that can't be handled.   Please spend some time looking into the issue
and add te proper __padded annotations, we've done that elsewhere in
the kernel and it isn't too bad - in fact it helps understanding issues
with implicit alignment.

And even if you have a good reason not to fix vhost (which I think you
don't have) this changelog is just utter crap, as it fails to mention
what the problem with ARM OABI even is.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
