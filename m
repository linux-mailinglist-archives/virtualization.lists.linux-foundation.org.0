Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4CA717A
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 19:15:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C9BD8E4A;
	Tue,  3 Sep 2019 17:15:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B1F8AE3E
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 17:15:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4D96D712
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 17:15:24 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9C4410F09
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 17:15:23 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id u7so8939393qtg.7
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 10:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=t6tGfYo/dTj24n3kyKLuufR3DdwgMhB7RVSFb+mWOVs=;
	b=aTayk4YuL0uoxvjsGwFYP+uJdEqT58NDLkGhHLTIU7tSGPIgLmWl3550REN9LKVW0K
	5d68YBFqJIFLQugpaaHdTIdA+ShpqjNVZ9NQdTuv57EF7nxrF07/R88pdqvoboLQzhyz
	qmzjfcDic6iCXZu9qNTJ8zIVeRBrLc4byRXhYrssczeIHQrjGI9jNz1isjw7ccZk4BOG
	eBse83p+kovV3nglcOz/sKk2FYMIw66tL0yMPDYiTkn3cGW0Mzm/5taxMq4sLLMBxB0Y
	ob3ZAoEkVW3u1c2RmDmSP6xBSwq74gTmLT3uqYmm9WAd7BsM/1D/mbUuBLHF8RhnjW7p
	+bgA==
X-Gm-Message-State: APjAAAVYSd36u3z9uU1YdKefAZdpJzzMlfOrpUky1u0WDCP/0WWgi6/l
	Gg1OhEk/nlUO+3IFwpapuDg0wU37//Nl0TrdUFDWFByf7aNyUSpWxyUEo38BfRb6bUalyWH/nkI
	g3c1JZxC2FqlQ9DIh90DEa73WJdN8n+NVS9P2mvZM3Q==
X-Received: by 2002:a05:620a:15cc:: with SMTP id
	o12mr12890162qkm.140.1567530923143; 
	Tue, 03 Sep 2019 10:15:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTXnMlZHpGHJ4mdlNJD+IRREku2Hx5W9v7Fh85/S/pmi7c/BEoxrqFXUQUyWjzlWCWQwErAg==
X-Received: by 2002:a05:620a:15cc:: with SMTP id
	o12mr12890124qkm.140.1567530922908; 
	Tue, 03 Sep 2019 10:15:22 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id t2sm8561495qkm.34.2019.09.03.10.15.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 10:15:21 -0700 (PDT)
Date: Tue, 3 Sep 2019 13:15:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v3 00/13] virtio-fs: shared file system for virtual
	machines
Message-ID: <20190903111628-mutt-send-email-mst@kernel.org>
References: <20190821173742.24574-1-vgoyal@redhat.com>
	<CAJfpegvPTxkaNhXWhiQSprSJqyW1cLXeZEz6x_f0PxCd-yzHQg@mail.gmail.com>
	<20190903041507-mutt-send-email-mst@kernel.org>
	<20190903140752.GA10983@redhat.com>
	<20190903101001-mutt-send-email-mst@kernel.org>
	<20190903141851.GC10983@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903141851.GC10983@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
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

On Tue, Sep 03, 2019 at 10:18:51AM -0400, Vivek Goyal wrote:
> On Tue, Sep 03, 2019 at 10:12:16AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Sep 03, 2019 at 10:07:52AM -0400, Vivek Goyal wrote:
> > > On Tue, Sep 03, 2019 at 04:31:38AM -0400, Michael S. Tsirkin wrote:
> > > 
> > > [..]
> > > > +	/* TODO lock */
> > > > give me pause.
> > > > 
> > > > Cleanup generally seems broken to me - what pauses the FS
> > > 
> > > I am looking into device removal aspect of it now. Thinking of adding
> > > a reference count to virtiofs device and possibly also a bit flag to
> > > indicate if device is still alive. That way, we should be able to cleanup
> > > device more gracefully.
> > 
> > Generally, the way to cleanup things is to first disconnect device from
> > linux so linux won't send new requests, wait for old ones to finish.
> 
> I was thinking of following.
> 
> - Set a flag on device to indicate device is dead and not queue new
>   requests. Device removal call can set this flag.
> 
> - Return errors when fs code tries to queue new request.
> 
> - Drop device creation reference in device removal path. If device is
>   mounted at the time of removal, that reference will still be active
>   and device state will not be cleaned up in kernel yet.
> 
> - User unmounts the fs, and that will drop last reference to device and
>   will lead to cleanup of in kernel state of the device.
> 
> Does that sound reasonable.
> 
> Vivek

Just we aware of the fact that virtio device, all vqs etc
will be gone by the time remove returns.


-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
