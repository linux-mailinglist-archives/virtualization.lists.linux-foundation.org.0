Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D1ABA98
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 16:17:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9737B2393;
	Fri,  6 Sep 2019 14:17:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E46B92356
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:17:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 99DF3756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:17:51 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 315A84E924
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 14:17:51 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id 91so6443561qtf.13
	for <virtualization@lists.linux-foundation.org>;
	Fri, 06 Sep 2019 07:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=tzDszuqoBQ88xDVaM9hs1cwB75PSJweaPTjm/VD0ZjM=;
	b=n8JKrLWDgGTWKIxMCWtKOZqHSn8CY+a3LlvOOgJdwWDyCR/YdaUhAvuyDu7bsUcyAZ
	q5F5Ox2ALH16vwjdpniMP1DVU+4AS6TJK0zRWvTUf+uV5/o7ziQ4HUqvvRwVpHakoR2i
	vxXBXzVjkiZOrpGuNJ4D1ZW6r9WBm8j6KGfsEKE6awXFCUkMZq4KOYGJsw9eG6xk+mkX
	KpzD/aqktm1j/C70boNwlIh51n1G0DxOtw+/l+I0HCyVzg1vRX6/+Sv475VasGrOQxI/
	aMTyJdvPdurgHQoyK1eIJj7PYTlE74Ha1kGg591b0Z2DzrjZPVRufYKd5KvCdurMPERV
	G8CQ==
X-Gm-Message-State: APjAAAXoQ/9DckNnjW+YODR6/WHkT9nk4dzFQioPEf1SuEudPervincU
	/f5AT2ptgtyH+3VzlpJAGZj+5C80EprlYt6IG9IlPFCqpr9MaTxPK/4Zoy/TCIFOF1lc4RFiKax
	lI63JXzkbjetoDerY0Ur08M5KH3miuwyteC2BZMcMHA==
X-Received: by 2002:ac8:4510:: with SMTP id q16mr8952803qtn.247.1567779470606; 
	Fri, 06 Sep 2019 07:17:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQiC3PC9TmfSYzvcGUcmmMs1BRVachZAgmwDWOQxgs/xawnMqIPU9mszTB1/u4msJYq21W3A==
X-Received: by 2002:ac8:4510:: with SMTP id q16mr8952787qtn.247.1567779470471; 
	Fri, 06 Sep 2019 07:17:50 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id z5sm3254157qtb.49.2019.09.06.07.17.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 07:17:49 -0700 (PDT)
Date: Fri, 6 Sep 2019 10:17:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH 00/18] virtiofs: Fix various races and cleanups round 1
Message-ID: <20190906101339-mutt-send-email-mst@kernel.org>
References: <20190905194859.16219-1-vgoyal@redhat.com>
	<CAJfpegu8POz9gC4MDEcXxDWBD0giUNFgJhMEzntJX_u4+cS9Zw@mail.gmail.com>
	<20190906103613.GH5900@stefanha-x1.localdomain>
	<CAJfpegudNVZitQ5L8gPvA45mRPFDk9fhyboceVW6xShpJ4mLww@mail.gmail.com>
	<20190906120817.GA22083@redhat.com>
	<20190906095428-mutt-send-email-mst@kernel.org>
	<CAJfpeguVvwRCi7+23W2qA+KHeoaYaR7uKsX+JykC3HK00uGSNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpeguVvwRCi7+23W2qA+KHeoaYaR7uKsX+JykC3HK00uGSNQ@mail.gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	virtio-fs@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-fsdevel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>
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

On Fri, Sep 06, 2019 at 04:11:45PM +0200, Miklos Szeredi wrote:
> This is not a drop in replacement for blk and scsi transports.  More
> for virtio-9p.  Does that have anything similar?

9p seems to supports unplug, yes. It's not great in that it
blocks until we close the channel, but it's there and
it does not crash or leak memory.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
