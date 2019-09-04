Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC56A875C
	for <lists.virtualization@lfdr.de>; Wed,  4 Sep 2019 20:59:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3A0CA1DD0;
	Wed,  4 Sep 2019 18:59:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E383D1795
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 18:58:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8789D709
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 18:58:48 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C199E368CF
	for <virtualization@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 18:58:47 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id f19so23940596qtq.1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 04 Sep 2019 11:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=/t5VuocUMBlzPtybo/yvo5LJ1+xZJB/CRL/KCkZ7mqs=;
	b=ZtrWs60PCtS67aDIlvs9riEAKkytn+dvrDSFfQpBNNXRSpbmrhgZpotkvm2rl9g7Ov
	RDzRDFR24ho6kfXh4FQXjrA8IhzMIEbITCI8gu9vhWqlBrYUfQ0zDPni17g50QmxDkxr
	4c06Kcj/r8r59Ky9lh31Juyjcyq01mtL4bo1vGJf6AGJBrngaFZwIzAz5QhvuGkWoAje
	XJngOKWcxggjuU+NQLFcSGr9GzIOpd8EQJSTnlGsbLTslKxrc/ZnX+T1lELOrPxbT/gR
	NuNrt2YAQePq05YNhtkRAIhvLw6bLGf1CQbmiYwSNiHJF4jAK9YGhLo8BhX4CJcUR0m0
	CP5A==
X-Gm-Message-State: APjAAAWILT7wRR8lEN6aP3WQPMufeUwZx3Cf5Tq0DwiHFESMcFPPDeXa
	2w+qjR1gik+EV4Vnz/hE8wFCTRScCMM3mOWc4yTDPwO3E809dehUazdBngU+5i/qO9LINaIWHXG
	APNm3Ax8DOYZLsLMh3h1dCJuaCSNz8pQF16afRQyS5w==
X-Received: by 2002:aed:2538:: with SMTP id v53mr15724666qtc.383.1567623527125;
	Wed, 04 Sep 2019 11:58:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxNgEnlGe+yk/4flae5AGAQL9JYjycpkVNDhpjV1tHwEkw6zA96VtT4UHpBEbs9AvgdMwM/Q==
X-Received: by 2002:aed:2538:: with SMTP id v53mr15724648qtc.383.1567623526926;
	Wed, 04 Sep 2019 11:58:46 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id b1sm9712741qkk.8.2019.09.04.11.58.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 11:58:45 -0700 (PDT)
Date: Wed, 4 Sep 2019 14:58:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 15/16] virtio-fs: add virtiofs filesystem
Message-ID: <20190904145656-mutt-send-email-mst@kernel.org>
References: <20190903113640.7984-1-mszeredi@redhat.com>
	<20190903114203.8278-10-mszeredi@redhat.com>
	<20190903092222-mutt-send-email-mst@kernel.org>
	<20190904181630.GB26826@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904181630.GB26826@stefanha-x1.localdomain>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miklos Szeredi <mszeredi@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, Vivek Goyal <vgoyal@redhat.com>
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

On Wed, Sep 04, 2019 at 07:16:30PM +0100, Stefan Hajnoczi wrote:
> On Tue, Sep 03, 2019 at 09:55:49AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Sep 03, 2019 at 01:42:02PM +0200, Miklos Szeredi wrote:
> > Endian-ness for fuse header also looks wrong.
> [...]
> > > +struct virtio_fs_forget {
> > > +	struct fuse_in_header ih;
> > > +	struct fuse_forget_in arg;
> > 
> > These structures are all native endian.
> > 
> > Passing them to host will make cross-endian setups painful to support,
> > and hardware implementations impossible.
> > 
> > How about converting everything to LE?
> 
> The driver dictates the endianness of the FUSE protocol session.  The
> virtio-fs device specification states that the device looks at the first
> request's fuse_in_header::opcode field to detect the guest endianness.
> 
> If it sees FUSE_INIT in its native endianness then no byte-swapping is
> necessary.  If it sees FUSE_INIT in the opposite endianness then
> byte-swapping is necessary on the device side.


You are right.  Pls ignore the comment.  We need to reserve the
byte-swapped FUSE_INIT to make sure future versions of fuse don't try to
send that though.  I sent a patch to that effect, let's see whether it
gets accepted.


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
