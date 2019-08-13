Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B58BED4
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 18:41:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1F04EDAC;
	Tue, 13 Aug 2019 16:41:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6D50DC87
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 16:41:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 691378D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7HlWwLFzCOZ7QQzVMV27bTyBbuYurJG67TdGyoRs0fo=;
	b=MG4m3VyHxaBDt/hiB/6nJ65WT
	b9Emowpcs+4HzgPIxmnraEW2+NFya3pXsJqx0S8UbklD6unAQ440ZPfk/zs9iuo2ojw7YF3XpQNqU
	iWQLBbQAx3tKFWzwOmMqGdgMqVC4dkSROVMEOa+09M/2vCct8HDQwhsXjUpVAkljtlKuwE1fG20VN
	HJxyfbbJrM+FgMUi0BFqDeZQGMvItaJU5kREdwtYCZTrNVG98Ys6PLgUbVWzroCggRKDKodRocPuB
	2a1h94b6GBDUPat/0+u1o1LGSsIScGeECk/QhTkMpWqbOxzKJ6DY4oAmPhzadn3POONzyq6oDZlyI
	cx9F5vrwg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hxZr7-0000hw-Tj; Tue, 13 Aug 2019 16:41:05 +0000
Date: Tue, 13 Aug 2019 09:41:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
Message-ID: <20190813164105.GD22640@infradead.org>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<20190812130252.GE24457@ziepe.ca>
	<9a9641fe-b48f-f32a-eecc-af9c2f4fbe0e@redhat.com>
	<20190813115707.GC29508@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813115707.GC29508@ziepe.ca>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

On Tue, Aug 13, 2019 at 08:57:07AM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 13, 2019 at 04:31:07PM +0800, Jason Wang wrote:
> 
> > What kind of issues do you see? Spinlock is to synchronize GUP with MMU
> > notifier in this series.
> 
> A GUP that can't sleep can't pagefault which makes it a really weird
> pattern

get_user_pages/get_user_pages_fast must not be called under a spinlock.
We have the somewhat misnamed __get_user_page_fast that just does a
lookup for existing pages and never faults for a few places that need
to do that lookup from contexts where we can't sleep.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
