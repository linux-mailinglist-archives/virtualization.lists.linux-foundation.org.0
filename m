Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4216729
	for <lists.virtualization@lfdr.de>; Tue,  7 May 2019 17:48:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E64F8B6C;
	Tue,  7 May 2019 15:47:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F6FD9EE
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 15:47:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 371B4837
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AEfE8EIktfS0Ycd7e0jTJYMFc8dseypamAWIWa0rG3o=;
	b=bd6vFoKNSwXSMajhrl2bD5JXa+
	949BQ9H3YwErJYagV4BhjxunsD2ny5YZ0430G0I+pOJn8YnxFkqxI9nKJYRGwM//vtTKOkzCjs4rt
	8TespmFYFe4vdW6nb5LVXQproTVdS9nrkUy/1PbZCuB1gLukj8cQUktlRUmkmkhaefaGP/NglLqyi
	AVoWhX6pf3805cm1K0+Z2sNFHotDwCWTEu6ZZJZDN/BD8+8d78uQYfs3UsaanMReFlxTUu8abglXo
	PTUk5GNo/+qm4w1zaI/WrjI6RAH7axxHFyGbCE1v/JcMmsxF4NQuIm4cg+/nTaM2z+2dxlCG9JvOm
	ptbq054Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hO2Jt-0004Hj-Su; Tue, 07 May 2019 15:47:53 +0000
Date: Tue, 7 May 2019 08:47:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC] vhost: don't use kmap() to log dirty pages
Message-ID: <20190507154753.GA8809@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557195809-12373-1-git-send-email-jasowang@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>, kvm@vger.kernel.org, mst@redhat.com,
	Peter Zijlstra <peterz@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
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

On Mon, May 06, 2019 at 10:23:29PM -0400, Jason Wang wrote:
> Note: there're archs (few non popular ones) that don't implement
> futex helper, we can't log dirty pages. We can fix them on top or
> simply disable LOG_ALL features of vhost.

That means vhost now has to depend on HAVE_FUTEX_CMPXCHG to make
sure we have a working implementation.


>  #include <linux/sched/signal.h>
>  #include <linux/interval_tree_generic.h>
>  #include <linux/nospec.h>
> +#include <asm/futex.h>

Also please include the futex maintainers to make sure they are fine
with this first usage of <asm/futex.h> outside of kernel/futex.c.


> +static int set_bit_to_user(int nr, u32 __user *addr)
>  {
>  	unsigned long log = (unsigned long)addr;
>  	struct page *page;
> +	u32 old_log;
>  	int r;
>  
>  	r = get_user_pages_fast(log, 1, 1, &page);
>  	if (r < 0)
>  		return r;
>  	BUG_ON(r != 1);
> +
> +	r = futex_atomic_cmpxchg_inatomic(&old_log, addr, 0, 0);
> +	if (r < 0)
> +		return r;
> +
> +	old_log |= 1 << nr;
> +	r = put_user(old_log, addr);
> +	if (r < 0)
> +		return r;

And this just looks odd to me.  Why do we need the futex call to
replace a 0 value with 0?  Why does it still duplicate the
put_user?  This doesn't look like actually working code to me.

Also don't we need a pagefault_disable() around
futex_atomic_cmpxchg_inatomic?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
