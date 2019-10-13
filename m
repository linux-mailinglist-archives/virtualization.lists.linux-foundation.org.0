Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E78AD5632
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 14:28:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5EBBF2391;
	Sun, 13 Oct 2019 12:27:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 00FC32387
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 12:20:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 848D65D3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 12:20:53 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C688F82DA
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 12:20:52 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id x62so14152846qkb.7
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 05:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=sGSWm+VQXM5N7LkmMBoNiFJID9rxkV4UgGbQSywZ0lY=;
	b=WSLEhabc8qhsnXw1M2RBTOARSN9AF8Cf4MTA2BGn1U/o99MuBrl/DBoQsHS3m+/a6m
	/l/yZIOX2w01Q8DEeDlg2E7CONGRErMch5rmIl5eRlnreaXGvxYL53FyTwX8DyzcRN82
	vIAATHIpwUGLkWHPDTqp0/yqw32os42uDJkEwuvSKML5g/w8ZZCqcD95+o0ytT7IHMI1
	zHKj+zeJLoIzq98JrSHX1zJiVvk6y901D/7jmHGjp+cOxJh/jFIj+eOi7iPiT/DHsQE7
	8Yx7evzMkKB0nK8YNbAKclbdZn8hxlKz+anixcBoIs8FmzovUIqQllbrPfL162mwbx6J
	EZMQ==
X-Gm-Message-State: APjAAAWpRTfAfpdeOOV6UFteo/OBYFv32fdYXjErckst/X907yVRt4vE
	T1T3Bxi7CjJ+8VLnRCU8lG9Ovw1njS8NryZ+y0rmFfAy3oZp90w5Noay8wMFlC8fm+ScPEXQ71l
	FtDa+XmQk3X4RYKoMD3/FPXkDB5s5fjpladvz6RxIRA==
X-Received: by 2002:ac8:610e:: with SMTP id a14mr27955173qtm.189.1570969252116;
	Sun, 13 Oct 2019 05:20:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyh+vun7Xp3yoPFQiELIdRCqqNlbWf3RdBCpLjK1jdAhUPgwQp14PoZIlUScyHDNFQhMA16jw==
X-Received: by 2002:ac8:610e:: with SMTP id a14mr27955160qtm.189.1570969251921;
	Sun, 13 Oct 2019 05:20:51 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	m14sm6458463qki.27.2019.10.13.05.20.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 05:20:51 -0700 (PDT)
Date: Sun, 13 Oct 2019 08:20:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@web.de>
Subject: Re: [PATCH] tools/virtio: Fix build
Message-ID: <20191013081541-mutt-send-email-mst@kernel.org>
References: <4b686914-075b-a0a9-c97b-9def82ee0336@web.de>
	<20191013075107-mutt-send-email-mst@kernel.org>
	<08c1e081-765b-7c3a-ed31-2059dc521fd0@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08c1e081-765b-7c3a-ed31-2059dc521fd0@web.de>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

On Sun, Oct 13, 2019 at 02:01:03PM +0200, Jan Kiszka wrote:
> On 13.10.19 13:52, Michael S. Tsirkin wrote:
> > On Sun, Oct 13, 2019 at 11:03:30AM +0200, Jan Kiszka wrote:
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> Various changes in the recent kernel versions broke the build due to
> >> missing function and header stubs.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >
> > Thanks!
> > I think it's already fixes in the vhost tree.
> > That tree also includes a bugfix for the test.
> > Can you pls give it a spin and report?
> 
> Mostly fixed: the xen_domain stup is missing.
> 
> Jan

That's in xen/xen.h. Do you still see any build errors?

> > Thanks!
> >
> >> ---
> >>  tools/virtio/crypto/hash.h       | 0
> >>  tools/virtio/linux/dma-mapping.h | 2 ++
> >>  tools/virtio/linux/kernel.h      | 2 ++
> >>  3 files changed, 4 insertions(+)
> >>  create mode 100644 tools/virtio/crypto/hash.h
> >>
> >> diff --git a/tools/virtio/crypto/hash.h b/tools/virtio/crypto/hash.h
> >> new file mode 100644
> >> index 000000000000..e69de29bb2d1
> >> diff --git a/tools/virtio/linux/dma-mapping.h b/tools/virtio/linux/dma-mapping.h
> >> index f91aeb5fe571..db96cb4bf877 100644
> >> --- a/tools/virtio/linux/dma-mapping.h
> >> +++ b/tools/virtio/linux/dma-mapping.h
> >> @@ -29,4 +29,6 @@ enum dma_data_direction {
> >>  #define dma_unmap_single(...) do { } while (0)
> >>  #define dma_unmap_page(...) do { } while (0)
> >>
> >> +#define dma_max_mapping_size(d)	0
> >> +
> >>  #endif
> >> diff --git a/tools/virtio/linux/kernel.h b/tools/virtio/linux/kernel.h
> >> index 6683b4a70b05..ccf321173210 100644
> >> --- a/tools/virtio/linux/kernel.h
> >> +++ b/tools/virtio/linux/kernel.h
> >> @@ -141,4 +141,6 @@ static inline void free_page(unsigned long addr)
> >>  #define list_for_each_entry(a, b, c) while (0)
> >>  /* end of stubs */
> >>
> >> +#define xen_domain() 0
> >> +
> >>  #endif /* KERNEL_H */
> >> --
> >> 2.16.4
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
